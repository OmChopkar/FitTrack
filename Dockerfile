# Step 1: Use Tomcat 10.1 with Java 21 to match your class files (Version 65.0)
FROM tomcat:10.1-jdk21-openjdk

# Step 2: Clean the default webapps folder in Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Step 3: Copy your project files into the ROOT directory of Tomcat
# This includes your media folder, JSP files, and the WEB-INF/classes folder
COPY . /usr/local/tomcat/webapps/ROOT

# Step 4: Start the Tomcat server
CMD ["catalina.sh", "run"]