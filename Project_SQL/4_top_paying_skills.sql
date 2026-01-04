select 
    skills,
    round(Avg(salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id 
where 
    job_title_Short='Data Analyst'
    AND  salary_year_avg is not null 
    AND  job_work_from_home =  TRUE
Group BY
    skills
order by 
     avg_salary desc
LIMIT 25
/*
Top-paying Data Analyst roles favor big-data and cloud-based skills (PySpark, Databricks, GCP, Airflow), indicating strong demand for analysts who can work with large-scale and modern data platforms.

Engineering and DevOps tools are strongly associated with higher salaries (GitLab, Bitbucket, Jenkins, Linux, Kubernetes), showing that well-paid analyst roles operate close to production and engineering workflows.

Advanced Python and machine-learning ecosystems drive salary premiums (Pandas, NumPy, Scikit-learn, Jupyter), while traditional tools like Excel are baseline expectations rather than pay drivers.

Results: 
[
 {
  "skills": "pyspark",
  "avg_salary": "208172"
 },
 {
  "skills": "bitbucket",
  "avg_salary": "189155"
 },
 {
  "skills": "couchbase",
  "avg_salary": "160515"
 },
 {
  "skills": "watson",
  "avg_salary": "160515"
 },
 {
  "skills": "datarobot",
  "avg_salary": "155486"
 },
 {
  "skills": "gitlab",
  "avg_salary": "154500"
 },
 {
  "skills": "swift",
  "avg_salary": "153750"
 },
 {
  "skills": "jupyter",
  "avg_salary": "152777"
 },
 {
  "skills": "pandas",
  "avg_salary": "151821"
 },
 {
  "skills": "elasticsearch",
  "avg_salary": "145000"
 },
 {
  "skills": "golang",
  "avg_salary": "145000"
 },
 {
  "skills": "numpy",
  "avg_salary": "143513"
 },
 {
  "skills": "databricks",
  "avg_salary": "141907"
 },
 {
  "skills": "linux",
  "avg_salary": "136508"
 },
 {
  "skills": "kubernetes",
  "avg_salary": "132500"
 },
 {
  "skills": "atlassian",
  "avg_salary": "131162"
 },
 {
  "skills": "twilio",
  "avg_salary": "127000"
 },
 {
  "skills": "airflow",
  "avg_salary": "126103"
 },
 {
  "skills": "scikit-learn",
  "avg_salary": "125781"
 },
 {
  "skills": "jenkins",
  "avg_salary": "125436"
 },
 {
  "skills": "notion",
  "avg_salary": "125000"
 },
 {
  "skills": "scala",
  "avg_salary": "124903"
 },
 {
  "skills": "postgresql",
  "avg_salary": "123879"
 },
 {
  "skills": "gcp",
  "avg_salary": "122500"
 },
 {
  "skills": "microstrategy",
  "avg_salary": "121619"
 }
]
*/