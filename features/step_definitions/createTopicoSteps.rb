Given('I click {string} section on the horizontal menu on top of the view') do |string|
    find("div.ui.pointing.secondary.menu a", :text => string).click()
end

When ("I enter {string} name in Topico field") do |name|
    page.find("input#Topico").set(name)
end

Then('the topic named {string} should be shown in the table of topics') do |string|
    $created_user = {"Topico" => string}
    expect(page.has_css?("td", :text => string)).to be true
end