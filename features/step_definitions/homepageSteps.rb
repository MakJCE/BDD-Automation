Given('I am on the first page') do
  visit('/')
  page.driver.browser.manage.window.resize_to(1000, 800)
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

  # Then('I stay in home page') do
  #   sleep 5
  #   expect(page).to have_current_path("https://nahual-argentina-develop.vercel.app/home")
  # end