
drop database if exists dog;
create database dog;
use dog;

create table dogs (name char(5), breed varchar(10));
insert into dogs (name, breed)
value 
	('bob', 'beagle'),
	('robby', 'corgi'),
	('princess jane', 'retriever');
select * from dogs;

# Used for text that we know has a fixed length, e.g., State abbreviations, 
# abbreviated company names, sex M/F, etc.

# decimal

create table items(price decimal(5,2));   # (p,s), p is the precision = all digits, s = the digital number
insert into items (price)
value 
	(7), (10000), (23.8022222), (66.66);    
	
	
# float and double

CREATE TABLE thingies (price FLOAT);
INSERT INTO thingies(price) VALUES (88.45);
SELECT * FROM thingies;
 
INSERT INTO thingies(price) VALUES (8877.45);
SELECT * FROM thingies;
 
INSERT INTO thingies(price) VALUES (8877665544.45);
SELECT * FROM thingies;

# date, time and datetime

CREATE TABLE people (name VARCHAR(100), birthdate DATE, birthtime TIME, birthdt DATETIME);
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES('Larry', '1943-12-25', '04:10:42', '1943-12-25 04:10:42');
 
SELECT * FROM people;
 
SELECT name, DAY(birthdate) FROM people;

SELECT name, birthdate, DAYNAME(birthdate) FROM people;  # monday...
SELECT name, birthdate, DAYOFWEEK(birthdate) FROM people; # Sunday = 1
SELECT name, birthdate, DAYOFYEAR(birthdate) FROM people;
 
SELECT name, birthdt, DAYOFYEAR(birthdt) FROM people;
SELECT name, birthdt, MONTH(birthdt) FROM people;
SELECT name, birthdt, MONTHNAME(birthdt) FROM people;

SELECT name, birthtime, HOUR(birthtime) FROM people;
SELECT name, birthtime, MINUTE(birthtime) FROM people;
 
 # format functin for time
 
SELECT CONCAT(MONTHNAME(birthdate), ' ', DAY(birthdate), ' ', YEAR(birthdate)) FROM people;
 
SELECT DATE_FORMAT(birthdt, 'Was born on a %W') FROM people;   # Was born on a Friday
SELECT DATE_FORMAT(birthdt, '%m/%d/%Y') FROM people;    # 11/11/1983
SELECT DATE_FORMAT(birthdt, '%m/%d/%Y at %h:%i') FROM people;  # 11/11/1983 at 10:07


# data math

SELECT * FROM people;
SELECT name, birthdate, DATEDIFF(NOW(), birthdate) FROM people;   # date from now
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) FROM people;   # + one month
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 10 SECOND) FROM people;
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 3 QUARTER) FROM people;
 
SELECT birthdt, birthdt + INTERVAL 1 MONTH FROM people;
SELECT birthdt, birthdt - INTERVAL 5 MONTH FROM people;
SELECT birthdt, birthdt + INTERVAL 15 MONTH + INTERVAL 10 HOUR FROM people;

# time stamp

# They both store datetime information, but there's a difference in the range, 
# TIMESTAMP has a smaller range. TIMESTAMP also takes up less space. 
# TIMESTAMP is used for things like meta-data about when something is created
# or updated.

CREATE TABLE comments (
    content VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO comments (content) VALUES('lol what a funny article');
INSERT INTO comments (content) VALUES('I found this offensive');

SELECT * FROM comments ORDER BY created_at DESC;
 
CREATE TABLE comments2 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP   # if changed,updated the current time
);
 
INSERT INTO comments2 (content) VALUES('dasdasdasd');
INSERT INTO comments2 (content) VALUES('lololololo');
INSERT INTO comments2 (content) VALUES('I LIKE CATS AND DOGS');
 
UPDATE comments2 SET content='THIS IS NOT GIBBERISH' WHERE content='dasdasdasd';
 
SELECT * FROM comments2 ORDER BY changed_at;

SELECT CURTIME();
SELECT CURDATE();
 
SELECT DAYOFWEEK(CURDATE());
SELECT DAYOFWEEK(NOW());
SELECT DATE_FORMAT(NOW(), '%w') + 1;
 
SELECT DAYNAME(NOW());
SELECT DATE_FORMAT(NOW(), '%W');

SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y');
SELECT DATE_FORMAT(NOW(), '%M %D at %h:%i');

# an example for between function

SELECT 
    name, 
    birthdt 
FROM people
WHERE 
    birthdt BETWEEN CAST('1980-01-01' AS DATETIME)
    AND CAST('2000-01-01' AS DATETIME);
	
	# CAST (expression AS data_type) It helps to transfer data type
