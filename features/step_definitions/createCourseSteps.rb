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

Given('I enter {string} in {string} field') do |value, field|
    fields = all('form.form div.field')
    fields.each_with_index do |fi, index|
        label = fi.find('label')
        if label.text == field
            input = fi.find('input')
            input.set(value)
            sleep 3
        end
    end
end

Given('I enter {string} in {string} dropdown') do |value, field|
    fields = all('form.form div.field')
    fields.each_with_index do |fi, index|
        label = fi.find('label')
        if label.text == field
            dropdown = fi.find('div.dropdown')
            dropdown.click()
            if dropdown.find('span.text', :text => value).visible?
                dropdown.find('span.text', :text => value).click()
            else
                dropdown.find('span.text', :text => value, :visible => false).click()
            end
            sleep 3
        end
    end
end

Given('I enter {string} in {string} textarea') do |value, field|
    fields = all('form.form div.field')
    fields.each_with_index do |fi, index|
        label = fi.find('label')
        if label.text == field
            dropdown = fi.find('textarea')
            dropdown.set(value)
            sleep 3
        end
    end
end

Then('the new course is shown in the table') do
    pending # Write code here that turns the phrase above into concrete actions
end

Then('the {string} button is disabled') do |string|
    expect(page).to have_button(string, disabled: true)
end