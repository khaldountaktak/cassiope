# Banking Microservices Platform

A production-ready microservices architecture simulating a banking backend, built with **Spring Boot**, **Spring Cloud**, and **Docker**.

---

## Architecture

![Architecture Diagram](cassiope_architecture.svg)

The platform is built around independent, loosely coupled services orchestrated in a fully containerized environment. It follows these core principles:

- **Service Discovery** via Eureka — services register themselves and locate each other dynamically, with no hardcoded addresses
- **Centralized Configuration** via Spring Cloud Config — all services pull their configuration from a single source of truth
- **Containerized Deployment** via Docker — the entire stack runs identically on any machine
- **Clear Separation of Business Concerns** — each domain (accounts, cards, loans) is an isolated, independently deployable service
---

## Components

| Service | Description | Port |
|---|---|---|
| **Eureka Server** | Service registry for dynamic service discovery | `8761` |
| **Config Server** | Centralized configuration server for all services | `8071` |
| **Accounts Service** | Manages customer accounts and profiles | `8080` |
| **Cards Service** | Manages customer credit and debit cards | `9000` |
| **Loans Service** | Manages customer loan products | `9001` |
| **PostgreSQL** | Relational database — one schema per service | `5432` |

---

## Prerequisites

Make sure you have the following installed:

- **Docker** and **Docker Compose**

That's it. The build happens inside Docker — no local Java or Maven installation required.

---

## Quick Start

**1. Clone the repository:**
```bash
git clone https://github.com/khaldountaktak/cassiope.git
cd cassiope
```

**2. Build and start the entire stack:**
```bash
docker-compose up --build
```

Docker will compile the source code, package each service into a JAR, build the images, and start all containers automatically.

**3. Access the services:**

| Interface | URL |
|---|---|
| Eureka Dashboard | http://localhost:8761 |
| Config Server | http://localhost:8071 |
| Accounts API | http://localhost:8080 |
| Cards API | http://localhost:9000 |
| Loans API | http://localhost:9001 |

---

## Development Workflow

To rebuild and restart after code changes:
```bash
docker-compose up --build
```

To start without rebuilding (if images are already built):
```bash
docker-compose up
```

To stop all services:
```bash
docker-compose down
```

To stop and wipe all data (full reset):
```bash
docker-compose down -v
```

---

## Database

Each microservice has its own dedicated PostgreSQL database, following the **database-per-service** pattern:

- `eazybank_accounts`
- `eazybank_cards`
- `eazybank_loans`

Databases are automatically created on first startup via `init.sql`.