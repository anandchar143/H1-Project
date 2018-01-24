
--8) Find the average Prevailing Wage for each Job for each Year (take part time and full time separate). Arrange the output in descending order.
select job_title,case_status,full_time_position,year,avg(prevailing_wage) as average from h1b_applications where full_time_position = 'Y' and year = '2011' and case_status in ('CERTIFIED','CERTIFIED-WITHDRAWN') group by job_title,case_status,full_time_position,year order by average desc;
---->
LECTURER IN PHYSICS	CERTIFIED	Y	2011	15080.0
SPECIAL CLASS ASSISTANT	CERTIFIED	Y	2011	15070.0
Time taken: 177.5 seconds, Fetched: 62139 row(s)

select job_title,case_status,full_time_position,year,avg(prevailing_wage) as average from h1b_applications where full_time_position = 'N' and year = '2011' and case_status in ('CERTIFIED','CERTIFIED-WITHDRAWN') group by job_title,case_status,full_time_position,year order by average desc;
----->
GRADUATE ASSISTANT	CERTIFIED	N	2011	15246.4
EXHIBITS AND EVENTS ASSISTANTS	CERTIFIED-WITHDRAWN	N	2011	15100.8
Time taken: 126.814 seconds, Fetched: 3989 row(s)
--------------------------------------------------------------------------------------------------------------------------------------
select job_title,case_status,full_time_position,year,avg(prevailing_wage) as average from h1b_applications where full_time_position = 'Y' and year = '2012' and case_status in ('CERTIFIED','CERTIFIED-WITHDRAWN') group by job_title,case_status,full_time_position,year order by average desc;
---->
SCHOOL CAFETERIA ASSISTANT COOK	CERTIFIED	Y	2012	10504.0
BUILDING MAINTENANCE REPAIRER	CERTIFIED	Y	2012	10504.0
Time taken: 148.844 seconds, Fetched: 68778 row(s)

select job_title,case_status,full_time_position,year,avg(prevailing_wage) as average from h1b_applications where full_time_position = 'N' and year = '2012' and case_status in ('CERTIFIED','CERTIFIED-WITHDRAWN') group by job_title,case_status,full_time_position,year order by average desc;
----->
VETERINARIAN INTERN	CERTIFIED	N	2012	16619.2
ASSISTANT TENNIS PROFESSIONAL	CERTIFIED	N	2012	16057.6
Time taken: 121.936 seconds, Fetched: 4114 row(s)

--------------------------------------------------------------------------------------------------------------------------------------
select job_title,case_status,full_time_position,year,avg(prevailing_wage) as average from h1b_applications where full_time_position = 'Y' and year = '2013' and case_status in ('CERTIFIED','CERTIFIED-WITHDRAWN') group by job_title,case_status,full_time_position,year order by average desc;
---->
SCHOOL CAFETERIA ASSISTANT COOK	CERTIFIED-WITHDRAWN	Y	2013	10504.0
BUILDING MAINTENANCE REPAIRER	CERTIFIED-WITHDRAWN	Y	2013	10504.0
Time taken: 220.447 seconds, Fetched: 69974 row(s)

select job_title,case_status,full_time_position,year,avg(prevailing_wage) as average from h1b_applications where full_time_position = 'N' and year = '2013' and case_status in ('CERTIFIED','CERTIFIED-WITHDRAWN') group by job_title,case_status,full_time_position,year order by average desc;
---->
ASSISTANT WOMENS SOCCER COACH	CERTIFIED	N	2013	15080.0
BILINGUAL SPECIAL EDUCATION TEACHER ASSISTANT	CERTIFIED	N	2013	15080.0
Time taken: 125.144 seconds, Fetched: 3736 row(s)
--------------------------------------------------------------------------------------------------------------------------------------
select job_title,case_status,full_time_position,year,avg(prevailing_wage) as average from h1b_applications where full_time_position = 'Y' and year = '2014' and case_status in ('CERTIFIED','CERTIFIED-WITHDRAWN') group by job_title,case_status,full_time_position,year order by average desc;
---->
ENGINEERING TRAINEE	CERTIFIED	Y	2014	15080.0
ARCHITECTS	CERTIFIED	Y	2014	14580.8
Time taken: 170.016 seconds, Fetched: 78000 row(s)


select job_title,case_status,full_time_position,year,avg(prevailing_wage) as average from h1b_applications where full_time_position = 'N' and year = '2014' and case_status in ('CERTIFIED','CERTIFIED-WITHDRAWN') group by job_title,case_status,full_time_position,year order by average desc;
----->
LIGHTING DESIGNER	CERTIFIED	N	2014	16640.0
BILINGUAL SPECIAL EDUCATIN TEACHER ASSISTANT	CERTIFIED	N	2014	15080.0
Time taken: 123.857 seconds, Fetched: 3899 row(s)

--------------------------------------------------------------------------------------------------------------------------------------

select job_title,case_status,full_time_position,year,avg(prevailing_wage) as average from h1b_applications where full_time_position = 'Y' and year = '2015' and case_status in ('CERTIFIED','CERTIFIED-WITHDRAWN') group by job_title,case_status,full_time_position,year order by average desc;
----->
JEWISH OUTREACH AND ENGAGEMENT EDUCATOR	CERTIFIED	Y	2015	16578.0
ASSISTANT PROFESSOR EDUCATION	CERTIFIED	Y	2015	16570.0
FLIGHT PARAMEDIC	CERTIFIED	Y	2015	16120.0
Time taken: 222.96 seconds, Fetched: 85059 row(s)


select job_title,case_status,full_time_position,year,avg(prevailing_wage) as average from h1b_applications where full_time_position = 'N' and year = '2015' and case_status in ('CERTIFIED','CERTIFIED-WITHDRAWN') group by job_title,case_status,full_time_position,year order by average desc;
----->
URBAN PLANNING RESEARCH ASSISTANT	CERTIFIED	N	2015	16681.6
ICE SKATING COACH/INSTRUCTOR	CERTIFIED	N	2015	15600.0
GOLF PROGRAMS MANAGER	CERTIFIED	N	2015	15080.0
Time taken: 124.14 seconds, Fetched: 3939 row(s)

-------------------------------------------------------------------------------------------------------------------------------------
select job_title,case_status,full_time_position,year,avg(prevailing_wage) as average from h1b_applications where full_time_position = 'Y' and year = '2016' and case_status in ('CERTIFIED','CERTIFIED-WITHDRAWN') group by job_title,case_status,full_time_position,year order by average desc;
----->
BUSINESS OBJECTS ADMINISTRATOR/DEVELOPER	CERTIFIED	Y	2016	70013.0
LEAD PROJECT MANAGER	CERTIFIED-WITHDRAWN	Y	2016	70013.0
Time taken: 132.939 seconds, Fetched: 55742 row(s)

select job_title,case_status,full_time_position,year,avg(prevailing_wage) as average from h1b_applications where full_time_position = 'N' and year = '2016' and case_status in ('CERTIFIED','CERTIFIED-WITHDRAWN') group by job_title,case_status,full_time_position,year order by average desc;
----->
TATTOO ARTIST APPRENTICE	CERTIFIED	N	2016	15600.0
HUMAN RESOURCES MANAGERS	CERTIFIED	N	2016	15600.0
OFFICE ADMINISTRATOR AND SAFETY COORDINATOR	CERTIFIED	N	2016	15080.0
Time taken: 129.847 seconds, Fetched: 42837 row(s)
--------------------------------------------------------------------------------------------------------------------------------------
