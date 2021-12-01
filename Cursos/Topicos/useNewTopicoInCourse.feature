Feature: create a new topic 
    As a Nahual member
    I want to create a new topic
    In order to manage the information about a new subject in our academy

Background: create Course to use it
    Given I click "Cursos" in left side menu
    And I click "Topicos" section on the horizontal menu on top of the view

@afterCourseIsDeleted
@afterTopicoIsDeleted
Scenario: create a new topic and use it to create a new course
    Given I click "Topico" button
    When I enter "Funcional" in "Topico" field
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
    And I enter "Prueba" in "Notas" textarea
    And I click "Confirmar" button
    Then the new course with "Funcional" and "Juan" is shown in the table

@afterCourseIsDeleted
@afterTopicoIsDeleted
Scenario: create a new topic and use it to change current topic of a course
    Given I click "Topico" button
    When I enter "Funcional" in "Topico" field
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
    And I enter "Prueba" in "Notas" textarea
    And I click "Confirmar" button
    And I locate the row of the course with "Funcional" topic and Juan as profesor
    And I click Editar button on the located row
    And I change the "Topico" with the value "Prueba"
    And I click "Confirmar" button
    Then the course with previous "Funcional" topic and Juan profesor should have now the "Prueba" as new topic