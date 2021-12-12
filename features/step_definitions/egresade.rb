locatedRow = -1
nombre = ""
attrtocheck = -1
total_user = 0
name = 
Given('I push {string} in left side of the menu') do |string|
    sleep 1
    all("a.item").each do |item|
        if item.text == string
            item.click()
        end
    end
end

When('I upload a valid format .csv file') do
    find('input[type="file"]',:visible => false).set(File.absolute_path('./Egresados/TestFiles/validfile.csv'))
end

When('I upload a invalid format .csv file') do
    find('input[type="file"]',:visible => false).set(File.absolute_path('./Egresados/TestFiles/invalidfile.csv'))
end

When ('I push the Filter Icon button on the top of the table of graduates') do
    find('i.filter.icon').click
end

When ('I push the {string} option') do |filtro|
    find('div.menu.transition.visible div.scrolling.menu.transition div.item span', :text =>filtro).click
end

When('I push {string} button of graduate row with the name {string}') do |boton, alumno|
    nombre = alumno
    rows = all("td.bordes-tabla div.nombre")
    rows.each_with_index do |row, index|
        if row.text == alumno
            locatedRow = index + 1
            break            
        end
    end
    find("table tbody tr:nth-child(#{locatedRow}) td.bordes-tabla-accion button", :text => boton).click
    locatedRow = -1
end

When('I push {string} button of random graduate row') do |boton|
    locatedRow = rand(1..5) + 1
    find("table tbody tr:nth-child(#{locatedRow}) td.bordes-tabla-accion button", :text => boton).click
    locatedRow = -1
end

When('I push {string} button on the confirmation message') do |boton|
    find("div.modals.active div div.actions button",:text => boton).click
end

When('I see the {string} number of graduates filtered') do |filter|
    sleep 1
    puts find('div.pusher div div.tabla h1').text.split[1]
    total_user = total_user + find('div.pusher div div.tabla h1').text.split[1].to_i
end

Then('I should see the total number of graduates should be equal to the sum of Egresade number and Empleade number') do
    sleep 1
    actual = find('div.pusher div div.tabla h1').text.split[1].to_i
    expect(actual).to eql(total_user)
    total_user = 0
end

Then ('I should see the state of the all graduates on {string} or {string}') do |estado1 , estado2|
    allok = true
    graduates = all('tbody tr td:nth-child(4) div.tarjeta-verde')
    graduates.each_with_index do |row, index|
        if "• #{estado1}" != row.text and "• #{estado2}" != row.text
            allok=false
        end
    end
    expect(allok).to be true
end

Then('I should see the state of the all graduates on {string}') do |estado|
    allok = true
    graduates = all('tbody tr td:nth-child(4) div.tarjeta-verde')
    graduates.each_with_index do |row, index|
        if "• #{estado}" != row.text
            allok=false
            puts row.text
        end
    end
    expect(allok).to be true
end

Then("{string} should't been show on the register") do |alumno|
    show_onregister = false
    rows = all("td.bordes-tabla div.nombre")
    rows.each_with_index do |row, index|
        if row.text == alumno
            show_onregister = true
            break            
        end
    end
    expect(show_onregister).to be false
end

Then('{string} should been shown on the register') do |alumno|
    show_onregister = false
    rows = all("td.bordes-tabla div.nombre")
    rows.each_with_index do |row, index|
        if row.text == alumno
            show_onregister = true
            break            
        end
    end
    expect(show_onregister).to be true
end


Then('I can see the personal data of the graduate') do
    sleep 1
    result = find("div div.eleven h1").text
    expect(result).to eql(nombre)
    nombre = ""
end

Then('I can see the personal data of the random graduate') do
    sleep 1
    result = find("div div.eleven h1").text
    expect(result).not_to be_empty
end

Then('I can see his {string} should be {string}') do |campo, valor|
   campos = all("#form-data div.field label span")
   campos.each_with_index do |row, index|
        if row.text == "#{campo}:"
            attrtocheck = index + 1
        end
   end
   result = find("#form-data div:nth-child(#{attrtocheck}) div.input").text
   expect(result).to eql(valor)
end

Then('I can see his {string} datum') do |campo|
   campos = all("#form-data div.field label span")
   campos.each_with_index do |row, index|
        if row.text == "#{campo}:"
            attrtocheck = index + 1
        end
   end
   result = find("#form-data div:nth-child(#{attrtocheck}) div.input").text
   expect(result).not_to be_empty
end

Then('A message of aprove must be showed') do
    sleep 1
    result = find('div.positive.message div.content div.header').text
    expect(result).to eql("Registro exitoso!")
end

Then('A message of error must be showed') do
    sleep 2
    result = find('div.ui.negative.message div.content div.header').text
    expect(result).to eql("Error de carga!")
end

Then('{string} should been shown on the certificate name') do |name|
    sleep 1
    result = find('div.certificado div.datos h1.nombreEgresade').text
    expect(result).to eql(name)
end

Then('A pdf file with the certificate of {string} should been downloaded') do|name|
    File.exist?("C:\\Users\\Home\\Downloads\\#{name}.pdf")
end