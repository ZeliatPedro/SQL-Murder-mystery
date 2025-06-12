# SQL-Murder-mystery
SQL MURDER MYSTERY PROJECT
Information
A crime has taken place and the detective needs your help. The detective gave you the crime scene report, but you somehow lost it. You vaguely remember that the crime was a murder that occurred sometime on Jan.15, 2018 and that it took place in SQL City.

Queries and Steps
The crime occurred on 15/01/2018
The first step is to retrieve the crime scene report from the police database using the query-
SELECT* from crime_scene_report
where city="SQL City" and type="murder" and date=20180115
There were two witnesses according to the report and we proceed to identifying and locating the witnesses.
I identified the first witness using the query-
select * from person where address_street_name Like "North%"
order by address_number ASC
-	The first witness is Marty Schapiro, who lives at the last house 4919 Northwestern Dr, with id 14887.
I identified the second witness using this query-
SELECT * from person where name LIke "Anna%"
Annabel Miller with ID 16371 and lives in Franklin Avenue
The second step was analysing the witnesses statements
Annabel’s statement was retrieved using the below query-
select * from interview where person_id=16371;
she recognized the killer who works out in the same gym as her- get fit now gym and was at the gym a week before the murder (9th January )
Marty’s statement was retrieved using the below query-
SELECT* from interview where person_id=14887
He saw the murderer with a get fit now gym bag and a membership no starting with 48Z, which is the bag Gold members of the gym have.
The third step was finding out the members who were at the gym at the same time as Annabel on the 9th of January 2018, using this query:
select * from get_fit_now_check_in where check_in_date= 20180109
10 people attended the gym that day, I then narrowed it down to two members who had Gold membership status,  I combined the checkin and member tables using ID as primary key.   
using the below query:
select * from get_fit_now_member where membership_status="gold" and id Like "%48Z%"
The result was two members Joe Germuska with person id 28819 and Jeremy Bowers person id 67318

Using the Query below also give the same answers of the two members with Gold memebership who visited the gym on 09012018:
select get_fit_now_member.id,get_fit_now_member.person_id,get_fit_now_member.name,get_fit_now_member.membership_status
from get_fit_now_member
join get_fit_now_check_in
ON get_fit_now_member.id=get_fit_now_check_in.membership_id
where get_fit_now_check_in.check_in_date=20180109 AND id Like "%48Z%"
Then I went Ahead to query the interview database to check the statements of the two Gold members who visited the gym on 9th january. The Query with Jeremy Bowers person id came in positive using the below code:
SELECT* FROM interview where person_id=67318
He was hired by a Rich woman around 5f5 of 5f7, red hair, drives a Tesla Model S and attended the SQL symphony concert 3 times in Dec 2017.
I went further by querying the facebook event calender, using the event id and event date that happened in 2017 december, using the below queries:
select person_id, event_id, event_name,date
from facebook_event_checkin 
where date BETWEEN "20171201" AND "20171231" and event_id=1143
order by  date asc
This brought out the person id  of people who attended the SQL symphony concert all through December 2017.
I narrowed it down to the number of times a person attended the concert all through December 2017.
Person id 99716 attended the SQL symphony in dec 2017 3 times, this was gotten using the below query:
select COUNT(person_id), person_id
from facebook_event_checkin
where date BETWEEN "20171201" AND "20171231" and event_id=1143 and person_id=99716
The Last Steps was verifying the person with person_id 99716, using the descrption given by Jeremy Bowers. This was confirmed using the information on the drivers license database. This was done by combining the person and driver license table together using id as primary key. Her car model and car make matched the description as given. The query used in achieving this is:
select person.id,person.name, person.license_id,drivers_license.plate_number, drivers_license.car_make,drivers_license.car_model
from person
join drivers_license
on person.license_id=drivers_license.id
where drivers_license.car_make ="Tesla" and person.id=99716

Miranda Priestly features also matched with what is on the driver’s license database. She has red hair and also 5f7. The query used to achieve this is:
select * from drivers_license 
where id=202298 and car_make like "Tesla%" and car_model="Model S"
The income table was also used to establish that she is rich, she earns 310000 annually. The query used in achieving this is:
select * from income
where ssn=987756388
I matched her social security number from the person table to get her annual income.
From the above it can be established that Miranda Priestly is the culprit.
![image](https://github.com/user-attachments/assets/dafb6e55-7e7f-4694-afa5-db397c1373ee)
