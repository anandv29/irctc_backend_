# 🚉 IRCTC App Backend

## 🚀 Project Overview

This repository contains the **backend implementation** for an **IRCTC clone**, designed to handle core railway ticketing operations. Built using **Java Servlets** and **JDBC**, it powers essential APIs for **user management**, **train search**, **ticket booking**, and **cancellation**.

🖥️ **Live Demo (Frontend)**:  
👉 [https://irctc-rose.vercel.app](https://irctc-rose.vercel.app)

🗂️ **Frontend GitHub Repo**:  
👉 [https://github.com/anandv29/IRCTC](https://github.com/anandv29/IRCTC)

## 📄 Deployment Guide
- See [DEPLOY.md](./DEPLOY.md) for build, env setup, DB schema, Docker, WAR and cleanup instructions.

---

## 🛠 Tech Stack

- **Java**
- **Servlets**
- **JDBC (MySQL)**
- **Apache Tomcat**

---

## 🔗 Main Features

- 🔐 **User Login & Registration** — secure auth using hashed passwords (BCrypt)
- 🚆 **Train Search** — find trains by source/destination
- 🎫 **Ticket Booking** — book tickets, auto-email ticket file 
- ❌ **Ticket Cancellation** — cancel and update seats
- 🧹 **Auto Ticket File Deletion** — tickets deleted 2 days after generation

---

## 🌐 How to Use (Live Demo)

Try the project live: 👉 [https://irctc-rose.vercel.app](https://irctc-rose.vercel.app)

### 🧭 Steps to Use

1. **Search Trains**
   - Go to **Search Train** page.
   - Enter source and destination to get available trains and their **Train IDs**.
   - 📌 Popular sample searches:
     | From     | To        |
     |----------|-----------|
     | Kota     | Ajmer     |
     | Kota     | Jaipur    |
     | Kota     | Jodhpur   |
     | Kota     | Delhi     |
     | Delhi    | Mumbai    |
     | Delhi    | Kanpur    |

2. **Book Tickets**
   - Use the **Train ID** from above to proceed.
   - Login / Sign up using a **valid email** (ticket will be sent to this).
   - Enter the Train ID, then fill in passenger details.
   - On success, a ticket is automatically sent to your email.

3. **Cancel Tickets**
   - Go to **Cancel Ticket** page.
   - Enter your **Ticket ID** (found in the confirmation email).
   - If valid, your ticket will be canceled and seat updated.

---

## 📦 Project Structure

<pre> 
  app/
    ├── src/
    │   └── main/
    │       ├── java/
    │       │   └── org/
    │       │       └── example/
    │       │           ├── App.java                     # Tomcat server initialization
    │       │           ├── entities/
    │       │           │   └── User.java                # User entity
    │       │           ├── services/
    │       │           │   └── TicketServices.java      # Booking/cancellation logic
    │       │           └── utilities/
    │       │               └── Utilities.java           # Helper functions
    │       └── webapp/
 </pre>


---

## 📥 Setup & Installation

1. **Clone the repository**
    ```bash
    git clone https://github.com/anandv29/-irctc-app-backend.git
    cd -irctc-app-backend
    ```

2. **Configure MySQL Database**
   - Create the required tables and update JDBC details in code.

3. **Build the Project**
   - Use Maven or Gradle to compile and package.

4. **Deploy to Apache Tomcat**
   - Deploy `.war` file or run via embedded Jetty/Tomcat using `App.java`.

5. **Run Locally**
   - Navigate to: `http://localhost:8080/yourappname`

---

## 🧑‍💻 Usage Flow Summary

- 🔐 Sign up or log in using a valid email.
- 🔎 Search trains using source & destination.
- 🎟️ Book a ticket using train ID → Ticket sent via email.
- ❌ Cancel ticket using ticket ID.

---

## 🔒 Security Highlights

- ✅ **Password Encryption** — using BCrypt hashing.
- 🧼 **Auto-Cleanup** — ticket are auto-deleted 48 hours after booking.
- 🔐 **Session Management** — Servlet-based login system.

