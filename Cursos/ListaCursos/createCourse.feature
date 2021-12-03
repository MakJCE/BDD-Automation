Feature: create a new course
    As a Nahual member
    I want to create a new course
    In order to teach my students about a certain subject

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
Scenario Outline: create a course correctly
    Given I click "Cursos" in left side menu
    When I click "Nuevo Curso" button
    And I enter "<Año>" in "Año" field
    And I enter "<Periodo>" in "Periodo" field
    And I enter "<Estado>" in "Estado" dropdown
    And I enter "<CursoPara>" in "Curso Para:" dropdown
    And I enter "<Topico>" in "Topico" dropdown
    And I enter "<SedeNodo>" in "Sede - Nodo" dropdown
    And I enter "<Horario>" in "Horario" field
    And I enter "<Profesor>" in "Profesor" field
    And I enter "<Notas>" in "Notas" textarea
    And I click "Confirmar" button
    Then the new course with "<Topico>" and "<Profesor>" is shown in the table
Examples:
    | Año  | Periodo  | Estado    | CursoPara | Topico         | SedeNodo              | Horario      | Profesor   | Notas  |
    | 2021 |  1       |  Activo   | Egresades | pruebacalidad  | Intive - CABA         | Tarde(14-16) | Juan       | prueba |
    | 2020 |  1       |  Activo   | Egresades | pruebacalidad  | Intive - CABA         | Tarde(14-16) | Juan       | prueba |
    | 2021 |  2       |  Activo   | Egresades | pruebacalidad  | Intive - CABA         | Tarde(14-16) | Juan       | prueba |
    | 2021 |  1       |  Inactivo | Alumnes   | pruebacalidad  | Intive - CABA         | Tarde(14-16) | Juan       | prueba |
    | 2021 |  1       |  Inactivo | Egresades | pruebacalidad  | Ituzaingó - Ituzaingó | Tarde(14-16) | Juan       | prueba |
    | 2021 |  1       |  Activo   | Egresades | pruebacalidad  | Intive - CABA         | loquesea     | Juan       | prueba |
    | 2021 |  1       |  Activo   | Egresades | pruebacalidad  | Intive - CABA         | Tarde(14-16) | profe2     | prueba |
    | 2021 |  1       |  Activo   | Egresades | pruebacalidad  | Intive - CABA         | Tarde(14-16) | Juan       | .32ff= |

Scenario Outline: try to create a course with empty required fields
    Given I click "Cursos" in left side menu
    When I click "Nuevo Curso" button
    And I leave "Año" field empty
    And I leave "Periodo" field empty
    And I leave "Estado" field empty
    And I leave "CursoPara" field empty
    And I leave "Topico" field empty
    And I leave "SedeNodo" field empty
    And I leave "Horario" field empty
    And I leave "Profesor" field empty
    And I leave "Notas" field empty
    Then the "Confirmar" button is disabled
