CREATE TABLE zips (
	zip_code VARCHAR(10) NOT NULL,
    city VARCHAR(20) NOT NULL,
    province VARCHAR(20) NOT NULL,
    country VARCHAR(20) NOT NULL);
    
-- Primary Key
ALTER TABLE zips
	ADD CONSTRAINT zips_zip_code_pk
		PRIMARY KEY (zip_code);