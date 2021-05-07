# Simple Maven

Simple Maven is a basic maven project. The purpose of the project is to test the CI/CD configuration setup. It includes one unit test.

```
mvn clean
```

```
mvn install
```

```
mvn compile
```

```
mvn test
```

```
mvn clean deploy
```

To skip tests:
```
mvn clean deploy -Dmaven.test.skip=true
```

To deploy artifacts in an Artefact Repository (e.g., Nexus). It's the file settings.xml in the folder .m2 of the users home directory (~/.m2).

```
<?xml version="1.0" encoding="UTF-8"?>
<settings xmlns="http://maven.apache.org/SETTINGS/1.1.0"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.1.0 http://maven.apache.org/xsd/settings-1.1.0.xsd">

  <servers>
    <server>
      <id>nexus-snapshots</id>
      <username>user</username>
      <password>pass....</password>
    </server>
    <server>
      <id>nexus-releases</id>
      <username>admin</username>
      <password>pass...</password>
    </server>
     <server>
      <id>docker.io</id>
      <username>admin</username>
      <password>pass...</password>
    </server>
  </servers>
</settings>
```
To install artifacts from the Artefact Repository, set the Nexus as a mirror.
```
<?xml version="1.0" encoding="UTF-8"?>
<settings xmlns="http://maven.apache.org/SETTINGS/1.1.0"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.1.0 http://maven.apache.org/xsd/settings-1.1.0.xsd">

  <servers>
    <server>
      <id>nexus-snapshots</id>
      <username>user</username>
      <password>pass....</password>
    </server>
    <server>
      <id>nexus-releases</id>
      <username>admin</username>
      <password>pass...</password>
    </server>
    <server>
      <id>docker.io</id>
      <username>admin</username>
      <password>pass...</password>
    </server>
  </servers>
  
  <mirrors>
      <mirror>
         <id>central</id>
         <name>central</name>
         <url>http://localhost:8081/repository/maven-public/</url>
         <mirrorOf>*</mirrorOf>
      </mirror>
  </mirrors>

</settings>
```
