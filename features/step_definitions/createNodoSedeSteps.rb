Then('the nodo named {string} should be shown in the table of nodo-sedes') do |value|
    $created_nodo = {}
    expect(page.has_css?('td', :text => value)).to be true
    $created_nodo = {"nombre" => string}
end