Feature: enroll an Alumne to Alumnes's Curso
    As a member with Cursos privilege
    I want to add Alumnes to Alumnes's Curso
    in order to manage the assistants to the Curso

Background: Loggin with Google account
    Given I am on the first page
	And I click "Iniciar Sesión" button
    And I click Iniciar con Google button
    And I enter my username
    And I click "Siguiente" button
    And I enter my password
    And I click "Siguiente" button
    And I click "Verificar Acceso" button

@beforeAlumnesCourseIsCreated
@afterAlumneIsDeleted
@afterCourseIsDeleted
Scenario Outline: enroll one Alumne to a new Curso
    Given I click "Cursos" in left side menu
    And I click "Alumnes" section on the horizontal menu on top of the view
    When I click list of courses dropdown
    And I select the course with "pruebacalidad" and "juanprueba"
    And I click "Inscribir Nuevo Alumne" button 
    And I enter "<dni>" in "DNI" field
    And I enter "<tipodni>" in "Tipo DNI" field
    And I enter "<nombre>" in "Nombre/s" field 
    And I enter "<apellido>" in "Apellidos" field
    And I enter "<correo>" in "Correo Electrónico" field
    And I enter "<telefono>" in "Teléfono" field
    And I enter "<fecha>" in "Fecha de Nacimiento" field
    And I enter "<sedenodo>" in "Sede - Nodo" dropdown
    And I enter "<ingles>" in "Nivel de Inglés" dropdown
    And I enter "<nacionalidad>" in "Nacionalidad" field
    And I click "Inscribir" button
    Then I should see the new Alumne "<nombre>" name and "<apellido>" lastname to the end of the list

Examples:
| dni | tipodni | nombre | apellido  | correo            | telefono | fecha      | sedenodo       | ingles     | nacionalidad | opcional | detalle  |
| 123 | bueno   | Juan   | Fernandez | ejemplo@gmail.com | 12345678 | 01/01/1998 | Intive - CABA  | Intermedio | argentina    | opcional | prueba   |
| 321 |         | .32ff= | .32ff=    | ejemplo@gmail.com | 32473832 | 12/10/2001 | palermo - CABA | Avanzado   | chilena      | .32ff=   | .32ff=   |


@beforeAlumnesCourseIsCreated
@afterAlumneIsDeleted
@afterCourseIsDeleted
Scenario Outline: try to enroll one Alumne to a new Curso with incorrect values
    Given I click "Cursos" in left side menu
    And I click "Alumnes" section on the horizontal menu on top of the view
    When I click list of courses dropdown
    And I select the course with "pruebacalidad" and "juanprueba"
    And I click "Inscribir Nuevo Alumne" button 
    And I enter "<dni>" in "DNI" field
    And I enter "<tipodni>" in "Tipo DNI" field
    And I enter "<nombre>" in "Nombre/s" field 
    And I enter "<apellido>" in "Apellidos" field
    And I enter "<correo>" in "Correo Electrónico" field
    And I enter "<telefono>" in "Teléfono" field
    And I enter "<fecha>" in "Fecha de Nacimiento" field
    And I enter "<sedenodo>" in "Sede - Nodo" dropdown
    And I enter "<ingles>" in "Nivel de Inglés" dropdown
    And I enter "<nacionalidad>" in "Nacionalidad" field
    Then the "Inscribir" button is disabled

Examples:
| dni | tipodni | nombre | apellido | correo            | telefono | fecha      | sedenodo       | ingles   | nacionalidad | opcional | detalle  |
| 123 | bueno   | Jose   | Sanchez  | ejemplo           | 32473832 | 12/10/2021 | Intive - CABA  | Basico   | argentina    | opcional | prueba   |
| 321 | bueno   | .32ff= | .32ff=   | ejemplo@gmail.com | 32473832 | 12/10/2031 | palermo - CABA | Avanzado | chilena      | .32ff=   | .32ff=   |

