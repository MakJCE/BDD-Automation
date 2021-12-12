When('I click list of courses dropdown') do
    page.find('div.ui.compact.inline.left.pointing.dropdown.link.item').click()
end

When('I select the course with {string} and {string}') do |topic, profesor|
    options = all('div.menu.transition span')
    options.each do |option|
        if (option.text.include? topic) && (option.text.include? profesor)
            option.click()
        end
    end
    sleep 3
end

Then('I should see the new Alumne {string} name and {string} lastname to the end of the list') do |name, lastname|
    $created_user= {"nombre" => name, "apellido" => lastname}
    expect(page.has_css?('table tr td', :text => "#{name} #{lastname}")).to be true
end
