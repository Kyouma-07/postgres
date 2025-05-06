--string concatination in postgres..
SELECT CONCAT('Hello', ' ', 'World!') AS greeting;

--USING THE || OPERATOR FOR STRING CONCATENATION
SELECT 'Hello' || ' ' || 'World!' AS greeting;

--CAN BE USED WITH SELECT STATEMENTS
--AS WORKS as an alias for the result of the concatenation
SELECT CONCAT(name, ' ', email) AS full_info FROM users;

--CONCAT WITH NULL VALUES
SELECT CONCAT('Hello', NULL, 'World!') AS greeting; -- Result: 'HelloWorld!'
SELECT 'Hello' || NULL || 'World!' AS greeting; -- Result: 'HelloWorld!'

--CONCAT_WS FUNCTION-- CONCAT WITH SEPARATORS
--Allows you to specify a separator between the concatenated strings.
SELECT CONCAT_WS(', ', 'Hello', 'World', 'Postgres') AS greeting; -- Result: 'Hello, World, Postgres'
SELECT CONCAT_WS(' - ', name, email) AS full_info FROM users; -- Result: 'name - email'

--STRING_AGG FUNCTION-- AGGREGATE STRING CONCATENATION
--Used to concatenate values from multiple rows into a single string with a specified separator.

SELECT STRING_AGG(name, ', ') AS all_names FROM users; -- Result: 'name1, name2, name3, ...'
SELECT STRING_AGG(name, ', ') AS all_names FROM users WHERE id > 5; -- Result: 'name6, name7, ...'

--STRING_AGG WITH ORDERING
--You can specify an order for the concatenated values.
SELECT STRING_AGG(name, ', ' ORDER BY id) AS ordered_names FROM users; 

--STRING_AGG WITH FILTER
--You can filter the values to be concatenated using a WHERE clause.    
SELECT STRING_AGG(name, ', ') AS filtered_names FROM users WHERE id > 5; -- Result: 'name6, name7, ...'
SELECT STRING_AGG(name, ', ' ORDER BY id) AS ordered_names FROM users WHERE id > 5; -- Result: 'name6, name7, ...'

--STRING_AGG WITH GROUP BY
--You can use STRING_AGG with GROUP BY to concatenate values for each group.
SELECT user_id, STRING_AGG(name, ', ') AS user_names FROM orders GROUP BY user_id; -- Result: 'user_id - name1, name2, ...'
SELECT user_id, STRING_AGG(name, ', ' ORDER BY id) AS ordered_user_names FROM orders GROUP BY user_id; -- Result: 'user_id - name1, name2, ...


--STRING_AGG WITH HAVING CLAUSE
--You can use STRING_AGG with a HAVING clause to filter groups based on the aggregated result.
SELECT user_id, STRING_AGG(name, ', ') AS user_names FROM orders GROUP BY user_id HAVING COUNT(*) > 1; -- Result: 'user_id - name1, name2, ...'
SELECT user_id, STRING_AGG(name, ', ' ORDER BY id) AS ordered_user_names FROM orders GROUP BY user_id HAVING COUNT(*) > 1; -- Result: 'user_id - name1, name2, ...'

--STRING_AGG WITH DISTINCT VALUES
--You can use STRING_AGG with DISTINCT to concatenate unique values.
SELECT user_id, STRING_AGG(DISTINCT name, ', ') AS unique_user_names FROM orders GROUP BY user_id; -- Result: 'user_id - name1, name2, ...'
SELECT user_id, STRING_AGG(DISTINCT name, ', ' ORDER BY id) AS unique_ordered_user_names FROM orders GROUP BY user_id; -- Result: 'user_id - name1, name2, ...'


--SUBSTRING FUNCTION-- EXTRACTING SUBSTRINGS
--Used to extract a substring from a string based on specified starting position and length.

select substring ('Hello, World!', 1, 5) AS substring; -- Result: 'Hello'
SELECT SUBSTRING(name FROM 1 FOR 5) AS substring FROM users; -- Result: 'name1', 'name2', ...
SELECT SUBSTRING(name FROM 1 FOR 5) AS substring FROM users WHERE id > 5; -- Result: 'name6', 'name7', ...
SELECT SUBSTRING(name FROM 1 FOR 5) AS substring FROM users WHERE id > 5 ORDER BY id; -- Result: 'name6', 'name7', ...
SELECT SUBSTRING(name FROM 1 FOR 5) AS substring FROM users WHERE id > 5 ORDER BY id DESC; -- Result: 'name6', 'name7', ...

--SUBSTRING ("GIVEN STRING" , "STARTING POSITION", "LENGTH")
SELECT SUBSTRING('Hello, World!' FROM 1 FOR 5) AS substring; -- Result: 'Hello'
--SUBSTRING ("GIVEN STRING" , "STARTING POSITION", "ENDING POSITION")
SELECT SUBSTRING('Hello, World!' FROM 1 FOR 12) AS substring; -- Result: 'Hello, World!'    

--DOES NOT WORK BECAUSE POSTGRES DOES NOT SUPPORT -VE INDEXING. WILL WORK ON MYSQL'
SELECT SUBSTRING('Hello, World!',-3 , 1) AS substring;


--REPLACE FUNCTION-- REPLACING SUBSTRINGS
--Used to replace all occurrences of a substring within a string with another substring.
--REPLACE ("GIVEN STRING" , "SUBSTRING TO REPLACE" , "REPLACEMENT SUBSTRING")
--REPLACE IS CASE SENSITIVE.
SELECT REPLACE('Hello, World!', 'World', 'Postgres') AS replaced_string;
SELECT REPLACE(name, 'John', 'Jane') AS replaced_name FROM users; -- Result: 'Jane Doe', 'Jane Smith', ...
SELECT REPLACE(name, 'John', 'Jane') AS replaced_name FROM users WHERE id > 5; -- Result: 'Jane Doe', 'Jane Smith', ...


--REVERSE FUNCTION-- REVERSE A STRING
--Used to reverse the order of characters in a string.
--SELECT REVERSE(STR) AS reversed_string;
SELECT REVERSE('Hello, World!') AS reversed_string; -- Result: '!dlroW ,olleH'
SELECT REVERSE(NULL) AS reversed_string; -- Result: NULL

--CHAR_LENGTH FUNCTION-- LENGTH OF A STRING
--Used to get the length of a string in characters.
--SELECT CHAR_LENGTH(STR) AS length_of_string;
SELECT CHAR_LENGTH('Hello, World!') AS length_of_string;


--LENGTH FUNCTION-- LENGTH OF A STRING
--Used to get the length of a string in bytes.
--SELECT LENGTH(STR) AS length_of_string;
SELECT LENGTH('Hello, World!') AS length_of_string; 


--UPPER FUNCTION-- CONVERT TO UPPERCASE
--Used to convert a string to uppercase.    
--SELECT UPPER(STR) AS uppercase_string;
SELECT UPPER('Hello, World!') AS uppercase_string;


--LOWER FUNCTION-- CONVERT TO LOWERCASE
--Used to convert a string to lowercase.    
--SELECT LOWER(STR) AS lowercase_string;
SELECT LOWER('Hello, World!') AS lowercase_string;


--POSTGRES DOES NOT SUPPORT THE INSERT FUNCTION. WILL WORK ON MYSQL
--OVERLAY FUNCTION-- INSERTING SUBSTRINGS
--Used to replace a substring at a specified position within a string.
--OVERLAY ("GIVEN STRING" PLACING "SUBSTRING TO INSERT" FROM "POSITION TO INSERT")
--OVERLAY IS CASE SENSITIVE.
SELECT OVERLAY('Hello, World!' PLACING 'Postgres' FROM 8) AS inserted_string;
 -- Result: 'Hello, PostgresWorld!'


 --LEFT FUNCTION-- EXTRACTING LEFT PART OF A STRING
--Used to extract a specified number of characters from the left side of a string.
--SELECT LEFT(STR, N) AS left_part_of_string;
SELECT LEFT('Hello, World!', 5) AS left_part_of_string;


--RIGHT FUNCTION-- EXTRACTING RIGHT PART OF A STRING
--Used to extract a specified number of characters from the right side of a string. 
--SELECT RIGHT(STR, N) AS right_part_of_string;
SELECT RIGHT('Hello, World!', 6) AS right_part_of_string; 

--REPEAT FUNCTION-- REPEATING A STRING
--Used to repeat a string a specified number of times.          
--SELECT REPEAT(STR, N) AS repeated_string;
SELECT REPEAT('Hello', 3) AS repeated_string;


--TRIM FUNCTION-- REMOVING WHITESPACE
--Used to remove leading and trailing whitespace from a string.
--SELECT TRIM(STR) AS trimmed_string;
--CAN ALSO BE USED TO REMOVE SPECIFIC CHARACTERS FROM A STRING.
--SELECT TRIM(LEADING/TRAILING/BOTH FROM STR) AS trimmed_string;
SELECT TRIM('   Hello, World!   ') AS trimmed_string;
SELECT TRIM(LEADING 'H' FROM 'Hello, World!') AS trimmed_string; 
SELECT TRIM(TRAILING '!' FROM 'Hello, World!') AS trimmed_string; 
SELECT TRIM(BOTH 'H' FROM 'Hello, World!') AS trimmed_string;