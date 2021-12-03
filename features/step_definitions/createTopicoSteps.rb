Given ('I click {string} section on the horizontal menu on top of the view') do |string|
    find("div.ui.pointing.secondary.menu a", :text => string).click()
end

Then ('the topico named {string} should be shown in the table of topics') do |string|
    $created_topico = {}
    expect(page.has_css?("td", :text => string)).to be true
    $created_topico = {"nombre" => string}
end
