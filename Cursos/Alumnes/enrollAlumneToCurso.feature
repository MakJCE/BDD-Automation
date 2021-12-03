Feature: enroll an Alumne to Alumnes's Curso
    As a member with Cursos privilege
    I want to add Alumnes to Alumnes's Curso
    in order to manage the assistants to the Curso

Background: Loggin with Google account
    Given I am on the first page
    When I click "Iniciar Sesión" button
    And I click Iniciar con Google button
    And I enter my username
    And I click "Siguiente" button
    And I enter my password
    And I click "Siguiente" button
    And I click "Verificar Acceso" button

@beforeCourseOfAlumnesIsCreated
Scenario Outline: enroll one Alumne to a new Curso
    Given I click "Cursos" in left side menu
    And I click "Alumnes" section on the horizontal menu on top of the view
    When I click list of courses dropdown
    And I select the course with "<topico>" and "<profesor>"
    And I press "Inscribir Nuevo Alumne" button 
    And I enter "<nombre>" in "Nombre/s" field 
    And I enter "<apellido>" in "Apellidos" field
    And I enter "<correo>" in "Correo Electrónico" field
    And I enter "<telefono>" in "Teléfono" field
    And I enter "<fecha>" in "Fecha de Nacimiento" field
    And I enter "<sedenodo>" in "Sede - Nodo" field
    And I enter "<ingles>" in "Nidel de Inglés" field
    And I enter "<nacionalidad>" in "Nacionalidad" field
    And I enter "<opcional>" in "Correo Opcional" field
    And I enter "<detalle>" in "Detalle" field
    And I press "Inscribir" button
    Then I should see the new Alumne "<nombre>" to the end of the list

Examples:
| nombre | apellido | correo  | telefono | fecha      | sedenodo       | ingles   | nacionalidad | opcional | detalle  |
| Jose   | Sanchez  | ejemplo | 32473832 | 12/10/2021 | Intive - CABA  | Basico   | argentina    | opcional | prueba   |
| .32ff= | .32ff=   | ejemplo | 32473832 | 12/10/2001 | palermo - CABA | Avanzado | chilena      | .32ff=   | .32ff=   |

