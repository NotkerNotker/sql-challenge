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
    dept_no varchar(20)   NOT NULL,
    dept_name varchar(50)   NOT NULL,
	CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

--ADD TABLE ALTERS
-- ALTER TABLE Departments 
-- RENAME COLUMN dep_no TO dept_no;

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Titles ADD CONSTRAINT fk_Titles_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Dept_Employees ADD CONSTRAINT fk_Dept_Employees_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Dept_Employees ADD CONSTRAINT fk_Dept_Employees_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

Select * from Employees;
--Part One: get various stuff from data
Select Employees.emp_no, Employees.first_name, Employees.last_name, Employees.gender, Salaries.salary
from Salaries
inner join Employees on
Employees.emp_no=Salaries.emp_no;

--Part Two: get employees hired in 1986
Select first_name, hire_date from Employees Where hire_date >= '1986-01-01' And hire_date < '1986=12-31';

--Part Three: get various more stuff from more data
--List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name, and start and end employment dates.
Select * from Dept_Manager;
Select * from Employees;
Select * from Departments;
Select * from Dept_Employees;

Create view managerStuff as
Select Dept_Manager.emp_no, Dept_Manager.dept_no, Employees.first_name, Employees.last_name, Dept_Manager.from_date, Dept_Manager.to_date, Departments.dept_name
from Dept_Manager
inner Join Employees
On Dept_Manager.emp_no = Employees.emp_no
 	join Departments
 	on Departments.dept_no = Dept_Manager.dept_no;
--Part Four: get various more data on departments for employees
--List the department of each employee with the following information: employee number, last name, first name, and department name.
create view testing as
Select Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
from Employees
join Dept_Employees
on Employees.emp_no = Dept_Employees.emp_no
	join Departments
	on Departments.dept_no = Dept_Employees.dept_no
		Order by emp_no asc;
select * from testing;
--drop view testing;

--Part Five: Find Hercules Boone
--List all employees whose first name is "Hercules" and last names begin with "B."
Select * from Employees
Where first_name = 'Hercules' and last_name like 'B%';

--Part Six: List those awful sales people
--List all employees in the Sales department, including their employee number, last name, first name, and department name.
Select * from testing
Where dept_name = 'Sales';
--refer to part four. Made a view

--Part Seven: Development can stay I guess
--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

Select * from testing
Where dept_name = 'Sales' or dept_name = 'Development';
--refer to part four again

--Part Eight: Couldn't think of anything funny for this one
--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

Select last_name, count(last_name) as "Name Count"
from Employees
Group by last_name
Order by last_name;

--Bonus!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



