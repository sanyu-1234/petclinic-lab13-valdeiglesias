# PetClinic Lab13 — JOE ANDERSON
Alumno: Valdeiglesias Aguilar Joe Anderson
Docente: Jean Marco Miranda Llanos — C24-E — Ciclo 4

Abrir esta carpeta (contiene pom.xml) en IntelliJ, elegir JDK 17 y cargar Maven.
La primera ejecución descarga dependencias y requiere Internet.

## Windows PowerShell
```powershell
.\mvnw.cmd clean verify
.\mvnw.cmd spring-boot:run
```
API: http://localhost:8081/pets (no hay interfaz gráfica en este proyecto base).
Perfil predeterminado: H2; no necesita MySQL local.
Pruebas: target/surefire-reports. Cobertura: target/site/jacoco/index.html.

## MySQL del laboratorio
Importar data/schema-mysql.sql y data/data-mysql.sql una sola vez en una base nueva.
No usar una base con datos personales: los scripts contienen datos de práctica.
Crear admin@localhost y otorgar permisos solamente sobre PETCLINIC_DB.*.
Configurar DB_USERNAME y DB_PASSWORD fuera del repositorio.
```powershell
$env:DB_USERNAME = 'admin'
$env:DB_PASSWORD = 'TU_CLAVE_MYSQL'
.\mvnw.cmd clean verify "-Dspring.profiles.active=mysql"
```

## Jenkins en Ubuntu 24.04 x86_64
Java 21 para ejecutar Jenkins; JDK 17 para compilar este proyecto.
Tools: JDK Java (/usr/lib/jvm/java-17-openjdk-amd64), Maven Maven (/usr/share/maven), Git (/usr/bin/git).
Credencial Username with password: ID mysql-petclinic, usuario admin, contraseña de MySQL.
Pipeline from SCM, Git, tu repositorio, rama */main, Script Path Jenkinsfile.
Activar GitHub hook trigger for GITScm polling.
Primera ejecución con Build Now; siguiente mediante un cambio, commit y push.
El pipeline usa MySQL real, no H2, y publica los resultados y el JAR.

No subir claves PEM ni contraseñas a GitHub. Las capturas se toman en tu propia ejecución.
La guía completa paso a paso está en la respuesta del chat.
