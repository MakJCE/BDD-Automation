When('I push the first eye button') do
    sleep 2
    find(:xpath,"/html/body/div/div/div[4]/div[2]/div/div[2]/div[2]/table/tbody/tr[1]/td[8]/button").click
end
  
Then('I should see {string} title') do |title|
    expect(page.has_content?(title)).to be true
end