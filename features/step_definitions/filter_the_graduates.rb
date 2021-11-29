Given('I push {string} navlink') do |string|
    sleep 2
    find(:xpath, "/html/body/div/div/div[4]/div[2]/div/div[1]/a[4]/a").click
end
When('I push the {string} filter') do |string|
    sleep 2
    find(:xpath, '//*[@id="root"]/div/div[4]/div[2]/div/div[2]/div[1]/div/div[1]').click
end

def get_position(object, list)
    value = 0
    list.each do |sec|
        value = value + 1
        if (sec == object)
            return value
        end
    end
    return -1
end
When('I push the {string} section') do |string|
    sleep 2
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
    list = find(:xpath, "/html/body/div/div/div[4]/div[2]/div/div[2]/div[1]/div/div[2]/div[1]").text
    list = list.split("\n")
    position_section = get_position(sec, list)
    list = find(:xpath, "/html/body/div/div/div[4]/div[2]/div/div[2]/div[1]/div/div[2]/div[1]/div[2]").text
    list = list.split("\n")
    position = get_position(string, list)
    sleep 2
    find(:xpath, '/html/body/div/div/div[4]/div[2]/div/div[2]/div[1]/div/div[2]/div[1]/div[2]/div[1]').click
end

def count_columns(xpath)
    size = 0
    within(:xpath, xpath) do
        size = all('th').count
    end
    return size
end
def get_position_column(object, columns)
    size = count_columns(columns)
    column = 1
    value = ""
    while column <= size do
        value = find(:xpath, columns+"/th["+column.to_s+"]").text
        if (object == value)
            return column
        end
        column = column + 1
    end
    return -1
end

Then('I should see a table with only {string} in {string} column') do |value,column|
    columns = '/html/body/div/div/div[4]/div[2]/div/div[2]/div[2]/table/thead/tr'
    rows = '/html/body/div/div/div[4]/div[2]/div/div[2]/div[2]/table/tbody'
    position = get_position_column(column, columns)
    rows = rows + "/td["+position.to_s+"]"
    within(:xpath, "/html/body/div/div/div[4]/div[2]/div/div[2]/div[2]/table/thead/tr/th[5]") do
        page.should have_content('NODO')
    end
end
#"/html/body/div/div/div[4]/div[2]/div/div[2]/div[2]/table/thead/tr/th[1]"
#"/html/body/div/div/div[4]/div[2]/div/div[2]/div[2]/table/thead/tr/th[5]"
#"/html/body/div/div/div[4]/div[2]/div/div[2]/div[2]/table/tbody/tr[1]/td[5]"
#"/html/body/div/div/div[4]/div[2]/div/div[2]/div[2]/table/tbody/tr[2]/td[5]"
#"/html/body/div/div/div[4]/div[2]/div/div[2]/div[2]/table/tbody/tr[3]/td[5]"