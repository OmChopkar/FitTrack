# Step 1: Use an official Tomcat image with Java 11
FROM tomcat:9.0-jdk11-openjdk

# Step 2: Clean the default webapps folder in Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Step 3: Copy your project files into the ROOT directory of Tomcat
# This copies your JSP files, WEB-INF, and media folder
COPY . /usr/local/tomcat/webapps/ROOT

# Step 4: Start the Tomcat server
CMD ["catalina.sh", "run"]s