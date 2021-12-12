locatedTopico = -1
When ("I locate the row of the Topico with {string} name") do |string|
    sleep 2
    rows = all("table tr")
    rows.each_with_index do |row, index|
        if row.has_css?('td', :text => string, wait: 0)
            locatedTopico = index
        end
    end
end

When ('I click Eliminar button on the located Topico') do
    sleep 2
    if locatedTopico > 0
        row = all("table tr")[locatedTopico]
        row.find('button', :text => "Eliminar").click()
    end
end

Then ('the Topico with {string} name should not to be in the list of topics') do |string|
    sleep 2
    expect(page.has_css?('td', :text => string)).to be false
end