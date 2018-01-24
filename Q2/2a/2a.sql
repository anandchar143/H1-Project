
-- b) find top 5 locations in the US who have got certified visa for each year.
use h1b;

SELECT worksite,COUNT(case_status) AS number_of_petition,year from h1b_applications WHERE job_title LIKE '%DATA ENGINEER%' and case_status = 'CERTIFIED' and year='2011' GROUP BY worksite,year ORDER BY number_of_petition desc limit 1;
---->
SEATTLE, WASHINGTON	19	2011

SELECT worksite,COUNT(case_status) AS number_of_petition,year from h1b_applications WHERE job_title LIKE '%DATA ENGINEER%' and case_status = 'CERTIFIED' and year='2012' GROUP BY worksite,year ORDER BY number_of_petition desc limit 1;
--->
SEATTLE, WASHINGTON	26	2012

SELECT worksite,COUNT(case_status) AS number_of_petition,year from h1b_applications WHERE job_title LIKE '%DATA ENGINEER%' and case_status = 'CERTIFIED' and  year='2013' GROUP BY worksite,year ORDER BY number_of_petition desc limit 1;
--->
SEATTLE, WASHINGTON	43	2013


SELECT worksite,COUNT(case_status) AS number_of_petition,year from h1b_applications WHERE job_title LIKE '%DATA ENGINEER%' and case_status = 'CERTIFIED' and year='2014' GROUP BY worksite,year ORDER BY number_of_petition desc limit 1;
---->
SEATTLE, WASHINGTON	42	2014


SELECT worksite,COUNT(case_status) AS number_of_petition,year from h1b_applications WHERE job_title LIKE '%DATA ENGINEER%' and case_status = 'CERTIFIED' and year='2015' GROUP BY worksite,year ORDER BY number_of_petition desc limit 1;
--->
SEATTLE, WASHINGTON	60	2015


SELECT worksite,COUNT(case_status) AS number_of_petition,year from h1b_applications WHERE job_title LIKE '%DATA ENGINEER%' and case_status = 'CERTIFIED' and year='2016' GROUP BY worksite,year ORDER BY number_of_petition desc limit 1;
---->
SEATTLE, WASHINGTON	121	2016


---------------------------------------
SEATTLE, WASHINGTON	19	2011
SEATTLE, WASHINGTON	26	2012
SEATTLE, WASHINGTON	43	2013
SEATTLE, WASHINGTON	42	2014
SEATTLE, WASHINGTON	60	2015
SEATTLE, WASHINGTON	121	2016




