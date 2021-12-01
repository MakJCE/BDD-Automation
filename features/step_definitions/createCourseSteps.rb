$created_user= {}

Given('I click {string} button') do |string|
    click_on(string)
end

When('I click {string} in left side menu') do |string|
    all("a.item").each do |item|
        if item.text == string
            item.click()
        end
    end
end

When('I enter {string} in {string} field') do |value, field|
    $created_user[field] = value
    fields = all('form.form div.field')
    fields.each_with_index do |fi, index|
        label = fi.find('label')
        if label.text == field
            input = fi.find('input')
            input.set(value)
        end
    end
end

When('I enter {string} in {string} dropdown') do |value, field|
    $created_user[field] = value
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
        end
    end
end

When('I enter {string} in {string} textarea') do |value, field|
    $created_user[field] = value
    fields = all('form.form div.field')
    fields.each_with_index do |fi, index|
        label = fi.find('label')
        if label.text == field
            dropdown = fi.find('textarea')
            dropdown.set(value)
        end
    end
end

When('I leave {string} field empty') do |string|
    #do nothing
end

Then('the new course with {string} and {string} is shown in the table') do |topic, profesor|
    # table = find("table")
    # expect(table.has_css?('td', :text => profesor, wait: 0)).to be true
    # expect(table.has_css?('td', :text => topic, wait: 0)).to be true
    sleep 1
    isInTheTable = false
    rows = all("table tr")
    rows.each_with_index do |row, index|
        inThisRow = (row.has_css?('td', :text => profesor, wait: 0) && row.has_css?('td', :text => topic, wait: 0) )
        isInTheTable = inThisRow || isInTheTable
    end
    expect(isInTheTable).to be true
end

Then('the {string} button is disabled') do |string|
    expect(page).to have_button(string, disabled: true)
end
