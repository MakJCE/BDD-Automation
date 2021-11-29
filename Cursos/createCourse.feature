Feature: create a new course
    As a Nahual member
    I want to create a new course
    In order to teach my students about a certain subject

@este
Scenario Outline: create a course correctly
    And I click "Cursos" navlink
    And I click "Nuevo Curso" button
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
    Then the new course is shown in the table
Examples:
    | Año  | Periodo  | Estado    | CursoPara | Topico        | SedeNodo              | Horario      | Profesor   | Notas  |
    | 2021 |  1       |  Activo   | Egresades | Prueba        | Intive - CABA         | Tarde(14-16) | Juan       | prueba |
    | 2020 |  1       |  Activo   | Egresades | Prueba        | Intive - CABA         | Tarde(14-16) | Juan       | prueba |
    | 2021 |  2       |  Activo   | Egresades | Prueba        | Intive - CABA         | Tarde(14-16) | Juan       | prueba |
    | 2021 |  1       |  Inactivo | Alumnes   | Prueba        | Intive - CABA         | Tarde(14-16) | Juan       | prueba |
    | 2021 |  1       |  Inactivo | Egresades | Topico Prueba | Intive - CABA         | Tarde(14-16) | Juan       | prueba |
    | 2021 |  1       |  Inactivo | Egresades | Prueba        | Ituzaingó - Ituzaingó | Tarde(14-16) | Juan       | prueba |
    | 2021 |  1       |  Activo   | Egresades | Prueba        | Intive - CABA         | Tarde(14-16) | profe2     | prueba |
    | 2021 |  1       |  Activo   | Egresades | Prueba        | Intive - CABA         | Tarde(14-16) | Juan       | .32ff= |


Scenario Outline: try to create a course with empty required fields
    Given I click "Cursos" navlink
    When I click "Nuevo Curso" button
    Then the "Confirmar" button is disabled
