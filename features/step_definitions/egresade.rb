locatedRow = -1
nombre = ""
attrtocheck = -1
Given('I push {string} in left side of the menu') do |string|
    sleep 1
    all("a.item").each do |item|
        if item.text == string
            item.click()
        end
    end
end

When('I push {string} button of graduate row with the name {string}') do |boton, alumno|
    nombre = alumno
    rows = all("td.bordes-tabla div.nombre")
    rows.each_with_index do |row, index|
        if row.text == alumno
            locatedRow = index + 1
            puts row.text
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

Then('I can see the personal data of the graduate') do
    sleep 1
    result = find("div div.eleven h1").text
    expect(result).to eql(nombre)
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