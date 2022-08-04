CREATE DATABASE ORG;
USE ORG;


CREATE TABLE WORKERS (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME VARCHAR(25),
	LAST_NAME VARCHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT VARCHAR(25)
);

SELECT * FROM WORKERS;

INSERT INTO WORKERS 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
        
  /* Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias
 name as <WORKER_NAME>.
 */
 
 Select FIRST_NAME AS WORKER_NAME from WORKERS;
 
 /* Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
 */
 
 select upper(FIRST_NAME) from WORKERS;
 
 
 CREATE TABLE departments( 
    department_id INTEGER PRIMARY KEY, 
    department_name VARCHAR(30),
    location_id INTEGER
    ) ;

SELECT * FROM departments;



 INSERT INTO departments VALUES ( 20,'Marketing',  180);
 INSERT INTO departments VALUES ( 30,'Purchasing',  1700);
 INSERT INTO departments VALUES ( 40, 'Human Resources',  2400);
 INSERT INTO departments VALUES ( 50, 'Shipping',  1500);
 INSERT INTO departments VALUES ( 60 , 'IT',  1400);
 INSERT INTO departments VALUES ( 70, 'Public Relations',  2700);
 INSERT INTO departments VALUES ( 80 , 'Sales',  2500 );
 INSERT INTO departments VALUES ( 90 , 'Executive',  1700);
 INSERT INTO departments VALUES ( 100 , 'Finance',  1700);
 INSERT INTO departments VALUES ( 110 , 'Accounting',  1700);
 INSERT INTO departments VALUES ( 120 , 'Treasury' ,  1700);
 INSERT INTO departments VALUES ( 130 , 'Corporate Tax' ,  1700 );
 INSERT INTO departments VALUES ( 140, 'Control And Credit' ,  1700);
 INSERT INTO departments VALUES ( 150 , 'Shareholder Services', 1700);
 INSERT INTO departments VALUES ( 160 , 'Benefits', 1700);
 INSERT INTO departments VALUES ( 170 , 'Payroll' , 1700);


 /*
 Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
 */
 
 select distinct department from WORKERS;
 
 /*
 Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker
 table into a single column COMPLETE_NAME. A space char should separate them.
 */
 
 Select CONCAT(FIRST_NAME, ' ', LAST_NAME) AS 'COMPLETE_NAME' from WORKERS;
 
 /*
Write an SQL query to print all Worker details from 
the Worker table order by FIRST_NAME Ascending.
*/

Select * from WORKERS order by FIRST_NAME ASC;

/*
Write an SQL query to print all Worker details from the Worker table 
order by FIRST_NAME Ascending and DEPARTMENT Descending.
*/

Select * from WORKERS order by FIRST_NAME asc, DEPARTMENT desc;

/*
 Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” 
 from Worker table.
 */
 
 Select * from WORKERS where FIRST_NAME in ('Vipul','Satish');
 
/*
 Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish”
 from Worker table.
 */
 
 Select * from WORKERS where FIRST_NAME  not in ('Vipul','Satish');
 
 /*
 Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
*/

Select * from WORKERS where DEPARTMENT like 'Admin%'; 


/*
Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
*/

select *from  WORKERS where  FIRST_NAME  LIKE "%a%";

/*
Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
*/

select *from  WORKERS where  FIRST_NAME  LIKE "%a";

/*
Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and 
contains six alphabets.
*/


select *from  WORKERS where  FIRST_NAME  LIKE "h";

/*
 Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
*/

select *from  WORKERS where salary between 100000 and 500000;

/*
Write an SQL query to print details of the Workers who have joined in Feb’2014.
*/
select *from  WORKERS where year(JOINING_DATE)=2014 AND month(JOINING_DATE)=02;

   -- select now(),year(now()),month(now());

   -- SELECT JOINING_DATE,year(JOINING_DATE),month(JOINING_DATE) FROM WORKERS;

/*
 Write an SQL query to fetch the count of employees working in the department ‘Admin’.
*/
SELECT COUNT(*) FROM WORKERS WHERE department = "Admin";

/*
Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
*/

SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) As Worker_Name, Salary
FROM WORKERS 
WHERE WORKER_ID IN (
SELECT WORKER_ID
 FROM worker 
WHERE Salary BETWEEN 50000 AND 100000
);
 
 
 /*
 Write an SQL query to fetch the no. of workers for each department in the descending order.
*/

SELECT DEPARTMENT, count(WORKER_ID) No_Of_Workers 
FROM WORKERS 
GROUP BY DEPARTMENT 
ORDER BY No_Of_Workers DESC;
 

CREATE TABLE employees
   ( employee_id INTEGER,
   first_name VARCHAR(20),
   last_name VARCHAR(25) ,
   email VARCHAR(25),
   phone_number VARCHAR(20),
   hire_date DATE,
   job_id VARCHAR(10),
   salary INTEGER,
   commission_pct INTEGER,
   manager_id INTEGER,
   department_id INTEGER,
   constraint pk_emp primary key (employee_id) ,
   constraint fk_deptno foreign key (department_id) references departments(department_id)  
   ) ;

CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
/*
Write an SQL query to print details of the Workers who are also Managers.
*/

SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE
FROM WORKERS W
INNER JOIN Title T
ON W.WORKER_ID = T.WORKER_REF_ID
AND T.WORKER_TITLE in ('Manager');

/*
Write an SQL query to fetch duplicate records having matching data in some fields of a table.
*/

SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
FROM Title
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1;

/*
Write an SQL query to show only odd rows from a table.
*/

SELECT * FROM WORKERS WHERE MOD (WORKER_ID, 2)=1 ;

select mod(10,2);

select WORKER_ID
 FROM WORKERS;

/*
Write an SQL query to show only even rows from a table.
*/
SELECT * FROM WORKERS WHERE MOD (WORKER_ID, 2)=0;

/*
Write an SQL query to show the current date and time.
*/
select *from  WORKERS where current_time() AND CURRENT_DATE();

/*
Write an SQL query to show the top n (say 10) records of a table.
*/

SELECT * FROM WORKERS ORDER BY Salary DESC LIMIT 10;

/*
 Write an SQL query to determine the nth (say n=5) highest salary from a table.
 */
 SELECT 
 WORKER_ID ,
	FIRST_NAME,
	LAST_NAME ,
	SALARY 
FROM WORKERS ORDER BY Salary DESC LIMIT 5;
 
/*
Write an SQL query to fetch the list of employees with the same salary.
*/
Select distinct W.WORKER_ID, W.FIRST_NAME, W.Salary 
from WORKERS W, Worker W1 
where W.Salary = W1.Salary 
and W.WORKER_ID != W1.WORKER_ID;

 /*
 Write an SQL query to show the second highest salary from a table.
 */
 select max(Salary) from WORKERS
where Salary not in (Select max(Salary) from WORKERS);

/*
 Write an SQL query to fetch the first 50% records from a table.
 */
 SELECT * FROM WORKERS
 WHERE WORKER_ID <=(SELECT count(WORKER_ID)/2 FROM WORKERS);

 
 SELECT count(WORKER_ID)/2 FROM WORKERS;

 /*
 Write an SQL query to fetch the departments that have less than five people in it.
 */
 
 SELECT DEPARTMENT, COUNT(WORKER_ID) as 'Number of Workers' FROM WORKERS
 GROUP BY DEPARTMENT HAVING COUNT(WORKER_ID) < 5;
 
 --  SELECT DEPARTMENT, COUNT(WORKER_ID) as 'Number of Workers' FROM WORKERS 
 --  WHERE COUNT(WORKER_ID) < 5
 --  GROUP BY DEPARTMENT ;
 
 --  WE CAN'T USE GROUP FUNCTIONS IN WHERE .
 
 /*
 Write an SQL query to show all departments along with the number of people in there.
 */
 SELECT DEPARTMENT, COUNT(DEPARTMENT) as 'Number of Workers' FROM WORKERS GROUP BY DEPARTMENT;
 
 /*
 Write an SQL query to show the last record from a table.
 */
 
 
 Select * from WORKERS where WORKER_ID = (SELECT max(WORKER_ID) from WORKERS);
 
 /*
 Write an SQL query to fetch the first row of a table.
 */
 
 
 Select * from WORKERS where WORKER_ID = (SELECT min(WORKER_ID) from WORKERS);
 
 /*
 Write an SQL query to fetch three max salaries from a table.
 */
 
 SELECT distinct Salary from WORKERS a 
 WHERE 3 >= (SELECT count(distinct Salary) from WORKERS b
 WHERE a.Salary <= b.Salary)
 order by a.Salary desc;
 
/*
 Write an SQL query to fetch three min salaries from a table.
 */
 
 SELECT distinct Salary from WORKERS a 
 WHERE 3 >= (SELECT count(distinct Salary) from WORKERS b 
 WHERE a.Salary >= b.Salary) 
 order by a.Salary desc;
 
 /*
 Write an SQL query to fetch departments along with the total salaries paid for each of them.
 */
 
 
 SELECT DEPARTMENT, sum(Salary) from WORKERS group by DEPARTMENT;
 
 /*
 Write an SQL query to fetch the names of workers who earn the highest salary.
 */
 
 
 SELECT
 FIRST_NAME,
 SALARY from WORKERS WHERE SALARY=(SELECT max(SALARY) from WORKERS
 );
 



