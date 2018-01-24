#!/bin/bash 
show_menu()
{
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}**********************H1B APPLICATIONS***********************${NORMAL}"
    echo -e "${MENU}**${NUMBER} 1)${MENU} 1a.Is the number of petitions with Data Engineer job title increasing over time? ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 2)${MENU} 1b.Find top 5 job titles who are having highest growth in applications. ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 3)${MENU} 2a.Which part of the US has the most Data Engineer jobs for each year? ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 4)${MENU} 2b.Find top 5 locations in the US who have got certified visa for each year.[certified]. ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 5)${MENU} 3.Which industry(SOC_NAME) has the most number of Data Scientist positions? [certified]? ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 6)${MENU} 4.Which top 5 employers file the most petitions each year? - Case Status - ALL. ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 7)${MENU} 5a.Find the most popular top 10 job positions for H1B visa applications for each year? For All Applications.?${NORMAL}"
    echo -e "${MENU}**${NUMBER} 8)${MENU} 5b.Find the most popular top 10 job positions for H1B visa applications for each year? Only for Certified Applications.${NORMAL}"
    echo -e "${MENU}**${NUMBER} 9)${MENU} 6.Find the percentage and the count of each case status on total applications for each year. Create a line graph depicting the pattern of All the cases over the period of time? ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 10)${MENU} 7.Create a bar graph to depict the number of applications for each year [All] ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 11)${MENU}Which 8.Find the average Prevailing Wage for each Job for each Year (take part time and full time separate). Arrange the output in descending order - [Certified and Certified Withdrawn.]? ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 12)${MENU} 9.Which are the employers along with the number of petitions who have the success rate more than 70%  in petitions. (total petitions filed 1000 OR more than 1000) ? ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 13)${MENU} 10.Which are the  job positions along with the number of petitions which have the success rate more than 70%  in petitions (total petitions filed 1000 OR more than 1000? ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 14)${MENU} 11.Export result for question no 10 to MySql database. ${NORMAL}"	
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please Enter a menu option and enter or ${RED_TEXT}enter to exit. ${NORMAL}"
    read opt
}
function option_picked() 
{
    COLOR='\033[01;31m' # bold red
    RESET='\033[00;00m' # normal white
    MESSAGE="$1"  #modified to post the correct option selected
    echo -e "${COLOR}${MESSAGE}${RESET}"
}


clear
show_menu
while [ opt != '' ]
    do
    if [[ $opt = "" ]]; then 
            exit;
    else
        case $opt in
        1) clear;
        option_picked "1a.Is the number of petitions with Data Engineer job title increasing over time?";
        hadoop fs -rmr /niit/output1a
	hadoop jar /home/hduser1/h1b.jar h1b_project.Q1a /niit/h1b/0* /niit/output1a
	hadoop fs -cat /niit/output1a/p*
	show_menu;
        ;;

        2) clear;
        option_picked "1b.Find top 5 job titles who are having highest growth in applications";
        pig -x local /home/hduser1/1b.pig
        show_menu;
        ;;
            
        3) clear;
        option_picked "2a.Which part of the US has the most Data Engineer jobs for each year?";
        echo -e "Enter the year (2011,2012,2013,2014,2015,2016)"
       read var
       echo  "part of the US has the most Data Engineer jobs for ${var}"
       hive -e "SELECT worksite,COUNT(case_status) AS number_of_petition,year from h1b.h1b_final WHERE job_title LIKE '%DATA ENGINEER%' and case_status = 'CERTIFIED' and year='$var' GROUP BY worksite,year ORDER BY number_of_petition desc limit 1;";
        sleep 5
        show_menu;
        ;;
	
        4) clear;
        option_picked "2b.Find top 5 locations in the US who have got certified visa for each year.[certified]?";
        echo -e "Enter the year (2011,2012,2013,2014,2015,2016)"
       read var
        echo  "Top 5 locations in the US who have got certified visa for ${var}"
       hive -e "select worksite,count(case_status) as total,year from h1b.h1b_final WHERE year='$var' and case_status='CERTIFIED' group by worksite,year order by total desc limit 5;";
        show_menu;
        ;;
          
         5) clear; 
       option_picked "3) Which industry(SOC_NAME) has the most number of Data Scientist positions? [certified]";
        hive -e "select soc_name,case_status ,count(soc_name) as cnt from h1b.h1b_final where job_title like '%DATA SCIENTIST%' and case_status = 'CERTIFIED' group by soc_name,case_status order by cnt desc;";
        sleep 5
        show_menu;
        ;;

	6) clear;
       option_picked "4.Which top 5 employers file the most petitions each year? - Case Status - ALL.";
        hadoop fs -rm -r /niit/projectoutput4
	hadoop jar /home/hduser1/h1b.jar h1b_project.Q4 /niit/h1b/0* /niit/projectoutput4
	hadoop fs -cat /niit/projectoutput4/p*
	sleep 5
        show_menu;
	;;

	 7) clear;
       option_picked "5 a) Find the most popular top 10 job positions for H1B visa applications for each year? For all the applications.";      
        hadoop fs -rm -r /niit/output5a
	hadoop jar /home/hduser1/h1b.jar h1b_project.Q5a /niit/h1b/0* /niit/output5a
	hadoop fs -cat /niit/output5a/p*

       sleep 5
       show_menu;

       ;;

	 8) clear;
       option_picked "5 b) Find the most popular top 10 job positions for H1B visa applications for each year? For only certified applications.";      
        hadoop fs -rm -r /niit/output5b
	hadoop jar /home/hduser1/h1b.jar h1b_project.Q5b /niit/h1b/0* /niit/output5b
	hadoop fs -cat /niit/output5b/p*

       sleep 5
       show_menu;

       ;;

	 9) clear;
       option_picked "6) Find the percentage and the count of each case status on total applications for each year. Create a line graph depicting the pattern of All the cases over the period of time.";
       
        pig -x local '/home/hduser1/h1b6.pig'
        sleep 5
       show_menu;

       ;;

	10) clear;
       option_picked "7) Create a bar graph to depict the number of applications for each year. [All]";
       
       hive -e "select year,count(*) from h1b.h1b_final group by year;";
       sleep 5
       show_menu;

       ;;

	11) clear;
       option_picked "8) Find the average Prevailing Wage for each Job for each Year (take part time and full time separate). Arrange the output in descending order - [Certified and Certified Withdrawn.]";
       
       echo -e "Enter the year (2011,2012,2013,2014,2015,2016)"
       read year
       echo -e "Enter the choice Full time / Part time. (Y/N)"
       read var
       echo  "Average Prevailing Wage for each Job for year ${year} and full time position ${var}"
       hive -e "select job_title,full_time_position,year,avg(prevailing_wage) as average from h1b.h1b_final 
 where full_time_position ='$var' and year='$year' group by job_title,full_time_position,year order by average desc;"
       sleep 5 
       show_menu;

       ;;
   
	 12) clear;
	
       option_picked "9) Which are the employers along with the number of petitions who have the success rate more than 70%  in petitions(total petitions filed 1000 OR more than 1000) ?";
       pig -x local '/home/hduser1/9.pig'
       sleep 5 
       show_menu;

       ;;

	
       13) clear;
       option_picked "10) Which are the  job positions along with the number of petitions which have the success rate more than 70%  in   petitions (total petitions filed 1000 OR more than 1000)?";
	hadoop fs -rmr /niit/Q10
	rm -r /home/hduser1/Q10
        pig -x local '/home/hduser1/10.pig'
	hadoop fs -put /home/hduser1/Q10 /niit/
       sleep 5
       show_menu;

       ;;

	 14) clear;
       option_picked "11) Export result for question no 10 to MySql database."
       start-all.sh
       mysql -u root -p"Shiva123' -e 'DROP DATABASE project;CREATE DATABASE IF NOT EXISTS project;USE project;CREATE TABLE h1b(job_title  VARCHAR(255) NOT NULL,success_rate Double NOT NULL,petitions INT NOT NULL);";



#sqoop list-tables --connect jdbc:mysql://localhost/h1b --username root --password Shiva123;


    sqoop export --connect jdbc:mysql://localhost/project --username root --password Shiva123 --table h1b --update-mode allowinsert --update-key employee_name --export-dir /niit/Q10/p* --input-fields-terminated-by '@' -m 1;

echo -e '\n\n Display content from MySQL Database.\n\n'
echo -e '\n 10) Which are the  job positions along with the number of petitions which have the success rate more than 70%  in petitions (total petitions filed 1000 OR more than 1000)?\n\n'

mysql -u root -p'Shiva123' -e "SELECT * FROM project.h1b"; 
       show_menu;
      
       ;;



\n) exit;
        ;;

        *) clear;
        option_picked "Pick an option from the menu";
        show_menu;
        ;;
    esac
fi

done

