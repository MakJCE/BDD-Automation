locatedAlumne = -1

When('I locate the new Alumne with name {string} and lastname {string} in the list') do |name, lastname|
    sleep 2
    rows = all("table tr")
    rows.each_with_index do |row, index|
        if row.has_css?('td', :text => "#{name} #{lastname}", wait: 0)
            locatedAlumne = index
        end
    end
    puts locatedAlumne
end

When ("I click Guardar Cambios button") do
    page.find(:xpath,"/html/body/div[2]/div/div[3]/button[2]").click()
end

When ("I click Editar button of that Alumne") do
    row = all("table tr")[locatedAlumne]
    row.find('button', :text => "Editar").click()
end

Then('I should see the  previous Alumne has the {string} in the {string}') do |value, field|
    row = all("table tr")[locatedAlumne]
    row.find('button', :text => "Editar").click()
    correctValue = false
    sleep 2
    fields = all('form.form div.field')
    fields.each_with_index do |fi, index|
        
        label = fi.find('label')
        if label.text == field
            if fi.has_css?('input')
                input = fi.find('input')
                correctValue = input.value == value
            elsif fi.has_css?('div.dropdown')
                dropdown = fi.find('div.dropdown div.divider.text')
                correctValue = dropdown.text == value
            else
                dropdown = fi.find('textarea')
                correctValue = dropdown.text == value
            end
        end
    end
    if field == "Nombre/s"
        $created_user["nombre"]= value
    elsif field == "Apellidos"
        $created_user["apellido"]= value
    end

    expect(correctValue).to be true
end  