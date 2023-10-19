-- Query 7:

-- From the weather table, fetch all the records when London had extremely cold temperature for 3 consecutive days or more.

-- Note: Weather is considered to be extremely cold then its temperature is less than zero.

--Table Structure:

drop table weather;
create table weather
(
id int,
city varchar(50),
temperature int,
day date
);
delete from weather;

INSERT INTO weather VALUES
(1, 'London', -1, CONVERT(DATE, '2021-01-01', 120)),
(2, 'London', -2, CONVERT(DATE, '2021-01-02', 120)),
(3, 'London', 4, CONVERT(DATE, '2021-01-03', 120)),
(4, 'London', 1, CONVERT(DATE, '2021-01-04', 120)),
(5, 'London', -2, CONVERT(DATE, '2021-01-05', 120)),
(6, 'London', -5, CONVERT(DATE, '2021-01-06', 120)),
(7, 'London', -7, CONVERT(DATE, '2021-01-07', 120)),
(8, 'London', 5, CONVERT(DATE, '2021-01-08', 120));

SELECT @@version;

select * from weather;




--Solution:

select id, city, temperature, day
from (
    select *,
        case when temperature < 0
              and lead(temperature) over(order by day) < 0
              and lead(temperature,2) over(order by day) < 0
        then 'Y'
        when temperature < 0
              and lead(temperature) over(order by day) < 0
              and lag(temperature) over(order by day) < 0
        then 'Y'
        when temperature < 0
              and lag(temperature) over(order by day) < 0
              and lag(temperature,2) over(order by day) < 0
        then 'Y'
        end as flag
    from weather) x
where x.flag = 'Y';
