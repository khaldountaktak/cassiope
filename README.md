## 🧩 Architecture

L’architecture repose sur plusieurs services autonomes, interconnectés et orchestrés dans un environnement conteneurisé. Elle adopte les principes suivants :

- 📡 **Découverte de services** via Eureka
- 🧾 **Configuration centralisée** avec Spring Cloud Config
- 🐳 **Déploiement conteneurisé** via Docker
- 🧠 **Séparation claire des responsabilités métiers**

---

## 📦 Composants principaux

- **Eureka Server** : Registre de services assurant la découverte dynamique entre microservices.
- **Config Server** : Serveur de configuration centralisé pour tous les services.
- **Microservices métier** :
  - `accounts-service` : gestion des comptes utilisateurs.
  - `cards-service` : gestion des cartes bancaires.
  - `loans-service` : gestion des prêts.
- **Docker Compose** : orchestration complète de l’infrastructure.

---

## 🛠️ Prérequis

Assurez-vous d’avoir installé les outils suivants :

- Java 17 ou version supérieure
- Maven
- Docker
- Docker Compose

---

## 🚀 Démarrage rapide

1. **Cloner le dépôt** :
   ```bash
   git clone https://github.com/khaldountaktak/cassiope.git
   cd cassiope
2. Générer les fichiers .jar pour chaque service :
   ```bash
   ./prepare-build.sh
3. Démarrer l’ensemble de l’architecture avec Docker Compose :
   ```bash
   docker-compose up --build
4. Accéder aux interfaces principales :
   Eureka Dashboard : http://localhost:8761
