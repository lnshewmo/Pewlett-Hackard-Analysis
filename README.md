# Pewlett-Hackard-Analysis

## Overview

The HR department at Pewlett-Hackard is anticipating a 'silver tsunami' where a large volume of employees become eligible for retirement at the same time.  An initiative has been proposed to soften the exodus and resulting loss of historical knowledge by retaining certain retirement-eligible employees on a part-time basis to mentor new hires.  Until now, the employee data has been managed using Microsoft Excel.  As a part of the upgrade, the HR department would like to migrate the data to a PostgreSQL database and use pgAdmin to script queries.  Quick DBD was used to create an entity relational diagram (ERD) to visually demonstrate the relationships among the data tables to aid in the data migration.

### Objective
Six `.csv` files were imported into the database.  SQL queries were scripted to evaluate the full scope of the tsunami, which job titles will be impacted the most, and identify individuals based on specific criteria who could be retained as mentors.  The new tables were exported as `.csv` files for distribution to HR.

## Resources

- Data Sources: [here](https://github.com/lnshewmo/Pewlett-Hackard-Analysis/tree/main/Pewlett-Hackard-Challenge/data)
- Quick DBD: [here](https://www.quickdatabasediagrams.com/)
- PostgreSQL14.4 and pgAdmin4
- SQL Queries: [Employee_Database_challenge.sql](https://github.com/lnshewmo/Pewlett-Hackard-Analysis/blob/main/Pewlett-Hackard-Challenge/queries/Employee_Database_challenge.sql)

## Results

### Entity Relational Diagram
To aid in design of the database, the following diagram was created for mapping of the logical and physical relationships:

<img src="https://github.com/lnshewmo/Pewlett-Hackard-Analysis/blob/main/Pewlett-Hackard-Challenge/ERD.png" width="450" height="500"/>

### HR Report

<img src="https://github.com/lnshewmo/Pewlett-Hackard-Analysis/blob/main/Pewlett-Hackard-Challenge/elephant.png" width="20" height="20"/>  According to the HR criteria, a total of 72,485 employees have been identified as nearing retirement.  The data is available here: [unique_titles.csv](https://github.com/lnshewmo/Pewlett-Hackard-Analysis/blob/main/Pewlett-Hackard-Challenge/data/unique_titles.csv).


<img src="https://github.com/lnshewmo/Pewlett-Hackard-Analysis/blob/main/Pewlett-Hackard-Challenge/elephant.png" width="20" height="20"/>  Of those, the majority (70%) are either Senior Engineers or Senior Staff which may represent critical company operations.  The data is available here: [retiring_titles.csv](https://github.com/lnshewmo/Pewlett-Hackard-Analysis/blob/main/Pewlett-Hackard-Challenge/data/retiring_titles.csv)

<img src="https://github.com/lnshewmo/Pewlett-Hackard-Analysis/blob/main/Pewlett-Hackard-Challenge/data/retiring_titles.png" width=20% height=20%>


<img src="https://github.com/lnshewmo/Pewlett-Hackard-Analysis/blob/main/Pewlett-Hackard-Challenge/elephant.png" width="20" height="20"/>  Of the remaining prospective retirees, only 2 are Managers.  


<img src="https://github.com/lnshewmo/Pewlett-Hackard-Analysis/blob/main/Pewlett-Hackard-Challenge/elephant.png" width="20" height="20"/>  1549 employees have been identified as prospective mentors.  These individuals are between 56-57 years old and may be considering retirement within the next ~5 years.  The data is available here: [mentorship_eligibility.csv](https://github.com/lnshewmo/Pewlett-Hackard-Analysis/blob/main/Pewlett-Hackard-Challenge/data/mentorship_eligibility.csv) 

## Summary

Migration of the data to a relational database allows users to easily build reports which help inform key decisions for the company.  For example:

***How many roles will need to be filled as the "silver tsunami" begins to make an impact?***  

  72,485

***Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?***  

  If the company is looking to refill the ~70,000 positions and assign mentors, the available mentor pool of 1549 people would be a ratio of approximately 1 mentor to 45 mentees.  This may or may not be feasible depending on the context of job responsibilites, amount of time required and available for training, etc.  
  
## Dashboard  

A connection was made from Tableau to the postgreSQL database to create a dashboard for visualization of the results.  The dashboard can be filtered on Department and shows the impact of the retirement projections by role as well as the number of current employees which meet the 'mentor' criteria within the same department. 

<img src="https://github.com/lnshewmo/Pewlett-Hackard-Analysis/blob/main/dashboard.png" width="850" height="500"/>




### Additional queries
The following may be useful to implement the mentoring program and can be pulled from the current data with additional queries:
  - Employee id, First and Last Name, (Current) Title and Department of (current) employees who have been with the company for less than ~2 years.  These employees may be candidates for internal mentoring.
  - A similar table containing the same information on employees who have been with the company for more ~ 5 years. These employees may be a secondary resource for additional mentors.
