

h1b = LOAD '/home/hduser1/h1bdata/' USING PigStorage('\t') AS 
(s_no,case_status,employer_name,soc_name,job_title:chararray,full_time_position,
prevailing_wage:long,year:chararray,worksite:chararray,longitute:double,latitute:double);

--dump h1b;



noheader= filter h1b by $0>=1; 
--Remove header
--Count Total Applications

cleansed= filter noheader by $1 is not null and $1!='NA';
temp= group cleansed by $4;
total= foreach temp generate group,COUNT(cleansed.$1);

--Count Total Applications who are 'CERTIFIED'

certified= filter noheader by $1 == 'CERTIFIED';
temp1= group certified by $4;
totalcertified= foreach temp1 generate group,COUNT(certified.$1);

--Count Total Applications who are 'CERTIFIED-WITHDRAWN'

certified= filter noheader by $1 == 'CERTIFIED-WITHDRAWN';
temp2= group certified by $4;
totalcertifiedwithdrawn= foreach temp2 generate group,COUNT(certified.$1);

--SUCCESS_RATE=(CERTIFIED+CERTIFIED-WITHDRAWN)/TOTAL X 100

joined= join totalcertified by $0,totalcertifiedwithdrawn by $0,total by $0;
joined= foreach joined generate $0,$1,$3,$5;
intermediateoutput= foreach joined generate $0,(float)($1+$2)*100/($3),$3;
intermediateoutput2= filter intermediateoutput by $1>70 and $2>1000;	
--Filter by success-rate greater than 70% and petition count above 1000
finaloutput= order intermediateoutput2 by $1 DESC;
dump finaloutput;
--STORE DATA INTO TEXT FILE
store finaloutput into '/home/hduser1/10.pig' using PigStorage('@');
