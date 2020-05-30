
# select unique ones
SELECT DISTINCT author_lname FROM books;	   
			
# order function;

SELECT author_lname FROM books ORDER BY author_lname;
SELECT author_lname FROM books ORDER BY author_lname DESC;
SELECT released_year FROM books ORDER BY released_year ASC;
SELECT title, released_year, pages FROM books ORDER BY released_year;

SELECT title, author_fname, author_lname 
FROM books ORDER BY 3; # = by which volumn

SELECT title, author_fname, author_lname 
FROM books ORDER BY 1 DESC;

SELECT author_fname, author_lname FROM books 
ORDER BY author_lname, author_fname;

# limit function

SELECT title FROM books LIMIT 3; # the first three rows
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 5; # the latest top-five

SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 0,5; # from the first one, exstract the following five

# like function

SELECT title, author_fname FROM books WHERE author_fname LIKE '%da%';  #some words
SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '____'; # how many digits

SELECT title FROM books WHERE title LIKE '%\%%'
SELECT title FROM books WHERE title LIKE '%\_%' # since % and _ have special meanings, so we need to add \ before each of them

# count function

SELECT COUNT(*) FROM books; # count rows
SELECT COUNT(author_fname) FROM books;
SELECT COUNT(DISTINCT author_fname) FROM books;
SELECT COUNT(DISTINCT author_lname) FROM books;

SELECT COUNT(DISTINCT author_lname, author_fname) FROM books;  # to check how many different persons here; it needs to be different for both

SELECT title FROM books WHERE title LIKE '%the%';

# group function:

SELECT title, author_lname FROM books
GROUP BY author_lname;

SELECT author_lname, COUNT(*) 
FROM books GROUP BY author_lname; # frequency of lastnames 

SELECT title, author_fname, author_lname FROM books GROUP BY author_lname;
SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname, author_fname;

# min and max function

SELECT MIN(released_year) 
FROM books;

SELECT MIN(released_year) FROM books; # the same
SELECT MAX(pages), title
FROM books;

select * from books 
where pages = (select min(pages) from books)；

select * from books
order by pages asc limit 1;  # the same function for last one

select author_fname, author_lname, min(released_year)   # notice there is no space between min and ()
from books
group by author_lname, author_fname;   # it means the most early work for each author

# sum functions

select sum(pages) from books;
select author_fname, author_lname, sum(pages) 
from books
group by author_lname, author_fname;

# average function

select avg(released_year)
from books;

select released_year, avg(stock_quantity) from books   # notice it is not ave, it's avg
group by released_year;









