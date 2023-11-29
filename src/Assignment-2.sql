---2.Create a table persons with first_name, last_name,city and age and add a constraint where age < 21

CREATE TABLE persons
(
first_name VARCHAR(20),
last_name VARCHAR(20),
city VARCHAR(20),
age int CHECK(age<21)
);
---1.Insert the  4 records with age less than 21 and atleast one record should have city value as “Mumbai”
INSERT INTO persons VALUES 
('Kanhaiya','Kumar','Mumbai',20),
('Ashath','Gowda','Karnatka',19),
('Gri','sharma','Andhara',18),
('Sharvan','Kumar','Banglore',17);

---2.Insert one more record which is greater than 21 and give the result
INSERT INTO persons VALUES 
('Rahul','Kumar','Patna',21),
--Here I try to insert one more record then it is sowing error Msg 102, Level 15, State 1, Line 18Incorrect syntax near ','.
  

----3.Add one more constraint in the same table where city = “Mumbai”
ALTER TABLE persons
ADD CONSTRAINT check_city_mumbai CHECK (city = 'Mumbai');
---Here I got aerror while adding a Constraint in city columns :-Msg 547, Level 16, State 0, Line 21
--The ALTER TABLE statement conflicted with the CHECK constraint "check_city_mumbai". The conflict occurred in database "ecommerce", table "dbo.persons", column 'city'.
--Completion time: 2023-11-28T12:07:51.1567921+05:30

--4.Insert one more record where city = “jaipur” and give the result
INSERT INTO persons  VALUES
('Satyam', 'Kumar', 'Jaipur', 16);

--5.Drop both the Constraints
ALTER TABLE persons
DROP CONSTRAINT CK__persons__age__693CA210;

--6.Create view where city = ‘Mumbai’
CREATE VIEW Mumbai_View AS
SELECT * FROM persons
WHERE city = 'Mumbai';

--Now we are able to see our record by using view 
SELECT * FROM Mumbai_View;



select *
from persons;
