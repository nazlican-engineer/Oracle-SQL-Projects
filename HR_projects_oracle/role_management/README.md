# Oracle Role Management Project

This project demonstrates how to manage users, roles, and privileges in an Oracle database.

## 📌 Scenario

There is a schema named **NAZLI** which contains the `DEPARTMENTS` table.

Two users are created:

- ZEYNEP
- BILGE

## 🔐 Roles

- R_SELUPT → SELECT, UPDATE
- R_INSDEL → INSERT, DELETE

## 👤 Permissions

- ZEYNEP → INSERT, DELETE  
- BILGE → SELECT, UPDATE  

## 📂 Files

- users.sql → user creation
- roles_and_privileges.sql → role & privilege setup
- zeynep_tests.sql → ZEYNEP tests
- bilge_tests.sql → BILGE tests

## ▶️ Execution Order

1. users.sql  
2. roles_and_privileges.sql  
3. zeynep_tests.sql  
4. bilge_tests.sql
