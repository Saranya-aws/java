# Step 1: Use official Maven image to build the project
FROM maven:3.9.6-eclipse-temurin-17 AS build

# Set working directory inside the container
WORKDIR /app

# Copy pom.xml and source code
COPY pom.xml .
COPY src ./src

# Package the Java program (compiles it)
RUN mvn clean package

# Step 2: Use a smaller JRE image to run the program
FROM eclipse-temurin:17-jre-alpine

# Set working directory
WORKDIR /app

# Copy the compiled .class or jar files from build stage
COPY --from=build /app/target /app/target

# Command to run the program
CMD ["java", "-cp", "target/classes", "SampleJava"]

