Before do
    visit('/')
    page.driver.browser.manage.window.resize_to(1000, 800)
    click_on('Iniciar Sesión')
    find(:xpath,"/html/body/div/div/div[2]/form/div/div/div/div/div[2]/div[2]/span/div/div/div/div/div/div/div/div/div/div/div[1]/a").click
    fill_in 'identifierId', :with => ENV['USER']
    click_on('Siguiente')
    fill_in 'password', :with => ENV['PSW']
    click_on('Siguiente')
    click_on('Verificar Acceso')
  end

After do 
    Capybara.current_session.driver.quit
end