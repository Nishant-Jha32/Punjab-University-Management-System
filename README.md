PANJAB‍‌‍‍‌‍‌‍‍‌ UNIVERSITY ACADEMIC MANAGEMENT SYSTEM – DBMS PROJECT 
Project Overview 
This project is about a structured relational database model for Panjab University that can manage and integrate the university's academic, administrative, and student-centric operations. The system is an implementation of core DBMS concepts like entity–relationship modeling, normalization, primary–foreign key relationships, referential integrity, and schema design. 
The database is aimed at making the university administration more efficient by providing it with a tool to manage data of different areas such as the departments, faculty, students, courses, registrations, examinations, fees, library services, and hostel management. The system is designed to ensure that data are consistent, redundant data are minimized, and the academic administration is ‍‌‍‍‌‍‌‍‍‌scalable. 

OBJECTIVE:
•	Consolidate academic and administrative information 
•	Enhance the correctness of student, course and examination records 
•	Facilitate efficient querying and reporting 
•	Ensure robust relational integrity among university entities 
•	Represent actual university operations by a normalized ‍‌‍‍‌‍‌‍‍‌schema 
KEY FEATURES:
•	Comprehensive department and faculty management
•	Student enrollment and academic profile tracking
•	Course and section management with faculty assignment
•	Student–course registration with grading support
•	Examination scheduling and result storage
•	Fee management with payment status tracking
•	Library book inventory and transaction history
•	Hostel and room allocation management
•	Well-defined primary and foreign key constraints
•	Fully normalized tables for performance and data consistency



ER DIAGRAM EXPLAINED :
Department: It‍‌‍‍‌‍‌‍‍‌ represents the departments of a university with details like the name, building, and the budget that is allocated. It performs as a master entity that is linked with the faculty, courses, and students.
Faculty: This procedure deals with the records of the staff that teaches, the information being the name, email, hire date, and the department they belong to. Every faculty member is associated with a single department
Course: This entity refers to the academic courses that are available with the departments, along with the course code, title, and credit breakdown. Every course is related to a particular department.
Student: This library keeps the academic profiles of students, along with the roll number, year of enrollment, and major department. It acts as a main entity that is linked with registration, fees, library, hostel, and exam results.
Section: It is the representation of the courses that are to be taken per semester and year, with faculty and the room assigned. There are supported multiple offerings of the same course across semesters.
Registration: This is the point table that interconnects students and sections, thus recording course enrollment and grades. It carries out a many-to-many relationship between students and course sections.
Fees: It records the financial transactions that are related to student's fees such as semester fee, exam fee, payment status, and dates.
Book: It is the collection of the library books that comprises the ISBN, author, publication year, and the copies that are available.
Library Transaction: This is the process of recording the activities of the issue and return of the books by the students; it also mentions the due date and the fine amount if any.
Hostel: It holds information about the hostel such as the name, type, and the capacity of the hostel.
Room_Allocation: It is the management of the assignment of the hostel rooms to the students, also containing the check-in and check-out dates.
Exam_Schedule: This is the place where the details of the exam are being stored such as date, type, and maximum marks for each course.
Exam_Result:A record of student achievement in examinations, including marks scored and result ‍‌‍‍‌‍‌‍‍‌status.




