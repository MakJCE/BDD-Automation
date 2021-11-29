When('I push {string} navlink') do |string|
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