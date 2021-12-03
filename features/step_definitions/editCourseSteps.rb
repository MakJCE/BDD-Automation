$created_user= {"Profesor" => "Juan", "Topico" => "pruebacalidad"}
locatedRow = -1
Given ('I locate the row of the course with {string} topic and Juan as profesor') do |topic|
    sleep 2
    rows = all("table tr")
    rows.each_with_index do |row, index|
        if row.has_css?('td', :text => "Juan", wait: 0) && row.has_css?('td', :text => topic, wait: 0)
            locatedRow = index
        end
    end
end

When ('I click Editar button on the located row') do
    row = all("table tr")[locatedRow]
    row.find('button', :text => "Editar").click()
end

When('I change the {string} with the value {string}') do |field, value|
    $created_user[field] = value
    fields = all('form.form div.field')
    fields.each_with_index do |fi, index|
        label = fi.find('label')
        if label.text == field
            if fi.has_css?('input')
                input = fi.find('input')
                input.set(value)
            elsif fi.has_css?('div.dropdown')
                dropdown = fi.find('div.dropdown')
                dropdown.click()
                if dropdown.find('span.text', :text => value).visible?
                    dropdown.find('span.text', :text => value).click()
                else
                    dropdown.find('span.text', :text => value, :visible => false).click()
                end
            else
                dropdown = fi.find('textarea')
                dropdown.set(value)
            end
        end
    end
end

When ('I click {string} button of the form') do |nameButton|
    find("div.actions button", :text => nameButton).click()
end

Then('the course with {string} topic and Juan profesor should have the {string} in the {string}') do |topic, value, field|
    sleep 1
    isInTheTable = false
    rows = all("table tr")
    rows.each_with_index do |row, index|
        if field == "Sede - Nodo"
            separator = value.split(" ")
            sedeValue, nodoValue = separator[0], separator[2]
            inThisRow = (row.has_css?('td', :text => "Juan", wait: 0) && 
                        row.has_css?('td', :text => topic, wait: 0) && 
                        row.has_css?('td', :text => sedeValue, wait: 0) &&
                        row.has_css?('td', :text => nodoValue, wait: 0) )
        else
            inThisRow = (row.has_css?('td', :text => "Juan", wait: 0) && row.has_css?('td', :text => topic, wait: 0) && row.has_css?('td', :text => value, wait: 0) )
        end
        isInTheTable = inThisRow || isInTheTable
    end
    expect(isInTheTable).to be true
end
