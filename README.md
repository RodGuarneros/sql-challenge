# sql-challenge
Data modeling and data analysis

# 1. Data Engineering 

In this first step you are going to see the process for modeling data.
We explore six data sets so as to identify relationships, based on Entity Relationship Diagram (ERD). 
The main objetive in this firts stage of our analysis is identify:

- Data types
- Primary Keys
- Foreign Keys
- Dimensions

This first step give us a physical model diagram so as to understand the relationship among every table we have

![Alt Text](https://github.com/RodGuarneros/sql-challenge/blob/main/EmployeeSQL/resources/physical_model_diagram_rodrigo.png)

# 2. Data Analysis

Once the database was completed, the second step is made also in postgresql for the next steps: 

1.List the following details of each employee: employee number, last name, first name, gender, and salary.

2.List employees who were hired in 1986.

3.List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

4.List the department of each employee with the following information: employee number, last name, first name, and department name.

5.List all employees whose first name is "Hercules" and last names begin with "B."

6.List all employees in the Sales department, including their employee number, last name, first name, and department name.

7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

# Data Analysis 
## Testing the data base

As you examine the data, we are overcome with a creeping suspicion that the dataset is fake. You surmise that your boss handed you spurious data in order to test the data engineering skills of a new employee. To confirm your hunch, we take the following steps to generate a visualization of the data:

The most relevant results were:

## Distribution of salaries

![Alt Text](https://github.com/RodGuarneros/sql-challenge/blob/main/EmployeeSQL/resources/salary_ranges.png)

## Average salary per title

![Alt Text](https://github.com/RodGuarneros/sql-challenge/blob/main/EmployeeSQL/resources/average_salary.png)

