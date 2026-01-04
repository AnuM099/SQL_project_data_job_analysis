select 
    skills,
    count(skills_job_dim.skill_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id 
where 
    job_title_Short='Data Analyst'
    AND job_work_from_home =  TRUE
Group BY
    skills
order by 
   demand_count DESC
   LIMIT 5