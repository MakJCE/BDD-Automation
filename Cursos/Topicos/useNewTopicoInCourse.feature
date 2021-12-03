Feature: create a new topic 
    As a Nahual member
    I want to create a new topic
    In order to manage the information about a new subject in our academy

Background: Loggin with Google account
    Given I am on the first page
    When I click "Iniciar Sesión" button
    And I click Iniciar con Google button
    And I enter my username
    And I click "Siguiente" button
    And I enter my password
    And I click "Siguiente" button
    And I click "Verificar Acceso" button

@afterCourseIsDeleted
@afterTopicoIsDeleted
Scenario: create a new topic and use it to create a new course
    Given I click "Cursos" in left side menu
    And I click "Topicos" section on the horizontal menu on top of the view
    When I click "Topico" button
    And I enter "Funcional" in "Topico" field
    And I click "Crear" button
    And I click "Cursos" section on the horizontal menu on top of the view
    And I click "Nuevo Curso" button
    And I enter "2021" in "Año" field
    And I enter "2" in "Periodo" field
    And I enter "Activo" in "Estado" dropdown
    And I enter "Egresades" in "Curso Para:" dropdown
    And I enter "Funcional" in "Topico" dropdown
    And I enter "Intive - CABA" in "Sede - Nodo" dropdown
    And I enter "Tarde(14-16)" in "Horario" field
    And I enter "Juan" in "Profesor" field
    And I enter "prueba" in "Notas" textarea
    And I click "Confirmar" button
    Then the new course with "Funcional" and "Juan" is shown in the table


@afterCourseIsDeleted
@afterTopicoIsDeleted
Scenario: create a new course and use it to change the current topic of that course with a new topic
    Given I click "Topico" button
    When I enter "Funcional" in "Topico" field
    And I click "Crear" button
    And I click "Cursos" section on the horizontal menu on top of the view
    And I click "Nuevo Curso" button
    And I enter "2021" in "Año" field
    And I enter "2" in "Periodo" field
    And I enter "Activo" in "Estado" dropdown
    And I enter "Egresades" in "Curso Para:" dropdown
    And I enter "pruebacalidad" in "Topico" dropdown
    And I enter "Intive - CABA" in "Sede - Nodo" dropdown
    And I enter "Tarde(14-16)" in "Horario" field
    And I enter "Juan" in "Profesor" field
    And I enter "prueba" in "Notas" textarea
    And I click "Confirmar" button
    And I locate the row of the course with "pruebacalidad" topic and Juan as profesor
    And I click Editar button on the located row
    And I change the "Topico" with the value "Funcional"
    And I click "Confirmar" button
    Then the course with previous "Funcional" topic and Juan profesor should have now the "pruebacalidad" as new topic