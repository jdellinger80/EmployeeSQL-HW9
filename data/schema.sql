-- Step 2: DATA ENGINEERING

CREATE TABLE Employees (
    emp_no INTEGER   NOT NULL,
    emp_title VARCHAR   NOT NULL,
    birth_date date   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date date   NOT NULL,
	PRIMARY KEY (emp_no)
);

SELECT * from Employees;

CREATE TABLE Departments (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
	PRIMARY KEY (dept_no)
);

SELECT * from Departments;

CREATE TABLE Department_Employees (
    emp_no INTEGER   NOT NULL,
	dept_no VARCHAR   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

SELECT * from Department_Employees;

CREATE TABLE Department_Manager (
    dept_no VARCHAR   NOT NULL,
    emp_no INTEGER   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

SELECT * from Department_Manager;


CREATE TABLE Salaries (
    emp_no INTEGER   NOT NULL,
	salary INTEGER   NOT NULL,  
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

SELECT * from Salaries;



CREATE TABLE Titles (
	emp_title VARCHAR   NOT NULL,
    title VARCHAR   NOT NULL,
    PRIMARY KEY (emp_title)
);

SELECT * from Titles;