Given('I click {string} button') do |string|
    click_on(string)
end

Given('I click {string} navlink') do |string|
    all("a.item").each do |item|
        if item.text == string
            item.click()
        end
    end
end

Given('I enter {string} in {string} field') do |string, string2|
    pending # Write code here that turns the phrase above into concrete actions
end

Given('I enter {string} in "Curso Para:"field') do |string|
    pending # Write code here that turns the phrase above into concrete actions
end

Then('the new course is shown in the table') do
    pending # Write code here that turns the phrase above into concrete actions
end

Then('the {string} button is disabled') do |string|
    expect(page).to have_button(string, disabled: true)
end