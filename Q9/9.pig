

h1b = LOAD '/home/hduser1/h1bdata/' USING PigStorage('\t') AS 
(s_no,case_status,employer_name,soc_name,job_title:chararray,full_time_position,
prevailing_wage:long,year:chararray,worksite:chararray,longitute:double,latitute:double);

--dump h1b;

pro1 = filter h1b by $0>=1;

--dump pro1;

pro2 = filter pro1 by $1 is not null and $1!='NA';

--dump pro2;

pro3= group pro2 by $2;

--dump pro3;

total= foreach pro3 generate group,COUNT(pro2.$1);

--dump total;

certified= filter pro1 by $1 == 'CERTIFIED';

--dump certified;

group1= group certified by $2;

--dump group1;

totalcertified= foreach group1 generate group,COUNT(certified.$1);

--dump totalcertified;

withdrawn = filter pro1 by $1 == 'CERTIFIED-WITHDRAWN';

--dump withdrawn;

group2= group withdrawn by $2;

--dump group2;

totalwithdrawn= foreach group2 generate group,COUNT(withdrawn.$1);

--dump totalwithdrawn;

joined= join totalcertified by $0,totalwithdrawn by $0,total by $0;

--dump joined;

joined1= foreach joined generate $0,$1,$3,$5;

--dump joined1;

intermediateoutput= foreach joined1 generate $0,(float)($1+$2)*100/($3),$3;

--dump intermediateoutput;

intermediateoutput2= filter intermediateoutput by $1>70 and $2>1000;

--dump intermediateoutput2;

finaloutput= order intermediateoutput2 by $1 DESC;

dump finaloutput;


