Given('I am on the first page') do
  visit('/')
  page.driver.browser.manage.window.resize_to(1400, 800)
end

Given ("Then I go at the page with the title {string}") do |title|
  puts("Then")
  puts(page.has_content?(title))
end

Given('I can see the title {string}') do |string|
  expect(page.has_content?(string)).to be true
end

When('I click Iniciar con Google button') do
  find(:xpath,"/html/body/div/div/div[2]/form/div/div/div/div/div[2]/div[2]/span/div/div/div/div/div/div/div/div/div/div/div[1]/a").click
  #click_on(class: 'auth0-lock-social-big-button')
end

When('I enter my username') do
  fill_in 'identifierId', :with => ENV['USER']
end

When('I enter my password') do
  fill_in 'password', :with => ENV['PSW']
end

When('I push {string} option in the page') do |element|
  click_on(element)
end


Then ("Then I go at the page with the title {string}") do |title|
  puts("Then")
  puts(page.has_content?(title))
end


Then('I go at the page with the title {string}') do |title|
  expect(page.has_content?(title)).to be true
end

Then('I can see the email of the account') do 
  value = find("#form-acceso").value
  puts(value)
  expect(value).to have_content(ENV["USER"])
end
Then('the {string} space {string}') do |space, empty|
  request = empty == "is not empty"
  element = page.find('#'+space).value
  expect(element.empty? == false).to be request
end
