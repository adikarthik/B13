FROM eclipse-temurin:17-jdk

WORKDIR /app

RUN apt-get update && \
    apt-get install -y wget

RUN wget -O devops-demo-0.3.0.jar \
https://raw.githubusercontent.com/SuvarnaNarayanappa/SuvarnaNarayanappa_B13_e2e_Project_CK/candidate/suvarna/target/devops-demo-0.3.0.jar

EXPOSE 8080

CMD ["java", "-jar", "devops-demo-0.3.0.jar"]
