
mysql-ctl cli

#ask for databases
create database dog;

use dog;
select database();
show databases;

# ask for tables
create table pastries
  (
    name varchar (50),
    age int
   );

show tables;
desc pastries;
drop table pastries;

# insert data

insert into pastries(name, age) values ('cute', 99);

INSERT INTO pastries 
            (name, age) 
VALUES      ('love', 88), 
            ('beautiful', 20), 
            ('adorable', 988);

SELECT * FROM pastries;
SHOW WARNINGS; 
# if errors instead of warning, then use       set sql_mode='';

CREATE TABLE pastries2
  (
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL
  );

CREATE TABLE pastries3
  (
    name VARCHAR(50) DEFAULT 'no name provided',
    age INT DEFAULT 99
  );

# add a primary key

CREATE TABLE unique_pastries4
  (
    person_id INT NOT NULL auto_increment,
    name VARCHAR(50),
    age INT,
    PRIMARY KEY (person_id)
  );

INSERT INTO unique_pastries4(person_id, name, age) VALUES(1, 'Fred', 23);
INSERT INTO unique_pastries4(person_id, name, age) VALUES(2, 'Louise', 3);
INSERT INTO unique_pastries4(person_id, name, age) VALUES(1, 'James', 3);

SELECT * FROM unique_pastries4;
SELECT name FROM unique_pastries4;
SELECT name, age FROM unique_pastries4; 
SELECT * FROM unique_pastries4 WHERE age=3;
SELECT person_id, age FROM unique_pastries4 WHERE person_id<=age; 

SELECT name AS 'person name', age AS 'birthday' FROM unique_pastries4;

UPDATE unique_pastries4 SET age=999 WHERE person_id='2'; 

DELETE FROM cats WHERE name='Egg';
DELETE FROM cats;  # delete all items in that table, not in that database


# use some files
source xxx.sql


