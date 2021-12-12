When('I click state box with down-triangle') do
    page.find('div.selection.dropdown').click()
end

When('I select {string} from the options') do |string|
    page.find('div.menu.transition .item', :text => string).click()
end

Then('The list should show courses with state {string}') do |string|
    sleep 2
    oneStateIsShown = true
    rows = all("table tr")
    rows.each_with_index do |row, index|
        if row.has_css?('button', :text => "Editar")
            row.find('button', :text => "Editar").click()
            sleep 1
            oneStateIsShown = (page.find('html body div#root div div.ui.container div.app div.ui.segment.pushable div.pusher div.opcionesPeriodo div.ui.fluid.labeled.input div.ui.selection.dropdown.custom-select div.divider.text').text == string) && oneStateIsShown
        end
    end
    expect(oneStateIsShown).to be true
end