# Manab Technologies — Maven WAR Project

## Project Structure
```
manab-technologies/
├── pom.xml
└── src/
    └── main/
        ├── java/
        │   └── com/manab/servlet/
        │       └── HomeServlet.java        ← Servlet with data
        └── webapp/
            ├── index.jsp                   ← Redirects to servlet
            ├── css/
            │   └── style.css              ← Styling
            └── WEB-INF/
                ├── web.xml
                └── views/
                    └── home.jsp           ← Main JSP page
```

## Prerequisites
- Java 11+
- Maven 3.6+
- Apache Tomcat 10.x (for Jakarta EE 9 / Servlet 5.0)
  > If using Tomcat 9.x, change `jakarta.servlet` to `javax.servlet` in pom.xml and imports

---

## Build

```bash
cd manab-technologies
mvn clean package
```

This generates: `target/manab-technologies.war`

---

## Deploy to Tomcat

### Option A — Copy WAR manually
```bash
cp target/manab-technologies.war $TOMCAT_HOME/webapps/
```
Tomcat auto-deploys on hot copy.

### Option B — Tomcat Manager UI
1. Go to `http://localhost:8080/manager/html`
2. Under "Deploy" → "WAR file to deploy" → upload the WAR

---

## Access the App
```
http://localhost:8080/manab-technologies/
```

---

## Tomcat Version Note
| Tomcat | Servlet API       | Import prefix  |
|--------|-------------------|----------------|
| 10.x   | Servlet 5.0       | `jakarta.*`    |
| 9.x    | Servlet 4.0       | `javax.*`      |

For **Tomcat 9**, edit `pom.xml`:
- Change `jakarta.servlet-api` → `javax.servlet-api` version `4.0.1`
- Change `jakarta.servlet.jsp-api` → `javax.servlet.jsp-api` version `2.3.3`
- Change all `import jakarta.servlet.*` → `import javax.servlet.*` in HomeServlet.java
