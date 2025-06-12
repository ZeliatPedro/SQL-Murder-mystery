SELECT* from crime_scene_report
where city="SQL City" and type="murder" and date=20180115
--

select * from interview where person_id=16371;
---
SELECT * from person where name LIke "Anna%"
---
select * from person where address_street_name Like "North%"
order by address_number ASC
---
SELECT* from interview where person_id=14887
---
select * from get_fit_now_check_in where check_in_date= 20180109
--
select get_fit_now_member.id,get_fit_now_member.person_id,get_fit_now_member.name,get_fit_now_member.membership_status
from get_fit_now_member
join get_fit_now_check_in
ON get_fit_now_member.id=get_fit_now_check_in.membership_id
where get_fit_now_check_in.check_in_date=20180109 AND id Like "%48Z%"
--
select * from drivers_license where plate_number LIKe "H42W%"
--
SELECT* FROM interview where person_id=67318
--
SELECT* from facebook_event_checkin where event_name="SQL Symphony Concert"
--
select person_id, event_id, event_name,date
from facebook_event_checkin 
where date BETWEEN "20171201" AND "20171231" and event_id=1143
order by  date asc
--
select COUNT(person_id), person_id
from facebook_event_checkin
where date BETWEEN "20171201" AND "20171231" and event_id=1143 and person_id=99716
---

select * from drivers_license 
where id=202298 and car_make like "Tesla%" and car_model="Model S"
--
select person.id,person.name, person.license_id,drivers_license.plate_number, drivers_license.car_make,drivers_license.car_model
from person
join drivers_license
on person.license_id=drivers_license.id
where drivers_license.car_make ="Tesla" and person.id=99716
--
select * from income
where ssn=987756388
