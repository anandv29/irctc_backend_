# IRCTC Backend Deployment Guide

## 1) Prerequisites
- Java 21
- Gradle
- MySQL database
- Docker (optional, recommended for production)

## 2) Environment variables
Create `.env` at project root or set env vars in your service host:

- `DB_URL` (e.g., `jdbc:mysql://localhost:3306/irctc`)  
- `DB_USER` (e.g., `root`)  
- `DB_PASSWORD`  
- `EMAIL_USERNAME` (sender email)  
- `EMAIL_PASSWORD` (email SMTP app password)  
- `PORT` (default `8080`)

> NOTE: `app/build.gradle` currently uses and packs WAR built from `app/src/main/resources` excluding `.env`.

## 3) Database schema
Run in MySQL:
```sql
CREATE DATABASE IF NOT EXISTS irctc;
USE irctc;

CREATE TABLE IF NOT EXISTS user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    userEMAIL VARCHAR(255) NOT NULL UNIQUE,
    userPassword VARCHAR(255) NOT NULL,
    userName VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS train (
    id INT AUTO_INCREMENT PRIMARY KEY,
    trainName VARCHAR(255),
    source VARCHAR(255),
    destination VARCHAR(255),
    seats INT
);

CREATE TABLE IF NOT EXISTS tickets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    userId INT,
    trainId INT,
    bookingDate DATETIME,
    status VARCHAR(50),
    FOREIGN KEY(userId) REFERENCES user(id),
    FOREIGN KEY(trainId) REFERENCES train(id)
);
```

## 4) Build + local test
```bash
cd /workspaces/irctc_backend_
chmod +x gradlew
./gradlew clean build
```

## 5) Run with embedded Tomcat
```bash
cd /workspaces/irctc_backend_
# ensure env vars set
export PORT=8080
export EMAIL_USERNAME="your@email.com"
export EMAIL_PASSWORD="your-mail-app-password"
export DB_URL="jdbc:mysql://localhost:3306/irctc"
export DB_USER="root"
export DB_PASSWORD="password"

# run the app
java -cp "app/build/classes/java/main:app/build/resources/main:$(find ~/.gradle/caches/modules-2/files-2.1 -name '*.jar' | paste -sd ':')" org.example.App
```

## 6) Docker deployment
1. Build:
   ```bash
   docker build -t irctc-backend .
   ```
2. Run:
   ```bash
   docker run -d -p 8080:8080 \
     -e PORT=8080 \
     -e DB_URL="jdbc:mysql://host.docker.internal:3306/irctc" \
     -e DB_USER="root" \
     -e DB_PASSWORD="password" \
     -e EMAIL_USERNAME="your@email.com" \
     -e EMAIL_PASSWORD="your-mail-app-password" \
     irctc-backend
   ```

## 7) Build artifact WAR
```bash
cd /workspaces/irctc_backend_/app
./gradlew clean war
# output: app/build/libs/IRCTC-1.0.war
```

## 8) Cleanup
Run on host:
```bash
./gradlew clean
rm -rf app/build build .gradle
```
