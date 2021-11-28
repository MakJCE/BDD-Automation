Before '@beforeNeedToLoggin' do
    visit('/')
    sleep 2
    click_on('Iniciar Sesión')
    sleep 2
    find(:xpath,"/html/body/div/div/div[2]/form/div/div/div/div/div[2]/div[2]/span/div/div/div/div/div/div/div/div/div/div/div[1]/a").click
    sleep 2
    fill_in 'identifierId', :with => ENV['USER']
    sleep 2
    click_on('Siguiente')
    sleep 2
    fill_in 'password', :with => ENV['PSW']
    sleep 2
    click_on('Siguiente')
  end