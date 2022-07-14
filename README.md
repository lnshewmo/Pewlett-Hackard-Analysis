# Pewlett-Hackard-Analysis

## Overview

The HR department at Pewlett-Hackard is anticipating a 'silver tsunami' where a large volume of employees become eligible for retirement at the same time.  An initiative is being proposed to soften the exodus and resulting loss of historical knowledge by retaining certain retirement-eligible employees on a part-time basis to mentor new hires.  

### Objective
Queries were run on the 6 available .csv files containing employee data to evaluate the full scope of the tsunami, which departments and job titles will be impacted the most, and identify individuals who could be retained as mentors.  

## Resources

- [Data Sources](https://github.com/lnshewmo/Pewlett-Hackard-Analysis/tree/main/Pewlett-Hackard-Challenge/data)
- [Quick DBD](https://www.quickdatabasediagrams.com/)
- PostgreSQL14.4 and pgAdmin4
- Queries: [Employee_Database_challenge.sql](https://github.com/lnshewmo/Pewlett-Hackard-Analysis/blob/main/Pewlett-Hackard-Challenge/queries/Employee_Database_challenge.sql)

## Results 

- According to the HR criteria, a total of 72,485 employees have been identified as nearing retirement.  The data is available here: [unique_titles.csv](https://github.com/lnshewmo/Pewlett-Hackard-Analysis/blob/main/Pewlett-Hackard-Challenge/data/unique_titles.csv).

- Of those, the majority (70%) are either Senior Engineers or Senior Staff which may represent critical company operations.  The data is available here: [retiring_titles.csv](https://github.com/lnshewmo/Pewlett-Hackard-Analysis/blob/main/Pewlett-Hackard-Challenge/data/retiring_titles.csv)

<img src="https://github.com/lnshewmo/Pewlett-Hackard-Analysis/blob/main/Pewlett-Hackard-Challenge/data/retiring_titles.png" width=50% height=50%>

- Of the remaining prospective retirees, only 2 are Managers.  

- 1549 employees have been identified as prospective mentors.  These individuals are between 56-57 years old and may be considering retirement within the next ~5 years.  The data is available here: [mentorship_eligibility.csv](https://github.com/lnshewmo/Pewlett-Hackard-Analysis/blob/main/Pewlett-Hackard-Challenge/data/mentorship_eligibility.csv) 

## Summary

*Q1 - How many roles will need to be filled as the "silver tsunami" begins to make an impact?*  72,485

***Q2 - Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?***  If the company is looking to refill the ~70,000 positions and assign mentors, the available mentor pool of 1549 people would be a ratio of approximately 1 mentor to 45 mentees.  This may or may not be feasible depending on the context of job responsibilites, amount of time required and available for training, etc.  

### Additional queries
The following may be useful to implement the mentoring program and can be pulled from the current data with additional queries:
  - Employee id, First and Last Name, (Current) Title and Department of (current) employees who have been with the company for less than ~2 years.  These employees may be candidates for internal mentoring.
  - A similar table containing the same information on employees who have been with the company for more ~ 5 years. These employees may be a secondary resource for additional mentors.
  - Refactoring of the Mentorship Eligibility query to include Department.  This would identify mentors which can be matched with mentees within their department.
