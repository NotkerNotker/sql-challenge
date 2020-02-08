-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/L6lh5X
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

drop table Employees;
drop table Salaries;
drop table Titles;
drop table Dept_Manager;
drop table Dept_Employees;
drop table Departments;
CREATE TABLE Employees (
    emp_no integer   NOT NULL,
    birth_date varchar(50)   NOT NULL,
    first_name varchar(50)   NOT NULL,
    last_name varchar(50)   NOT NULL,
    gender varchar(20)   NOT NULL,
    hire_date varchar(50)   NOT NULL,
	CONSTRAINT pk_Employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Salaries (
    emp_no integer   NOT NULL,
    salary integer   NOT NULL,
    from_date varchar(50)   NOT NULL,
    to_date varchar(50)   NOT NULL
);

CREATE TABLE Titles (
    emp_no integer   NOT NULL,
    title varchar(50)   NOT NULL,
    from_date varchar(50)   NOT NULL,
    to_date varchar(50)   NOT NULL
);

CREATE TABLE Dept_Manager (
    dept_no varchar(20)   NOT NULL,
    emp_no integer   NOT NULL,
    from_date varchar(50)   NOT NULL,
    to_date varchar(50)   NOT NULL
);

CREATE TABLE Dept_Employees (
    emp_no integer   NOT NULL,
    dept_no varchar(20)   NOT NULL,
    from_date varchar(50)   NOT NULL,
    to_date varchar(50)   NOT NULL
);

CREATE TABLE Departments (
    dep_no varchar(20)   NOT NULL,
    dept_name varchar(50)   NOT NULL,
	CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dep_no"
     )
);

--ADD TABLE ALTERS

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Titles ADD CONSTRAINT fk_Titles_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dep_no);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Dept_Employees ADD CONSTRAINT fk_Dept_Employees_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Dept_Employees ADD CONSTRAINT fk_Dept_Employees_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dep_no);

Select * from Employees;
--Part One: get various stuff from data
Select Employees.emp_no, Employees.first_name, Employees.last_name, Employees.gender, Salaries.salary
from Salaries
inner join Employees on
Employees.emp_no=Salaries.emp_no;

--Part Two: get employees hired in 1986
Select first_name, hire_date from Employees Where hire_date >= '1986-01-01' And hire_date < '1986=12-31';

--Part Three: 