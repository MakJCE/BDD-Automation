Feature: edit info of an Alumne
    As of Nahual member
    I want to change info in an Alumne record
    In order to keep consistency between real info and info in the app

Background: Loggin with Google account
    Given I am on the first page
	And I click "Iniciar Sesión" button
    And I click Iniciar con Google button
    And I enter my username
    And I click "Siguiente" button
    And I enter my password
    And I click "Siguiente" button
    And I click "Verificar Acceso" button

@beforeAlumneIsCreated
@afterAlumneIsDeleted
Scenario Outline: edit Alumne of a new Curso
    Given I click "Cursos" in left side menu
    And I click "Alumnes" section on the horizontal menu on top of the view
    When I click list of courses dropdown
    And I select the course with "pruebacalidad" and "juanprueba"
    And I locate the new Alumne with name "Mario" and lastname "Fernandez" in the list
    And I click Editar button of that Alumne
    And I change the "<field>" with the value "<value>"
    And I click Guardar Cambios button
    Then I should see the  previous Alumne has the "<value>" in the "<field>"

Examples:
| field              | value            |
| Nombre/s           | .32ff=           |
| Apellidos          | .32ff=           |
| DNI                | .32ff=           |
| Correo Electrónico | .32ff=           |
| Teléfono           | .32ff=           |
| Nacionalidad       | .32ff=           |
| Tipo DNI           | .32ff=           |