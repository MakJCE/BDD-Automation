Given('I am on welcome page') do
    visit('/')
  end
  
  When('I push {string} button') do |string|
    click_on(string)
  end
  
  When('I push {string}') do |string|
    find(".auth0-lock-social-button auth0-lock-social-big-button").click
  end
  
  Then('I stay in home page') do
    expect(page).to have_current_path("https://nahual-argentina-develop.vercel.app/")
  end