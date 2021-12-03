require './features/step_definitions/lib/empresas.rb'
Given('I push {string} navlink') do |string|
    sleep 2
    find(:xpath, "/html/body/div/div/div[4]/div[2]/div/div[1]/a[4]/a").click
end

Given('I push {string} in left side menu') do |string|
    all("a.item").each do |item|
        if item.text == string
            item.click()
        end
    end
end

When('I push the filter') do
    sleep 2
    find(:xpath, '//*[@id="root"]/div/div[4]/div[2]/div/div[2]/div[1]/div/div[1]').click
end

When('I push the {string} section') do |string|
    sleep 2
    #
    list = find("#root > div > div.ui.container > div.app > div > div.pusher > div.ui.segment > div > div.menu.transition.visible").text
    list = list.split("\n")
    position = get_position(string, list)
    if (position != -1)
        find(:xpath, "/html/body/div/div/div[4]/div[2]/div/div[2]/div[1]/div/div[2]/div["+position.to_s+"]").click
    end
    if (position == -1)
        raise "Section "+string+" not found."
    end
end

When('I push the {string} option of {string} section') do |string,sec|
    list = find(:xpath, "/html/body/div/div/div[4]/div[2]/div/div[2]/div[1]/div/div[2]").text
    list = list.split("\n")
    position_section = get_position(sec, list)

    if (position_section == -1) 
        raise "Section "+string+" not found."
    end
    list = find(:xpath, "/html/body/div/div/div[4]/div[2]/div/div[2]/div[1]/div/div[2]/div["+position_section.to_s+"]/div[2]").text
    list = list.split("\n")
    position = get_position(string, list)

    if (position == -1) 
        raise "Option "+string+" not found."
    end
    sleep 2
    find(:xpath, '/html/body/div/div/div[4]/div[2]/div/div[2]/div[1]/div/div[2]/div['+position_section.to_s+']/div[2]/div['+position.to_s+']').click
end

When('I deselect the filter selected') do
    find(:xpath, "/html/body/div/div/div[4]/div[2]/div/div[2]/div[1]/div[2]/i").click;
end

When('I deselect all filters') do
    find(:xpath, "/html/body/div/div/div[4]/div[2]/div/div[2]/div[1]/a/i").click;
end

Then('I should see a table with only {string} in {string} column') do |value,column|
    columns = '/html/body/div/div/div[4]/div[2]/div/div[2]/div[2]/table/thead/tr'
    rows = '/html/body/div/div/div[4]/div[2]/div/div[2]/div[2]/table/tbody/tr'
    position_column = get_position_column(column, columns)
    if (position_column == -1)
        raise "Column "+column+" not found."
    end
    expect(all_values_are_same(value,position_column,rows)).to be true
end

Then('I should see the buttons {string} in {string} column with the value {string}') do |name_button,column, value|
    columns = '/html/body/div/div/div[4]/div[2]/div/div[2]/div[2]/table/thead/tr'
    rows = '/html/body/div/div/div[4]/div[2]/div/div[2]/div[2]/table/tbody/tr'
    position_column = get_position_column(column, columns)
    if (position_column == -1)
        raise "Column "+column+" not found."
    end
    expect(all_rows_have_the_value(value,position_column,rows,value,"Cerrar")).to be true
end

Then('I should not see {string} filtered section') do |filter|

    has_content = true
    elements = find("#root > div > div.ui.container > div.app > div > div.pusher > div.ui.segment").text
    if (elements.include? filter)
        has_content = true
    else
        has_content = false
    end
    expect(has_content).to be false
end