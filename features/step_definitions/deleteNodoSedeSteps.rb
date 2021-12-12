locatedNodo = -1
locatedSede = -1

When ('I locate the row of the Nodo with {string} name') do |string|
    sleep 2
    rows = all("table tr")
    rows.each_with_index do |row, index|
        if row.has_css?('td div.column', :text => string, wait: 0)
            locatedNodo = index
        end
    end
end

When ('I locate the Sede named {string} in previuos Nodo') do |string|
    sleep 2
    rows = all("table tr>td")[1].all("td")
    rows.each_with_index do |row, index|
        if row.has_css?('div.label', :text => string, wait: 0)
            locatedSede = index
        end
    end
end

When ('I click Eliminar button on the located Sede') do 
    row = all("table tr>td")[2].all("td")[locatedSede]
    row.find('button', :text => "Eliminar").click()
end

Then ('the Sede with {string} name should not to be in the list of topics') do |string|
    expect(page.has_css?('td div.label', :text => string)).to be false
end