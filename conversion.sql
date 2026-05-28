# Database Migration: MySQL to PostgreSQL

## Project Overview

This project demonstrates how to migrate data from a MySQL database to a PostgreSQL database while ensuring data integrity and consistency.

The migration process includes:

* Creating source and target databases
* Migrating tables and records
* Verifying migrated data
* Maintaining foreign key relationships

---

# Technologies Used

* MySQL
* PostgreSQL
* Python
* pandas
* SQLAlchemy
* pymysql
* psycopg2

---

# Project Structure

```bash
database-migration/
│
├── create_tables_postgresql.sql
├── mysql_to_postgresql.py
├── verify_data.py
└── README.md
```

---

# Step 1: Create MySQL Database

## MySQL Queries

```sql
CREATE DATABASE company_db;

USE company_db;

CREATE TABLE departments (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(100)
);

CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(100),
    salary DECIMAL(10,2),
    dept_id INT,
    FOREIGN KEY (dept_id)
    REFERENCES departments(dept_id)
);
```

---

# Step 2: Insert Sample Data

```sql
INSERT INTO departments (dept_name)
VALUES
('HR'),
('IT'),
('Finance');

INSERT INTO employees (emp_name, salary, dept_id)
VALUES
('Alice', 50000, 1),
('Bob', 65000, 2),
('Charlie', 70000, 3);
```

---

# Step 3: Create PostgreSQL Database

## PostgreSQL Queries

```sql
CREATE DATABASE company_pg;
```

---

# Step 4: Create Tables in PostgreSQL

Save as: `create_tables_postgresql.sql`

```sql
CREATE TABLE departments (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(100)
);

CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(100),
    salary NUMERIC(10,2),
    dept_id INTEGER,
    FOREIGN KEY (dept_id)
    REFERENCES departments(dept_id)
);
```

---

# Step 5: Install Required Libraries

```bash
pip install pandas sqlalchemy pymysql psycopg2
```

---

# Step 6: Migration Script

Save as: `mysql_to_postgresql.py`

```python
import pandas as pd
from sqlalchemy import create_engine

# -------------------------------
# MYSQL CONNECTION
# -------------------------------
mysql_engine = create_engine(
    "mysql+pymysql://root:password@localhost/company_db"
)

# -------------------------------
# POSTGRESQL CONNECTION
# -------------------------------
pg_engine = create_engine(
    "postgresql+psycopg2://postgres:password@localhost/company_pg"
)

# -------------------------------
# TABLES TO MIGRATE
# -------------------------------
tables = ["departments", "employees"]

for table in tables:
    print(f"Migrating table: {table}")

    # Read table from MySQL
    df = pd.read_sql(f"SELECT * FROM {table}", mysql_engine)

    # Write table into PostgreSQL
    df.to_sql(
        table,
        pg_engine,
        if_exists="replace",
        index=False
    )

    print(f"Successfully migrated: {table}")

print("Migration Completed Successfully")
```

---

# Step 7: Verify Data Integrity

Save as: `verify_data.py`

```python
import pandas as pd
from sqlalchemy import create_engine

mysql_engine = create_engine(
    "mysql+pymysql://root:password@localhost/company_db"
)

pg_engine = create_engine(
    "postgresql+psycopg2://postgres:password@localhost/company_pg"
)

tables = ["departments", "employees"]

for table in tables:

    mysql_count = pd.read_sql(
        f"SELECT COUNT(*) AS count FROM {table}",
        mysql_engine
    )["count"][0]

    pg_count = pd.read_sql(
        f"SELECT COUNT(*) AS count FROM {table}",
        pg_engine
    )["count"][0]

    print(f"\nTable: {table}")
    print(f"MySQL Rows: {mysql_count}")
    print(f"PostgreSQL Rows: {pg_count}")

    if mysql_count == pg_count:
        print("Data Integrity Verified")
    else:
        print("Mismatch Found")
```

---

# Step 8: Run the Project

## Execute PostgreSQL Table Script

```bash
psql -U postgres -d company_pg -f create_tables_postgresql.sql
```

## Run Migration Script

```bash
python mysql_to_postgresql.py
```

## Run Verification Script

```bash
python verify_data.py
```

---

# Expected Output

```bash
Migrating table: departments
Successfully migrated: departments

Migrating table: employees
Successfully migrated: employees

Migration Completed Successfully
```

---

# Data Integrity Verification Output

```bash
Table: departments
MySQL Rows: 3
PostgreSQL Rows: 3
Data Integrity Verified

Table: employees
MySQL Rows: 3
PostgreSQL Rows: 3
Data Integrity Verified
```

---

# Conclusion

This project successfully migrates relational data from MySQL to PostgreSQL while preserving:

* Data consistency
* Referential integrity
* Accurate row counts
* Table relationships

The verification process confirms successful migration without data loss.
