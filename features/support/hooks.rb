# Before do
#     visit('/')
#     page.driver.browser.manage.window.resize_to(1000, 800)
#     click_on('Iniciar Sesión')
#     sleep 2
#     if not (page.has_css?('button', :text => 'Verificar Acceso', wait: 0))
#       find(:xpath,"/html/body/div/div/div[2]/form/div/div/div/div/div[2]/div[2]/span/div/div/div/div/div/div/div/div/div/div/div[1]/a").click
#       fill_in 'identifierId', :with => ENV['USER']
#       click_on('Siguiente')
#       fill_in 'password', :with => ENV['PSW']
#       click_on('Siguiente')
#     end
#     click_on('Verificar Acceso')
#   end

After "@afterCourseIsDeleted" do
  puts "course is been deleted"
  sleep 1
  profesor = $created_user["Profesor"]
  topic = $created_user["Topico"]
  locatedRow = -1
  rows = all("table tr")
  rows.each_with_index do |row, index|
      if (row.has_css?('td', :text => profesor, wait: 0) && row.has_css?('td', :text => topic, wait: 0) )
        locatedRow = index
        break
      end
  end
  puts locatedRow
  row = all("table tr")[locatedRow]
  row.find('button', :text => "Eliminar").click()
  $created_user={}
end

After "@afterTopicoIsDeleted" do
  puts "topico is been deleted"
end 

After do 
    Capybara.current_session.driver.quit
end