# University Entry Gate Management System

## DBMS Assignment

This project is a database management system designed for managing the entry and exit records of a university.

The system maintains information about students, visitors, security guards, university gates, vehicles, and entry/exit activities.

## Objectives

- Maintain university entry and exit records.
- Manage student and visitor information.
- Track security guards and gates.
- Maintain vehicle entry information.
- Identify busy gates and peak entry periods.
- Provide useful views for different users.
- Automatically handle data validation using triggers.
- Maintain an audit record of updated entry information.

## Database Entities

The main entities used in the system are:

1. Student
2. Visitor
3. Security Guard
4. Gate
5. Vehicle
6. Entry Log
7. Entry Log Audit

## Project Files

| File | Description |
|---|---|
| `01_Database_Creation.sql` | Creates the database and tables |
| `02_Sample_Data.sql` | Inserts sample records |
| `03_Queries.sql` | Contains queries for resource planning and analysis |
| `04_Views.sql` | Creates views for different types of users |
| `05_Triggers.sql` | Contains database triggers |
| `06_Procedures_Functions.sql` | Contains stored procedures and functions |
| ER Diagram | Shows the database entities and relationships |

## Main Features

### Entry Management
Records the entry and exit time of students and visitors.

### Gate Management
Maintains information about different university gates and their usage.

### Visitor Management
Stores visitor details, purpose of visit, and entry information.

### Vehicle Management
Maintains vehicle number, type, and owner information.

### Security Management
Stores security guard information and tracks entry records handled by guards.

### Resource Planning
Queries are provided to identify:

- Total entries
- Entries at each gate
- Busiest gate
- Peak entry hours
- Current people inside the university
- Vehicle usage
- Guard workload
- Student and visitor entry statistics

## Database Concepts Used

- Primary Key
- Foreign Key
- Relationships
- SQL Queries
- Joins
- Aggregate Functions
- Views
- Triggers
- Stored Procedures
- Functions
- Audit Logging

## ER Diagram

The ER diagram represents the entities, attributes, and relationships used in the University Entry Gate Management System.

## Technology Used

- MySQL
- SQL
- GitHub

## Conclusion

The University Entry Gate Management System provides a structured way to manage university entry and exit information. It helps security personnel and management maintain records, monitor gate usage, and analyze entry patterns for better resource utilization.
