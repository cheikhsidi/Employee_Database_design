# Project Summary

In this project, i have been provided six CSV files about employees to design a relational database and perform some analytics.

I designed the table's schema to hold data in the CSVs, import the CSVs into a SQL database, and answer questions about the data. 
i performed the following:


- Data Modeling
Inspected the CSVs and sketch out an ERD of the tables. used http://www.quickdatabasediagrams.com.

- Data Engineering
Use the information you have to create a table schema for each of the six CSV files. Remember to specify data types, primary keys, foreign keys, and other constraints.

Imported each CSV file into the corresponding SQL table.

- Data Analysis

	- List the following details of each employee: employee number, last name, first name, gender, and salary.

	- List employees who were hired in 1986.

	- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

	- List the department of each employee with the following information: employee number, last name, first name, and department name.

	- List all employees whose first name is "Hercules" and last names begin with "B."

	- List all employees in the Sales department, including their employee number, last name, first name, and department name.

	- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

	- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

	- generating a visualization of the data using python libraries (Pandas, Matplotlib) and SQLAlchemy tp connect and quary from my databse :

		- Import the SQL database into Pandas
		- Create a histogram to visualize the most common salary ranges for employees.
		- Create a bar chart of average salary by title.