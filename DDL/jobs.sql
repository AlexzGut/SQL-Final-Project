CREATE TABLE jobs (
	job_id NUMERIC(6,0) NOT NULL,
	job_title VARCHAR(30) NOT NULL);

-- Primary Key
ALTER TABLE jobs 
	ADD CONSTRAINT jobs_job_id_pk
		PRIMARY KEY (job_id);