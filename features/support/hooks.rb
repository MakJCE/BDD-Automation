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
        value = "pruebacalidad"
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
  $created_user= {"Profesor" => "Juan", "Topico" => "pruebacalidad"}
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
  puts profesor, topic
  locatedRow = -1
  rows = all("table tr")
  rows.each_with_index do |row, index|
      if (row.has_css?('td', :text => profesor, wait: 0)) && (row.has_css?('td', :text => topic, wait: 0) )
        locatedRow = index
        break
      end
  end
  puts locatedRow
  if locatedRow > 0
    row = all("table tr")[locatedRow]
    row.find('button', :text => "Eliminar").click()
    page.find('button', :text => "Confirmar").click()
  end
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
  sleep 2
  name = $created_user["Topico"]
  locatedRow = -1
  rows = all("table tr")
  rows.each_with_index do |row, index|
      if row.has_css?('td', :text => name, wait: 0)
          locatedRow = index
      end
  end
  if locatedRow > 0
    row = all("table tr")[locatedRow]
    row.find('button', :text => "Eliminar").click()
    page.find('button', :text => "Confirmar").click()
  end
  $created_user={}
  Capybara.current_session.driver.quit
end 

Before "@beforeTopicoIsCreated" do
  login()
  all("a.item").each do |item|
    if item.text == "Cursos"
        item.click()
    end
  end
  find("div.ui.pointing.secondary.menu a", :text => "Topicos").click()
  puts "topico is been created"
  click_on("Topico")
  page.find("input#Topico").set("Topicodeejemplo")
  sleep 2
  click_on("Crear")
  $created_user= {"Topico" => "Topicodeejemplo"}
  Capybara.current_session.driver.quit
end 

After "@afterNodoIsDeleted" do
  login()
  puts "Nodo is been deleted"
  all("a.item").each do |item|
    if item.text == "Cursos"
        item.click()
    end
  end
  find("div.ui.pointing.secondary.menu a", :text => "Nodos Sedes").click()
end 
After "@afterSedeIsDeleted" do
  login()
  puts "Sede is been deleted"
  all("a.item").each do |item|
    if item.text == "Cursos"
        item.click()
    end
  end
  find("div.ui.pointing.secondary.menu a", :text => "Nodos Sedes").click()
end 

Before "@beforeSedeIsCreated" do
  puts "topico is been created"
end 

Before "@beforeAlumnesCourseIsCreated" do
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
        value = "Alumnes"
        if dropdown.find('span.text', :text => value).visible?
          dropdown.find('span.text', :text => value).click()
        else
            dropdown.find('span.text', :text => value, :visible => false).click()
        end
      end
      if label.text == "Topico"
        dropdown = fi.find('div.dropdown')
        dropdown.click()
        value = "pruebacalidad"
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
          input.set("juanprueba")
      end
      if label.text == "Notas"
          input = fi.find('textarea')
          input.set("prueba")
      end
  end
  click_on('Confirmar')
  $created_user= {"Profesor" => "juanprueba", "Topico" => "pruebacalidad"}
  Capybara.current_session.driver.quit
end

After ('@afterAlumneIsDeleted') do
  login()
  puts "alumne is been deleted"
  all("a.item").each do |item|
    if item.text == "Cursos"
        item.click()
    end
  end
  find("div.ui.pointing.secondary.menu a", :text => "Alumnes").click()
  sleep 2
  name = $created_user["nombre"]
  lastname = $created_user["apellido"]
  puts name, lastname
  locatedRow = -1
  rows = all("table tr")
  rows.each_with_index do |row, index|
      if row.has_css?('td', :text => name, wait: 0)
        if row.has_css?('td', :text => lastname, wait: 0)
          locatedRow = index
        end
      end
  end
  if locatedRow > 0
    row = all("table tr")[locatedRow]
    row.find('button', :text => "Eliminar").click()
    page.find('button', :text => "Confirmar").click()
  end
  $created_user={}
  Capybara.current_session.driver.quit
end

Before "@beforeAlumneIsCreated" do
  login()
  all("a.item").each do |item|
    if item.text == "Cursos"
        item.click()
        break
    end
  end
  find("div.ui.pointing.secondary.menu a", :text => "Alumnes").click()
  page.find('div.ui.compact.inline.left.pointing.dropdown.link.item').click()
  options = all('div.menu.transition span')
  options.each do |option|
    if (option.text.include? "pruebacalidad") && (option.text.include? "juanprueba")
        option.click()
    end
  end
  click_on("Inscribir Nuevo Alumne")
  fields = all('form.form div.field')
  fields.each_with_index do |fi, index|
      label = fi.find('label')
      if label.text == "DNI"
          input = fi.find('input')
          input.set("123")
      end
      if label.text == "Tipo DNI"
          input = fi.find('input')
          input.set("bueno")
      end
      if label.text == "Nombre/s"
          input = fi.find('input')
          input.set("Marco")
      end
      if label.text == "Apellidos"
          input = fi.find('input')
          input.set("Fernandez")
      end
      if label.text == "Correo Electrónico"
          input = fi.find('input')
          input.set("ejemplo@gmail.com")
      end
      if label.text == "Teléfono"
          input = fi.find('input')
          input.set("12345678")
      end
      if label.text == "Fecha de Nacimiento"
          input = fi.find('input')
          input.set("01/01/1998")
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
      if label.text == "Nivel de Inglés"
        dropdown = fi.find('div.dropdown')
        dropdown.click()
        value = "Intermedio"
        if dropdown.find('span.text', :text => value).visible?
          dropdown.find('span.text', :text => value).click()
        else
            dropdown.find('span.text', :text => value, :visible => false).click()
        end
      end
      if label.text == "Nacionalidad"
          input = fi.find('input')
          input.set("argentina")
      end
  end
  click_on('Inscribir')
  $created_user= {"nombre" => "Marco", "apellido" => "Fernandez"}
  sleep 5
  Capybara.current_session.driver.quit
end

After do 
    Capybara.current_session.driver.quit
end