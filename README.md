# Punjab University Management System

## 1. Introduction
This project focuses on the design and implementation of a robust relational database system tailored for an University. The goal is to provide a structured environment that ensures data integrity, minimizes redundancy, and allows for efficient querying and reporting.

## 2. Objective
The primary objective of this database is to:
* **Centralize Data:** Store all organizational information in a single, unified system.
* **Optimize Performance:** Enable fast retrieval of records through indexing and normalized structures.
* **Ensure Security:** Maintain data consistency through the use of primary keys, foreign keys, and constraints.

---

## Scope of Database
The database covers the core operational workflows of **[Punjab University]**, including:
* Management of **Student Lifecycle**.
* Tracking of **Academic Progress**.
* Reporting on **Institutional Analytics**.

## Entities and Their Description
| Entity Name | Description | Key Attributes |
| :--- | :--- | :--- |
| **Student:** | Registered individuals identified by a unique Roll Number within a specific program.. | Roll_No(PK), Name, CNIC, Email, Prog_ID(FK) |
| **Department** |Academic units managing programs and faculty. | Dept_ID(PK), Dept_Name, Office_Location |
| **Program** | Degree pathways (e.g., BSCS) within a department. | Prog_ID(PK), Prog_Title, Duration, Dept_ID(FK) |
| **Faculty** | Academic staff assigned to specific departments. | Faculty_ID(PK), Name, Designation, Dept_ID(FK) |
| **Course** | Subjects defined by syllabus and credit hours. | Course_Code(PK), Title, Credit_Hours |
| **Section** | Specific classes (Morning/Evening) for a course. | Section_ID(PK), Course_Code(FK), Faculty_ID(FK) |
| **Enrollment** |Record of students registered in course sections. | Enroll_ID(PK), Roll_No(FK), Section_ID(FK), Semester |
| **Result** | Performance records showing marks and grades. | Result_ID(PK), Enroll_ID(FK), Marks, Grade, GPA |

## Assumptions if Any
In designing this schema, the following assumptions were made:
1.  **Unique Identifiers:** Every user must provide a unique email address for registration.
2.  **Data Currency:** All monetary values are stored in [INR].
3.  **One-to-Many Relationships:** A single Department can host multiple Students, but each Student is officially registered under only one Department.

## Database Design Logic
The database follows the **3rd Normal Form (3NF)** to ensure minimal data duplication. 



### Logic Highlights:
* **Normalization:**To eliminate data redundancy, large datasets were decomposed into smaller, logical units. For example, Address and Contact Details were separated from the Student and Faculty profiles. This ensures that a change in a city's postal code or a hostel's address only needs to be updated in one central location.
* **Integrity:** We implemented strict Foreign Key constraints to maintain data accuracy. For instance, Cascading Deletes are applied to the Enrollment table; if a Course is removed from the curriculum, all associated student enrollments for that specific course are automatically cleaned up to prevent orphaned records.
* **Indexing:** To ensure fast retrieval of academic records across thousands of students, B-Tree Indexes are applied to all Primary Keys (like Roll_No) and frequently searched columns such as Course_Code and Exam_Date.
---

## Conclusion
This database provides a scalable foundation for **PU-DBMS: Punjab University Management System**. By adhering to relational best practices, the system is prepared to handle growing data volumes while maintaining high performance and ease of maintenance for future developers.
