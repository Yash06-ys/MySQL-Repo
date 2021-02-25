Create database New_Org;
Use New_Org;

CREATE TABLE employees (
    employees_Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    First_Name CHAR(25),
    Last_Name CHAR(25),
    Salary INT(15),
    Joining_Date DATETIME,
    Department CHAR(15)
);

CREATE TABLE Bonus (
    employees_ref_id INT NOT NULL,
    Bonus_Amount INT(10),
    Bonus_Date DATE,
    FOREIGN KEY (employees_ref_id)
        REFERENCES employees (employees_Id)
        ON DELETE CASCADE
);

CREATE TABLE Title (
    employees_ref_id INT,
    employees_work_title CHAR(25),
    FOREIGN KEY (employees_ref_id)
        REFERENCES employees (employees_Id)
        ON DELETE CASCADE
); 

Insert into employees (employees_Id, First_Name, Last_Name, Salary, Joining_Date, Department) Values 
(001,'Yash','Shrivastava', 100000,'21-02-19 09.00.00','Analyst'),
(002,'Niharika','Lath',70000,'21-02-18 09.00.00','HR'),
(003,'Mohit','Jhawar',80000,'21-02-17 09.00.00','Sales'),
(004,'Amit','Kumar',85000,'21-02-16 09.00.00','Admin'),
(005,'Ansuman','Hota',60000,'21-02-15 09.00.00','Marketing'),
(006, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin'),
(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account');

Insert into bonus (employees_ref_id, Bonus_Amount, Bonus_Date) values
(001,5000,'21-03-01'),
(002,4000,'21-03-02'),
(003,3500,'21-03-06'),
(004,2000,'21-03-01');

Insert into title (employees_ref_id,employees_work_title) values
(001,'Junior Analyst'),
(002,'Junior Hr'),
(003,'Junior Sales'),
(004,'Junior Admin'),
(005,'Junior Marketing'),
(006,'Junior Admin'),
(007,'Junior Accountant');

Select * from employees

SELECT 
    *
FROM
    bonus

Select * from title

Select Concat(First_Name,' ',Last_Name) as Workers_Name from employees /* this will concatenate the first name and last name as and will display the name*/

Select Distinct(Department) from employees /*this will give the different department names without repetation*/

Select Substring(First_Name,1,3) as workers_name from employees /*This will give us the first 3 letter from the first name column */

Select INSTR(First_Name, Binary 'a') from employees where First_Name = 'Yash';/*This will give the index of small a in the first name Yash */

Select ltrim(First_Name) from employees /*This will remove the whitespace present in the left side of the first name*/

Select Rtrim(employees_work_title) from title /*This will remove the whitespace present in the right side of the employees work title*/

Select distinct(employees_work_title) from title

Select replace(First_Name , 'a','A') from employees /*It will replace the first name a with A */

Select * from employees
order by First_Name asc /*It will give the output in the ascending order*/

Select * from employees
order by First_Name asc, Department Desc

Select * from employees
where First_Name in ('Yash','Amit');

Select * from employees
where First_Name not in ('Yash','Amit');

Select * from employees
where Department = 'Admin';

Select * from employees
where first_name like '%a%'; /*This will give the output where the first name contains a in it*/

Select * from employees
where first_name like '%a'; /*This will return the first name where a is in the end of it*/

Select * from employees
where Salary between 80000 and 70000;

Select * from employees
where year(Joining_Date) = 2021 and month(Joining_Date) = 02;

Select count(*) from employees
where Department = 'Admin';

Select count(*) from employees
where Department = 'Hr';

Select concat(First_Name,' ',Last_Name) as workers_name, Salary from employees
where Salary between 50000 and 100000;

Select Department, count(employees_Id) as No_of_workers from employees
group by Department 
order by No_of_workers asc

Select employees.First_Name, employees.Last_Name, employees.Salary, title.employees_work_title
from employees
left join title
on employees.employees_id = title.employees_ref_id


Select employees.First_Name, employees.Last_Name,bonus.bonus_amount,bonus.bonus_date
from employees
right join bonus
on employees.employees_Id = bonus.employees_ref_id

Select * from employees 
order by salary DESC
limit 5

Select MAX(Salary),first_name,last_name from employees
where salary < (Select MAX(Salary) from employees);

Select * from employees
where First_Name like 'a%';

Select upper(First_Name)  from employees

Select upper(Concat(First_name,' ',Last_name)) as workers_name from employees

/*Lets Make use of the Aggregate functions of MySQL*/

Select count(distinct employees_work_title) from title

Select count(distinct salary) from employees

Select Sum(salary) from employees

Select Min(salary) from employees

Select Max(salary) from employees

Select AVG(salary) from employees

Select Round(AVG(salary),2) from employees

Select concat(first_name,' ',last_name) as worker_name, Max(salary) from employees
where salary < (Select Max(salary) from employees)

Select concat(first_name,' ',last_name) as worker_name, Min(salary) from employees
where salary > (select min(salary) from employees)

/* Data Manipulations Query*/

Select * from employees

Select * from bonus

Select * from title

Select * from employees
where First_name like 'a%'

Select * from employees
where first_name not like 'a%'

Select * from employees



Alter table employees
Add Gender char(15)

Insert into employees (Gender) values
('Male'),('Female'),('Male'),('Male'),('Male'),('Female'),('Male')

Alter Table  employees drop column gender

select * from employees

Select * from employees
where first_name like 'a%' or first_name like '%a'

Select * from employees
where salary between '80000' and '100000';

Select * from employees
where employees_Id in (1,4,5)

Select * from employees
where employees_id not in (1,4,5)

Select * from employees
where department is not null

Select Distinct joining_date from employees





