Given('I am on welcome page') do
    page.driver.browser.manage.window.maximize
    visit('/')
  end
#cucumber homepage.feature
  When('I push {string} button') do |string|
    puts("esperaaaaaaaaaaaaaaaaaaaaad")
    page.driver.browser.manage.window.resize_to(1000, 800)
    #puts page.driver
    puts("esperaaaaaaaaaaaaaaaaaaaaad")
    click_on(string)
  end
  
  When('I push {string}') do |string|
    sleep 2
    find(:xpath,"/html/body/div/div/div[2]/form/div/div/div/div/div[2]/div[2]/span/div/div/div/div/div/div/div/div/div/div/div[1]/a").click
    #click_on(class: 'auth0-lock-social-big-button')
  end
  
  When('I enter my username') do
    fill_in 'identifier', :with => ENV['USER']
  end
  
  When('I click {string}') do |string|
    click_on(string)
  end
  
  When('I enter my password') do
    sleep 50
    fill_in 'password', :with => ENV['PSW']
  end

  Then('I stay in home page') do
    expect(page).to have_current_path("https://nahual-argentina-develop.vercel.app/")
  end