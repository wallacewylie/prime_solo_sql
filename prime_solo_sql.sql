-- Which authors are represented in our store?
SELECT * FROM authors;

-- Which authors are also distinguished authors?
SELECT * FROM distinguished_authors;

-- Which authors are not distinguished authors?
SELECT first_name, last_name FROM authors EXCEPT SELECT first_name, last_name FROM distinguished_authors;

-- How many authors are represented in our store?
SELECT COUNT (*) FROM authors;

-- Who are the favorite authors of the employee with the first name of Michael?
SELECT * FROM favorite_authors WHERE employee_id = (SELECT ID FROM employees WHERE first_name = 'Michael');

-- What are the titles of all the books that are in stock today?
SELECT books.title, stock.stock FROM books JOIN editions ON editions.book_id = books.id
JOIN stock ON stock.isbn = editions.isbn WHERE stock.stock > 0;

--Insert one of your favorite books into the database. Hint: You’ll want to create data in at least 2 other tables to completely create this book.
INSERT INTO books (title)
VALUES ('Ulysses');
INSERT INTO authors (last_name, first_name)
VALUES ('Joyce', 'James');

-- What authors have books that are not in stock?
SELECT authors.last_name, authors.first_name FROM authors JOIN books ON books.author_id = authors.id JOIN editions ON editions.book_id = books.id JOIN 
stock ON stock.isbn = editions.isbn WHERE stock.stock = 0;

-- What is the title of the book that has the most stock?
SELECT books.title FROM books JOIN editions ON editions.book_id = books.id
JOIN stock ON stock.isbn = editions.isbn ORDER BY stock desc LIMIT 1;

