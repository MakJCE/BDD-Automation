Given('I am on welcome page') do
    visit('/')
  end
#cucumber homepage.feature
  When('I push {string} button') do |string|
    sleep 2
    click_on(string)
  end
  
  When('I enter my username') do
    sleep 2
    fill_in 'identifierId', :with => ENV['USER']
  end
  
  When('I click {string}') do |string|
    sleep 2
    click_on(string)
  end
  
  When('I enter my password') do
    sleep 2
    fill_in 'password', :with => ENV['PSW']
  end

  Then('I stay in home page') do
    sleep 5
    expect(page).to have_current_path("https://nahual-argentina-develop.vercel.app/")
  end