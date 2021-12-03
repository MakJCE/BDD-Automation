Feature: delete a sede of a nodo
    As I Nahual member
    I want to delete a sede
    In order to remove a non existing sede in a course culd be created

Background: Loggin with Google account
    Given I am on the first page
    When I click "Iniciar Sesión" button
    And I click Iniciar con Google button
    And I enter my username
    And I click "Siguiente" button
    And I enter my password
    And I click "Siguiente" button
    And I click "Verificar Acceso" button

@beforeNodoIsCreated
@beforeSedeIsCreated
Scenario: delete a new Sede
    Given I click "Cursos" in left side menu
    And I click "Nodos Sedes" section on the horizontal menu on top of the view
    When I locate the row of the Nodo with "Villa Rica" name 
    And I locate the Sede named "sedeuno" in previuos Nodo
    And I click Eliminar button on the located Sede
    And I click "Confirmar" button
    Then the Sede with "sedeuno" name should not to be in the list of topics