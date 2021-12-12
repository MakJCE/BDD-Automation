Feature: See a list of alumnes once i select the course
    As I Nahual member
    I want to chose the course and see its list of alumnes
    In order to manage in a better way all the alumnes

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
@beforeAlumneIsCreated
@afterAlumneIsDeleted
@afterCourseIsDeleted
Scenario Outline: display the list of students of any course
    Given I click "Cursos" in left side menu
    And I click "Alumnes" section on the horizontal menu on top of the view
    When I click list of courses dropdown
    And I select the course with "pruebacalidad" and "juanprueba"
    Then I should see the Alumne with "Marco" name and "Fernandez" lastname in the list
