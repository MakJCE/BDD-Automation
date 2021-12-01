Feature: enroll an Alumne to Alumnes's Curso
    As a member with Cursos privilege
    I want to add Alumnes to Alumnes's Curso
    in order to manage the assistants to the Curso

@needToLogin
Background: 
    Given I am in homepage 
    And I press "Cursos" button 
    When I press "Alumnes" navlink
    Then I should stay in Alumnes view

Scenario: enroll one Alumne to a new Curso
    Given I press "Inscribir Nuevo Alumne" button 
    And I enter <nombre> in "Nombre/s" field 
    And I enter <apellido> in "Apellidos" field
    And I enter <correo> in "Correo Electrónico" field
    And I enter <telefono> in "Teléfono" field
    And I enter <fecha> in "Fecha de Nacimiento" field
    And I enter <sedenodo> in "Sede - Nodo" field
    And I enter <ingles> in "Nidel de Inglés" field
    And I enter <nacionalidad> in "Nacionalidad" field
    And I enter <opcional> in "Correo Opcional" field
    And I enter <detalle> in "Detalle" field
    And I press "Inscribir" button
    Then I should see the new Alumne to the end of the list

