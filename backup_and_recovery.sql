# Database Backup and Recovery using MySQL

## Project Overview

This project demonstrates how to:

* Create a database
* Insert sample data
* Take a backup of the database
* Simulate database failure
* Restore the database from backup
* Verify successful recovery

---

# Technologies Used

* MySQL
* MySQL Command Line Client
* SQL

---

# Project Structure

```bash id="i3r0mk"
database-backup-recovery/
│
├── backup_company_db.sql
├── create_database.sql
├── restore_database.sql
└── README.md
```

---

# Step 1: Create Database

## SQL Query

```sql id="4tyvma"
CREATE DATABASE company_db;

USE company_db;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);
```

---

# Step 2: Insert Sample Data

## SQL Query

```sql id="kq98cn"
INSERT INTO employees(emp_name, department, salary)
VALUES
('Alice', 'HR', 50000),
('Bob', 'IT', 65000),
('Charlie', 'Finance', 70000);
```

---

# Step 3: Display Original Data

## SQL Query

```sql id="b6n5h7"
SELECT * FROM employees;
```

## Output

| emp_id | emp_name | department | salary   |
| ------ | -------- | ---------- | -------- |
| 1      | Alice    | HR         | 50000.00 |
| 2      | Bob      | IT         | 65000.00 |
| 3      | Charlie  | Finance    | 70000.00 |

---

# Step 4: Backup the Database

## Backup Command

```bash id="0xj9ea"
mysqldump -u root -p company_db > backup_company_db.sql
```

## Result

```bash id="ifkz6x"
Database backup created successfully:
backup_company_db.sql
```

---

# Step 5: Simulate Database Failure

## SQL Query

```sql id="m9p3el"
DROP DATABASE company_db;
```

## Result

```bash id="k3w9dv"
Query OK, 1 row affected
```

---

# Step 6: Restore the Database

## Create Empty Database

```sql id="7aqowu"
CREATE DATABASE company_db;
```

---

## Restore Command

```bash id="owkr5s"
mysql -u root -p company_db < backup_company_db.sql
```

## Result

```bash id="3v6mle"
Database restored successfully.
```

---

# Step 7: Verify Restored Data

## SQL Query

```sql id="80x8e0"
USE company_db;

SELECT * FROM employees;
```

## Output

| emp_id | emp_name | department | salary   |
| ------ | -------- | ---------- | -------- |
| 1      | Alice    | HR         | 50000.00 |
| 2      | Bob      | IT         | 65000.00 |
| 3      | Charlie  | Finance    | 70000.00 |

---

# Step 8: Verify Record Count

## SQL Query

```sql id="a7r54g"
SELECT COUNT(*) AS total_records
FROM employees;
```

## Output

| total_records |
| ------------- |
| 3             |

---

# Backup File Content (Sample)

## backup_company_db.sql

```sql id="9l2d9h"
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employees VALUES
(1,'Alice','HR',50000.00),
(2,'Bob','IT',65000.00),
(3,'Charlie','Finance',70000.00);
```

---

# Documentation of the Process

## Backup Process

1. Created the database and tables.
2. Inserted sample employee records.
3. Used `mysqldump` to create a backup file.
4. Stored the backup as `backup_company_db.sql`.

---

## Recovery Process

1. Simulated database failure by deleting the database.
2. Created an empty database again.
3. Restored the backup using the MySQL restore command.
4. Verified that all records were recovered successfully.

---

# Expected Final Output

```bash id="o4x2wf"
Backup Created Successfully
Database Deleted
Database Restored Successfully
All Records Recovered
```

---

# Conclusion

This project successfully demonstrates:

* Database backup creation
* Database recovery after failure
* Data restoration verification
* Prevention of data loss using backup mechanisms

The recovery process restored all records accurately, ensuring database reliability and integrity.
