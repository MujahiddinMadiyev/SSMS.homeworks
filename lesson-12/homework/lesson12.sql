--create database [sql homework class 12]

--Easy questions (20)

--1. What is the result of Ascii('A') in SQL?
select ASCII('A') --it returns 65
--2. Write a SQL query to get the length of the string 'Hello World' using Len().
select len('hello world')
--3. How do you reverse a string 'OpenAI' using SQL?
select REVERSE('openai')
--4. What function would you use to add 5 spaces before a string in SQL?
select space(5)
--5. How can you remove leading spaces from the string ' SQL Server'?
select LTRIM(' SQL Server')
--6. Write a query that converts the string 'sql' to uppercase.
select upper('sql')
--7. What function would you use to extract the first 3 characters of the string 'Database'?
select LEFT('Database', 3)
--8. How can you get the last 4 characters from the string 'Technology'?
select right('Technology', 4)
--9. Use Substring() to get characters from position 3 to position 6 in the string 'Programming'.
select SUBSTRING('Programming', 3, 4)
--10. Write a query to concatenate the strings 'SQL' and 'Server' using Concat().
select concat('SQL','Server')
--11. How can you replace all occurrences of 'apple' with 'orange' in the string 'apple pie'?
select REPLACE('apple pie', 'apple', 'orange')
--12. Write a query to find the position of the first occurrence of the word 'learn' in the string 'Learn SQL with LearnSQL'.
select CHARINDEX('learn', 'Learn SQL with LearnSQL')
--13. What function can you use to check if the string 'Server' contains 'er' using SQL?
select Patindex('%er%', 'Server')
--14. How can you split the string 'apple,orange,banana' into individual words using String_split()?
select value from string_split('apple,orange,banana', ',')
--15. What is the result of the expression Power(2, 3)?
select power(2,3) --it returns 8
--16. Write a query that calculates the square root of 16 using SQL.
select SQRT(16)
--17. How do you get the current date and time in SQL?
select GETDATE()
--18. What SQL function would you use to get the current UTC date and time?
select GETUTCDATE()
--19. How can you get the day of the month from the date '2025-02-03'?
select DATENAME(day, '2025-02-03')
--20. Write a query to add 10 days to the date '2025-02-03' using Dateadd().
select DATEADD(day, 10, '2025-02-03')


--Medium questions (20)

--1. Use Char() to convert the ASCII value 65 to a character.
select CHAR(65)
--2. What is the difference between Ltrim() and Rtrim() in SQL?
--Ltrim removes unnecessary spaces from left in string, Rtrim does this from right.
--3. Write a query to find the position of the substring 'SQL' in the string 'Learn SQL basics'.
select CHARINDEX('SQL', 'Learn SQL basics')
--4. Use Concat_ws() to join 'SQL' and 'Server' with a comma between them.
select Concat_ws(',', 'SQL', 'Server')
--5. How would you replace the substring 'test' with 'exam' using Stuff()?
select STUFF('this test used', 6, 4, 'exam')
--6. Write a SQL query to get the square of 7 using Square().
select SQUARE(7)
--7. How do you get the first 5 characters from the string 'International'?
select LEFT('International', 5)
--8. Write a query to get the last 2 characters of the string 'Database'.
select RIGHT('Database', 2)
--9.. What is the result of Patindex('%n%', 'Learn SQL')?
select Patindex('%n%', 'Learn SQL') --the result is 5
--10. How do you calculate the difference in days between '2025-01-01' and '2025-02-03' using Datediff()?
select DATEDIFF(day, '2025-01-01', '2025-02-03')
--11. Write a query to return the month from the date '2025-02-03' using Month().
select MONTH('2025-02-03')
--12. Use DatePart() to extract the year from the date '2025-02-03'.
select DATEPART(year, '2025-02-03')
--13. How can you get the current system time without the date part in SQL?
select convert(time, SYSDATETIME())
--14. What does the function Sysdatetime() return in SQL?
select SYSDATETIME() --it returns pc's current system date time.
--15. How would you find the next occurrence of 'Wednesday' from today's date using Dateadd()?
select dateadd(week, 1, '2025-02-26')
--16. What is the difference between Getdate() and Getutcdate()?
-- Getdate returns time of my current location. Getutcdate returns standard utc date.
--17. Use Abs() to get the absolute value of -15 in SQL.
select abs(-15)
--18. How would you round the number 4.57 to the nearest whole number using Ceiling()?
select CEILING(4.57)
--19. Write a SQL query to get the current time using Current_Timestamp.
select CURRENT_TIMESTAMP
--20. Use DateName() to return the day name for the date '2025-02-03'.
select datename(WEEKDAY, '2025-02-03')


--Difficul questions (20)

--1. Write a query to reverse the string 'SQL Server' and then remove the spaces.
select trim(reverse('SQL Server'))
--2. Write a query that uses String_agg() to concatenate all the values in the 'City' column of a table into a single string, separated by commas.
select STRING_AGG(city, ',') from table
--3. Write a SQL query that checks if a string contains both 'SQL' and 'Server' using Charindex().
select CHARINDEX('sql server', 'sql server')
--4. How would you use Power() to calculate the cube of 5?
select power(5, 3)
--5. Write a query that splits a string 'apple;orange;banana' by the semicolon and returns each word as a separate row.
select value from string_split('apple;orange;banana', ';')
--6. Use Trim() to remove both leading and trailing spaces from the string ' SQL '.
select trim(' SQL ')
--7. Write a SQL query to calculate the difference in hours between two timestamps using Datediff().
select DATEDIFF(hour, (select GETDATE()), (select getutcdate()))
--8. How would you calculate the number of months between '2023-05-01' and '2025-02-03' using Datepart()?
select DATEdiff(month, '2023-05-01', '2025-02-03')
--9. Write a query to find the position of the substring 'SQL' from the end of the string 'Learn SQL Server' using Reverse() and Charindex().
select charindex(reverse('SQL'), reverse('Learn SQL Server'))
--10. Use String_split() to split a comma-separated string 'apple,orange,banana' and return each word in a separate row.
select value from string_split('apple,orange,banana', ',')
--11. How would you find the number of days from '2025-01-01' to the current date using Datediff()?
select DATEDIFF(day, '2025-01-01', getdate())
--12. Write a SQL query that returns the first 4 characters of the string 'Data Science' using Left().
select left('Data Science', 4)
--13. How can you calculate the square root of 225 and round it to the nearest whole number using Sqrt() and Ceiling()?
select ceiling(SQRT(225))
--14. Write a query that concatenates two strings with a pipe ('|') separator using Concat_ws().
select CONCAT_WS('|', 'SQL', 'Server')
--15. Use Patindex() to find the position of the first occurrence of any digit in the string 'abc123xyz'.
select PATINDEX('%[0-9]%', 'abc123xyz')
--16. How would you find the second occurrence of the substring 'SQL' in the string 'SQL Server SQL' using Charindex()?
select CHARINDEX('SQL', 'SQL Server SQL', (select CHARINDEX('SQL', 'SQL Server SQL')+1)) 
--17. Write a SQL query to get the year from the current date using DatePart().
select datepart(year, getdate())
--18. How do you subtract 100 days from the current date using Dateadd()?
select DATEADD(day, -100, getdate())
--19. Use DateName() to extract the day of the week from the date '2025-02-03'.
select DATENAME(weekday, '2025-02-03')
--20. Write a query to get the square of a number using the Power() function and return it in the result set.
select power(2, 2)
