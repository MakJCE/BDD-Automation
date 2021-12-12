locatedTopico = -1

When ("I locate the topico named {string} in the list of Topicos") do |string|
    sleep 2
    rows = all("table tr")
    rows.each_with_index do |row, index|
        if row.has_css?('td', :text => string, wait: 0)
            locatedTopico = index
        end
    end
end

When ("I click Editar button of that Topico") do
    sleep 2
    if locatedTopico > 0
        puts locatedTopico
        row = all("table tr")[locatedTopico]
        row.find('button', :text => "Editar").click()
    end
end

When ("I click Editar button confirmation") do 
    find("button.confirmButton", :text => "Editar").click()
end

When('I do not fill the name field') do
    #do nothing
end

Then('Editar confirmation button should be disabled') do
    expect(page.has_css?('button.confirmButton', :text => "Editar", :disabled => true)).to be true
end

Then ("the previous topic named {string} now its name is {string}") do |previous, newName|
    sleep 2
    $created_user = {"Topico" => newName}
    expect(page.has_css?('td', :text => newName)).to be true
end
