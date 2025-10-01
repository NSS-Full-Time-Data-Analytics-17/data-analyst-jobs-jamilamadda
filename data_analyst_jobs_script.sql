--1.	How many rows are in the data_analyst_jobs table?
SELECT COUNT (*)
FROM data_analyst_jobs;
--ans 1793


--2.look at just the first 10 rows.What company is associated with the job posting on the 10th row?
SELECT *
FROM data_analyst_jobs;
LIMIT 10;
--ans ExxonMobil


--3.How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
SELECT COUNT(location)
FROM data_analyst_jobs
WHERE location = 'TN';
--ans 21


SELECT COUNT(location)
FROM data_analyst_jobs
WHERE location IN ('TN','KY'); 
--ans 27


--4.How many postings in Tennessee have a star rating above 4?
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location = 'TN' AND star_rating > 4;
--ans 3


--5.How many postings in the dataset have a review count between 500 and 1000?
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;
--ans 151


--6.Show the average star rating for companies in each state as`state`, `avg_rating`. Which state shows the highest average rating?
SELECT location AS state, ROUND(AVG(star_rating),2) AS avg_rating
FROM data_analyst_jobs
WHERE star_rating IS NOT NULL
GROUP BY location
ORDER BY AVG(star_rating) DESC;
--ans NE 4.20


--7.Select unique job titles from the data_analyst_jobs table. 
SELECT DISTINCT title, COUNT(title) AS job_counts
FROM data_analyst_jobs
GROUP BY title
ORDER by COUNT(title) DESC;


--How many are there?
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs;
--ans 881


--8.How many unique job titles are there for California companies?
SELECT DISTINCT title, COUNT(title) AS job_counts
FROM data_analyst_jobs
WHERE location = 'CA'
GROUP BY title
ORDER by COUNT(title) DESC; --ans 230


--9.Find company,average star rating 4 companies more than 5000 reviews.How many companies are there with more that 5000 reviews?
SELECT company,ROUND(AVG(CASE WHEN review_count > 5000 THEN star_rating  END),2) AS avg_star_rating
FROM data_analyst_jobs
GROUP BY company
HAVING AVG(CASE WHEN review_count > 5000 THEN star_rating  END) IS NOT NULL; --ans 41


--10.Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
SELECT company,ROUND(AVG(CASE WHEN review_count > 5000 THEN star_rating  END),2) AS avg_star_rating
FROM data_analyst_jobs
GROUP BY company
HAVING AVG(CASE WHEN review_count > 5000 THEN star_rating  END) IS NOT NULL
ORDER BY AVG(star_rating) DESC;
--ans 4.20


--11.Find all the job titles that contain the word ‘Analyst’. 
SELECT title
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%'; --ans 1669


--11.How many different job titles are there?
SELECT DISTINCT title
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';
--ans 774


--12.How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?
SELECT DISTINCT title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' AND title NOT ILIKE '%Analytics%';
--ans 4, Tableau


--13.Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks.
SELECT domain AS hard_to_fill_jobs, COUNT (title) AS count_jobs
FROM data_analyst_jobs
WHERE skill LIKE '%SQL%' AND days_since_posting > 21
GROUP BY domain
HAVING domain IS NOT NULL
ORDER BY count(title) DESC
LIMIT 4; --ans internet  62,bank 61, consulting 57, health care 52

















