#----------------------------------
# Stage 1: Build stage
#---------------------------------
FROM maven:3.9.16-eclipse-temurin-17-noble AS build

WORKDIR /build
COPY pom.xml .

RUN mvn dependency:go-offline

COPY src ./src
RUN mvn clean package -DskipTests


#-----------------------------------
# Stage 2: run
#----------------------------------


FROM tomcat:11-jre21-temurin-noble

WORKDIR /usr/local/tomcat

#create non-root user
RUN useradd -r -u 1001 -g root appuser && \
	chown -R appuser:root \
	/usr/local/tomcat/logs \
	/usr/local/tomcat/temp \
	/usr/local/tomcat/work \
	/usr/local/tomcat/webapps

#deploy war

COPY --from=build --chown=1001:0 /build/target/manab-technologies.war ./webapps/manab.war


EXPOSE 8080


USER appuser


ENTRYPOINT ["/usr/local/tomcat/bin/catalina.sh", "run"]
