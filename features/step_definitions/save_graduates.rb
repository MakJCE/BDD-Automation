When('I push the first {string} checkboxs of the table') do |rows|
    rows = rows.to_i
    row = 1
    while (row <= rows) do
        find(:xpath, "/html/body/div/div/div[4]/div[2]/div/div[2]/div[2]/table/tbody/tr["+row.to_s+"]/td[1]/input").click
        row = row + 1
    end
end
  
  
Then('the counter of export button must be {string}') do |graduates|
    expect(find(:xpath, "/html/body/div/div/div[4]/div[2]/div/div[2]/div[3]/span/div/div")).to have_content(graduates)
end    