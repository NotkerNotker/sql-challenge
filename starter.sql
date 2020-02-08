CREATE TABLE "Employees" (
    "emp_no" integer   NOT NULL,
    "birth_date" varchar(50)   NOT NULL,
    "first_name" varchar(50)   NOT NULL,
    "last_name" varchar(50)   NOT NULL,
    "gender" varchar(20)   NOT NULL,
    "hire_date" varchar(50)   NOT NULL
);

CREATE TABLE "Salaries" (
    "emp_no" integer   NOT NULL,
    "salary" integer   NOT NULL,
    "from_date" varchar(50)   NOT NULL,
    "to_date" varchar(50)   NOT NULL
);

CREATE TABLE "Titles" (
    "emp_no" integer   NOT NULL,
    "title" varchar(50)   NOT NULL,
    "from_date" varchar(50)   NOT NULL,
    "to_date" varchar(50)   NOT NULL
);

CREATE TABLE "Dept_Manager" (
    "dept_no" varchar(20)   NOT NULL,
    "emp_no" integer   NOT NULL,
    "from_date" varchar(50)   NOT NULL,
    "to_date" varchar(50)   NOT NULL
);

CREATE TABLE "Dept_Employees" (
    "emp_no" integer   NOT NULL,
    "dept_no" varchar(20)   NOT NULL,
    "from_date" varchar(50)   NOT NULL,
    "to_date" varchar(50)   NOT NULL
);

CREATE TABLE "Departments" (
    "dep_no" varchar(20)   NOT NULL,
    "dept_name" varchar(50)   NOT NULL
);