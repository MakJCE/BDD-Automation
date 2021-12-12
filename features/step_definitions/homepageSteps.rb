require './features/step_definitions/lib/HomePage.rb'
$home = -1
request_menu = -1
Given('I am on the first page') do
  visit('/')
  page.driver.browser.manage.window.resize_to(1200, 800)
end

Given ("I am in a page with title {string}") do |title|
  $home = HomePage.new(page)
  expect(page.has_content?(title)).to be true
end

Given('I can see the title {string}') do |string|
  expect(page.has_content?(string)).to be true
  page.driver.browser.manage.window.resize_to(1000, 800)
end
Given('I click {string} button') do |string|
  sleep 2
  click_on(string)
end
Given('I click Iniciar con Google button') do
  find(:xpath,"/html/body/div/div/div[2]/form/div/div/div/div/div[2]/div[2]/span/div/div/div/div/div/div/div/div/div/div/div[1]/a").click
end

Given('I enter my username') do
  fill_in 'identifierId', :with => ENV['USER']
end

Given('I enter my password') do
  fill_in 'password', :with => ENV['PSW']
end

When('I push {string} option in the page') do |element|
  click_on(element)
end

Then('I am redirected to a page with the title {string}') do |title|
  request = $home.exist_the_title(title)
  expect(request).to be true
end

Then('A window is displayed showing the email of the account') do 
  request_menu = RequestAccessPage.new(page)
  value = request_menu.get_email_from_field()
  expect(value).to eq(ENV["USER"])
end
Then('the name field is not empty') do
  request = request_menu.name_field_is_empty()
  expect(request).to be false
end
Then('the motive field is empty') do
  request = request_menu.motive_field_is_empty()
  expect(request).to be true
end
