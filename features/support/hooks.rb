def login()
    visit('/')
    page.driver.browser.manage.window.resize_to(1000, 800)
    click_on('Iniciar Sesión')
    sleep 2
    if not (page.has_css?('button', :text => 'Verificar Acceso', wait: 0))
      find(:xpath,"/html/body/div/div/div[2]/form/div/div/div/div/div[2]/div[2]/span/div/div/div/div/div/div/div/div/div/div/div[1]/a").click
      fill_in 'identifierId', :with => ENV['USER']
      click_on('Siguiente')
      fill_in 'password', :with => ENV['PSW']
      click_on('Siguiente')
    end
    click_on('Verificar Acceso')
  end

Before "@beforeCourseIsCreated" do
  login()
  all("a.item").each do |item|
    if item.text == "Cursos"
        item.click()
        break
    end
  end
  click_on("Nuevo Curso")
  fields = all('form.form div.field')
  fields.each_with_index do |fi, index|
      label = fi.find('label')
      if label.text == "Año"
          input = fi.find('input')
          input.set("2021")
      end
      if label.text == "Periodo"
          input = fi.find('input')
          input.set("2")
      end
      if label.text == "Estado"
        dropdown = fi.find('div.dropdown')
        dropdown.click()
        value = "Activo"
        if dropdown.find('span.text', :text => value).visible?
          dropdown.find('span.text', :text => value).click()
        else
            dropdown.find('span.text', :text => value, :visible => false).click()
        end
      end
      if label.text == "Curso Para:"
        dropdown = fi.find('div.dropdown')
        dropdown.click()
        value = "Egresades"
        if dropdown.find('span.text', :text => value).visible?
          dropdown.find('span.text', :text => value).click()
        else
            dropdown.find('span.text', :text => value, :visible => false).click()
        end
      end
      if label.text == "Topico"
        dropdown = fi.find('div.dropdown')
        dropdown.click()
        value = "Prueba"
        if dropdown.find('span.text', :text => value).visible?
          dropdown.find('span.text', :text => value).click()
        else
            dropdown.find('span.text', :text => value, :visible => false).click()
        end
      end
      if label.text == "Sede - Nodo"
        dropdown = fi.find('div.dropdown')
        dropdown.click()
        value = "Intive - CABA"
        if dropdown.find('span.text', :text => value).visible?
          dropdown.find('span.text', :text => value).click()
        else
            dropdown.find('span.text', :text => value, :visible => false).click()
        end
      end
      if label.text == "Horario"
          input = fi.find('input')
          input.set("Tarde(14-16)")
      end
      if label.text == "Profesor"
          input = fi.find('input')
          input.set("Juan")
      end
      if label.text == "Notas"
          input = fi.find('textarea')
          input.set("prueba")
      end
  end
  click_on('Confirmar')
  $created_user= {"Profesor" => "Juan", "Topico" => "Prueba"}
  Capybara.current_session.driver.quit
end

After "@afterCourseIsDeleted" do
  login()
  puts "course is been deleted"
  sleep 1
  all("a.item").each do |item|
    if item.text == "Cursos"
        item.click()
    end
  end
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
  Capybara.current_session.driver.quit
end

After "@afterTopicoIsDeleted" do
  login()
  puts "topico is been deleted"
  all("a.item").each do |item|
    if item.text == "Cursos"
        item.click()
    end
  end
  find("div.ui.pointing.secondary.menu a", :text => "Topicos").click()
  name = $created_topico["nombre"]
  locatedTopico = -1
  rows = all("table tr")
  rows.each_with_index do |row, index|
      if row.has_css?('td', :text => name, wait: 0)
          locatedRow = index
      end
  end
  row = all("table tr")[locatedRow]
  row.find('button', :text => "Eliminar").click()
end 

Before "@beforeTopicoIsCreated" do
  all("a.item").each do |item|
    if item.text == "Cursos"
        item.click()
    end
  end
  find("div.ui.pointing.secondary.menu a", :text => "Topicos").click()
  puts "topico is been created"
  login()
  find("a.item", :text => "Cursos").click()
  click_on("Topico")
  find("form input").set("Topico de ejemplo")
  click_on("Crear")
  Capybara.current_session.driver.quit
end 

After "@afterNodoIsDeleted" do
  puts "topico is been deleted"
end 
After "@afterSedeIsDeleted" do
  puts "topico is been deleted"
end 

Before "@beforeSedeIsCreated" do
  puts "topico is been created"
end 

After do 
    Capybara.current_session.driver.quit
end