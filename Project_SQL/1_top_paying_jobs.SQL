/* what are the top paying jobs?*/
select 
    job_id,
    company_dim.name AS company_name,
    job_title,
    job_location,
    job_schedule_type,
    job_work_from_home,
    salary_year_avg,
    job_posted_date
from job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
where job_title_short='Data Analyst'
    AND job_location='Anywhere'
    AND salary_year_avg is NOT NULL
order by 
    salary_year_avg DESC
LIMIT 10


