$business = -1
When('I push the first {string} checkboxs of the table') do |rows|
    rows = rows.to_i
    $business.click_checkboxs(rows)
end
  
  
Then('the counter of export button must be {string}') do |graduates|
    request = $business.get_graduates_selected()
    graduates = graduates.to_i
    expect(request).to eq(graduates)
end    