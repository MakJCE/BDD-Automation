Feature: change the state of one alumne
    As I Nahual member
    I want to change the state of one alumne to Egresade or Abandonade
    In order to graduate an Alumne or withdraw him from the course

Background: Loggin with Google account
    Given I am on the first page
    When I click "Iniciar Sesión" button
    And I click Iniciar con Google button
    And I enter my username
    And I click "Siguiente" button
    And I enter my password
    And I click "Siguiente" button
    And I click "Verificar Acceso" button

@beforeCourseIsCreated
@beforeAlumneIsCreated
@afterAlumneIsRemoved
@afterCourseIsDeleted
Scenario: change state of an Alumne to Egresade and Abandonade
    Given I click "Cursos" in left side menu
    And I click "Alumnes" section on the horizontal menu on top of the view
    When I click list of courses dropdown
    And I select the course with "<topico>" and "<profesor>"
    And I check "Jose" alumne in the list
    And I click "Cambiar Estado" button
    And I enter "<state>" in dropdown
    And I click "Confirmar cambio" button
    Then alumne "Jose" should have "Egresade" state in the list

Examples: 
| state      |
| Egresade   |
| Abandonade |