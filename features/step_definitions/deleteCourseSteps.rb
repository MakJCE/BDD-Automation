locatedRow = -1
Given ('I locate the row of the course with {string} topic and {string} profesor') do |topic, profesor|
    sleep 2
end

When ('I click Eliminar button on the located row') do 
    row = all("table tr")[locatedRow]
    row.find('button', :text => "Eliminar").click()
end

Then ('the course with {string} topic and {string} profesor should not be in the list of courses') do |topic, profesor|
    sleep 1
    isInTheTable = false
    rows = all("table tr")
    rows.each_with_index do |row, index|
        inThisRow = (row.has_css?('td', :text => profesor, wait: 0) && row.has_css?('td', :text => topic, wait: 0) )
        isInTheTable = inThisRow || isInTheTable
    end
    expect(isInTheTable).to be false
end