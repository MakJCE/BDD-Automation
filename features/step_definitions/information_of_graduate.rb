require './features/pages/BusinessPage.rb'
business = -1

When('I push the first eye button') do
    sleep 2
    $business.push_first_eye_button()
end
  
Then('I should see {string} title') do |title|
    request = page.has_content?(title)
    expect(request).to be true
end