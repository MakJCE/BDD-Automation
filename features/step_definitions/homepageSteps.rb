Given('I am on the first page') do
  visit('/')
<<<<<<< HEAD
  page.driver.browser.manage.window.resize_to(1200, 800)
end

Given ("I am in a page with title {string}") do |title|
  expect(page.has_content?(title)).to be true
end

Given('I can see the title {string}') do |string|
  expect(page.has_content?(string)).to be true
=======
  page.driver.browser.manage.window.resize_to(1000, 800)
>>>>>>> 2ce6a80... Visualizar Egresados
end

When('I click Iniciar con Google button') do
  find(:xpath,"/html/body/div/div/div[2]/form/div/div/div/div/div[2]/div[2]/span/div/div/div/div/div/div/div/div/div/div/div[1]/a").click
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

Then('I am redirected to a page with the title {string}') do |title|
  expect(page.has_content?(title)).to be true
end

Then('A window is displayed showing the email of the account') do 
  value = find("#form-acceso").value
  expect(value).to have_content(ENV["USER"])
end
Then('the {string} field {string}') do |space, empty|
  request = empty == "is not empty"
  element = page.find('#'+space).value
  expect(element.empty? == false).to be request
end
