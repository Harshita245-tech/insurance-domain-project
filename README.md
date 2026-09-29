
# 🛡️ Insurance Domain Project

## 📌 Project Overview

This project focuses on designing and implementing an **Insurance Domain Database** using Supabase. The project covers the development, quality assurance, and user acceptance testing stages of an insurance data management system.

The database manages customers, insurance products, agents, policies, claims, and payments with appropriate relationships between the entities.

---

## 🎯 Project Objectives

- 🗄️ Create a structured Insurance Domain database
- 👤 Manage customer and insurance product information
- 👨‍💼 Maintain insurance agent details
- 📄 Manage insurance policies and their relationships
- 📝 Track insurance claims
- 💳 Record policy payments and transactions
- 🔗 Implement relationships between related tables
- 🧪 Perform **DEV, QA, and UAT** activities
- 🐙 Maintain project documentation using GitHub

---

## 🏗️ Environment Setup

### 🔹 DEV – Development

The **DEV (Development)** environment is used for creating and configuring the Insurance Domain database.

**Supabase Project:** `insurance-domain`

### 🔹 QA – Quality Assurance

The **QA (Quality Assurance)** environment is used to test the database structure, data, relationships, and functionality.

### 🔹 UAT – User Acceptance Testing

The **UAT (User Acceptance Testing)** environment is used to validate the complete insurance workflow against the expected business requirements.

---

## 🗄️ Database Tables

The project contains the following six tables:

1. 👤 **Customers**
2. 🏥 **Insurance Products**
3. 👨‍💼 **Agents**
4. 📄 **Policies**
5. 📝 **Claims**
6. 💳 **Payments**

---

## 🔗 Database Relationships

The following relationships have been implemented:

```text
Customers
    │
    └── Policies
          │
          ├── Insurance Products
          │
          ├── Agents
          │
          ├── Claims
          │
          └── Payments
````

### 🔑 Foreign Key Relationships

* `policies.customer_id → customers.id`
* `policies.product_id → insurance_products.id`
* `policies.agent_id → agents.id`
* `claims.policy_id → policies.id`
* `payments.policy_id → policies.id`

---

## 📊 Sample Data

Sample data has been inserted into all six tables.

| Table                 | Sample Records |
| --------------------- | -------------: |
| 👤 Customers          |              5 |
| 🏥 Insurance Products |              5 |
| 👨‍💼 Agents          |              5 |
| 📄 Policies           |              5 |
| 📝 Claims             |              5 |
| 💳 Payments           |              5 |

---

## 🧪 Testing

### 🔹 QA Testing

QA testing will verify:

* ✅ Table accessibility
* ✅ Data availability
* ✅ Foreign key relationships
* ✅ Policy creation and relationships
* ✅ Claims and payments relationships
* ✅ Valid and invalid data handling

### 🔹 UAT Testing

UAT will validate the complete business flow:

```text
Customer
   ↓
Insurance Product
   ↓
Policy
   ↓
Claim
   ↓
Payment
```

The objective is to verify that the database supports the expected insurance business workflow.

---

## 🛠️ Technologies Used

* ☁️ **Supabase**
* 🗄️ **PostgreSQL**
* 🐙 **GitHub**
* 🤖 **ChatGPT / AI**

---

## 📁 Project Structure

```text
insurance-domain-project/
│
├── README.md
│
├── database/
│   ├── customers.csv
│   ├── insurance_products.csv
│   ├── agents.csv
│   ├── policies.csv
│   ├── claims.csv
│   └── payments.csv
│
└── documentation/
    └── screenshots/
```

---

## 👥 Team

This project is developed as a team project as part of the Insurance Domain training activity.

### Team Roles

* 👨‍💻 **DEV – Development:** Database creation and configuration
* 🧪 **QA – Quality Assurance:** Database testing
* 👥 **UAT – User Acceptance Testing:** Business workflow validation

---

## ✅ Current Progress

* [x] Supabase project created
* [x] Insurance database structure created
* [x] Six database tables created
* [x] Foreign key relationships configured
* [x] Sample data inserted
* [x] QA/UAT team access shared
* [ ] QA testing
* [ ] UAT testing
* [ ] GitHub collaboration setup
* [ ] Final project documentation

---

## 📌 Note

This repository contains the documentation and supporting files for the Insurance Domain project.

**Databricks-related activities are not included in the current project scope.**

---

## 🚀 Project Status

**Current Stage:** Database Setup & Environment Preparation

**Next Steps:** QA Testing → UAT Testing → GitHub Collaboration → Final Documentation

```
```
