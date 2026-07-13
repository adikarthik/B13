# Docker WAR Deployment using Dockerfile, Shell Script, and Docker Compose

## Project Overview

This project demonstrates three different ways to deploy a Java web application (`amazon.war`) using Docker.

### Objectives

* Deploy a WAR file using a Dockerfile.
* Deploy the same WAR file using a Dockerfile with a shell script.
* Run both deployments together using Docker Compose.

---

## Project Structure

```text
amazon-app/
│
├── amazon.war
├── Dockerfile
├── Dockerfile.script
├── deploy.sh
└── docker-compose.yml
```

---

# Prerequisites

Before running this project, make sure you have:

* Docker installed
* Docker Compose installed
* `amazon.war` file available in the project directory

---

# Method 1: Deploy WAR using Dockerfile

### Steps

1. Create a Dockerfile.
2. Use the Tomcat image as the base image.
3. Remove the default Tomcat applications.
4. Copy `amazon.war` into the `webapps` directory.
5. Expose port `8080`.
6. Start the Tomcat server.

### Build the Image

```bash
docker build -t amazon-direct .
```

### Run the Container

```bash
docker run -d --name amazon-direct-container -p 8080:8080 amazon-direct
```

### Access the Application

```
http://localhost:8080/amazon
```

---

# Method 2: Deploy WAR using Shell Script

In this method, the Docker container runs a shell script that deploys the WAR file before starting Tomcat.

### Steps

1. Create a shell script (`deploy.sh`).
2. Remove the default Tomcat applications.
3. Copy `amazon.war` into the `webapps` directory.
4. Start Tomcat using the shell script.
5. Create another Dockerfile that executes the shell script.
6. Build and run the container.

### Build the Image

```bash
docker build -f Dockerfile.script -t amazon-script .
```

### Run the Container

```bash
docker run -d --name amazon-script-container -p 8081:8080 amazon-script
```

### Access the Application

```
http://localhost:8081/amazon
```

---

# Method 3: Deploy Both Applications Using Docker Compose

Docker Compose allows multiple containers to be built and started using a single configuration file.

### Steps

1. Create `docker-compose.yml`.
2. Define two services:

   * `amazon-direct`
   * `amazon-script`
3. Build and start both services.

### Start Both Containers

```bash
docker compose up -d
```

### Check Running Containers

```bash
docker compose ps
```

### Stop and Remove Containers

```bash
docker compose down
```

---

# Docker Compose Services

| Service       | Dockerfile        | Host Port |
| ------------- | ----------------- | --------- |
| amazon-direct | Dockerfile        | 8080      |
| amazon-script | Dockerfile.script | 8081      |

---

# Commands Used

Build image (Method 1)

```bash
docker build -t amazon-direct .
```

Build image (Method 2)

```bash
docker build -f Dockerfile.script -t amazon-script .
```

Start all services

```bash
docker compose up -d
```

List running containers

```bash
docker ps
```

Stop all services

```bash
docker compose down
```

---

# Learning Outcomes

After completing this project, you will understand:

* Creating Docker images using Dockerfiles.
* Deploying Java WAR applications in Tomcat.
* Running startup tasks using shell scripts.
* Managing multiple containers using Docker Compose.
* Building and running Docker applications efficiently.

---

# Author

**Tilak Kalliguddi**

This project was created as part of Docker and DevOps practice to understand different deployment methods for Java web applications.
