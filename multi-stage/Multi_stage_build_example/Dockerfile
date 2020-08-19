#Build the first stage known as builder
FROM maven:3.6.3-ibmjava-8-alpine as builder

#Copy sample java project that I downloaded to my docker host
COPY maven-app /app

#Change the work directory to /app
WORKDIR /app

#Compile and create a jar file from it
RUN mvn package

#Second stage - use lighter image and copy the jar file from the first stage to the second one (the image is not realy ligther it just an example)
FROM openjdk:16-alpine
COPY --from=builder /app/target/my-app-1.0-SNAPSHOT.jar /app.jar

#run this jar file
CMD java -jar /app.jar

