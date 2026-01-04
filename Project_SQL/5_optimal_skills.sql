/*what are the most optimal skills to learn.Skills that are high in demand and high paying salary*/
select 
    skills_dim.skills,
    skills_job_dim.skill_id,
    count(skills_job_dim.skill_id) AS demand_count,
    round(Avg(job_postings_fact.salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id 
where 
    job_title_Short='Data Analyst'
    AND  salary_year_avg is not null 
    AND job_postings_fact.job_work_from_home=true
Group BY
    skills_job_dim.skill_id, skills_dim.skills
HAVING
    count(skills_job_dim.skill_id) >10
order by 
    avg_salary desc, demand_count desc
LIMIT 25
