# Procedencia
Base indicada por el laboratorio: https://github.com/jgomezz/petclinic_integration_test
Commit consultado: 2453ce2ec325139ac31dbc131c9fd039c14ce5de
Adaptación para Valdeiglesias Aguilar Joe Anderson.
Cambios: Java 17, perfil H2 local, perfil MySQL mediante variables, puerto 8081,
transacciones con rollback en pruebas, corrección de aserciones de actualización,
Jenkinsfile con resultados JUnit, credencial MySQL y archivo JAR.
El SQL exige una base nueva y no elimina una base existente.

Mockito utiliza mock-maker-subclass: estas pruebas simulan interfaces y no necesitan adjuntar un agente a la JVM.
