Feature: erase a course from the list of courses
    As a Nahual member
    I want to delete a course
    in order to erase it from the view of the page

Background: Loggin with Google account
    Given I am on the first page
	And I click "Iniciar Sesión" button
    And I click Iniciar con Google button
    And I enter my username
    And I click "Siguiente" button
    And I enter my password
    And I click "Siguiente" button
    And I click "Verificar Acceso" button

@beforeCourseIsCreated
Scenario: Erase a course present in the list of courses
    Given I click "Cursos" in left side menu
    When I locate the row of the course with "pruebacalidad" topic and "Juan" profesor
    And I click Eliminar button on the located row
    And I click "Confirmar" button
    Then the course with "pruebacalidad" topic and "Juan" profesor should not be in the list of courses
