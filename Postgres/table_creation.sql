CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



-- This SQL script creates a PostgreSQL database with two tables: users and orders.
CREATE TABLE IF NOT EXISTS orders (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

--sql script to create a table named "cats" with columns for id, name, breed, and age
create table cats(
    id serial PRIMARY KEY,
    name varchar(100) NOT NULL,
    breed varchar(100) NOT NULL,
    age int NOT NULL
);


---SQL SCRIPT TO INSERT DATA INTO THE user TABLE
INSERT INTO users (name , email) 
VALUES   ('Kashyy' , '123@sql.com'),
         ('Pinky beans' , '1234@sql.com'),
         ('Kyouma the GOAT' , '12345@sql.com'),
         ('name 1' , ' email1'),
         ('name 2' , ' email2'),
         ('name 3' , ' email3'),
         ('name 4' , ' email4'),
         ('name 5' , ' email5'),
         ('name 6' , ' email6'),
         ('name 7' , ' email7'),
         ('name 8' , ' email8'),
         ('name 9' , ' email9'),
         ('name 10' , ' email10');

SELECT * FROM users;

--update command in postgres with example...
UPDATE users SET name = 'Mittens' WHERE id = 4;
UPDATE users SET name = 'Kittens', email =  'kittens@sql.com' WHERE id = 5;


--sql script to delete a row from the users table with id = 6
DELETE FROM users WHERE id =6;


