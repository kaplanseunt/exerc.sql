
--From the login_details table, fetch the users who logged in consecutively 3 or more times.

create table login_details(
login_id int primary key,
user_name varchar(50) not null,
login_date date);


delete from login_details;

insert into login_details values
(101, 'Michael', getdate()),
(102, 'James', getdate()),
(103, 'Stewart', getdate()+1),
(104, 'Stewart', getdate()+1),
(105, 'Stewart', getdate()+1),
(106, 'Michael', getdate()+2),
(107, 'Michael', getdate()+2),
(108, 'Stewart', getdate()+3),
(109, 'Stewart', getdate()+3),
(110, 'James', getdate()+4),
(111, 'James', getdate()+4),
(112, 'James', getdate()+5),
(113, 'James', getdate()+6);

select * from login_details;

select distinct x.repeated_users from (
select * ,
	case when user_name = lead(user_name) over (order by login_id) 
	and  user_name = lead(user_name , 2) over (order by login_id)
	then user_name
	else null 
	end as repeated_users
from login_details ) x
where x.repeated_users is not null