-- Query 9:

Find the top 2 accounts with the maximum number of unique patients on a monthly basis.

Note: Prefer the account if with the least value in case of same number of unique patients

select account_id, count(patient_id) from
patient_logs


--Table Structure:

drop table patient_logs;
create table patient_logs
(
  account_id int,
  date date,
  patient_id int
);

INSERT INTO patient_logs VALUES (1, CONVERT(DATE, '2020-01-02', 120), 100);
INSERT INTO patient_logs VALUES (1, CONVERT(DATE, '2020-01-27', 120), 200);
INSERT INTO patient_logs VALUES (2, CONVERT(DATE, '2020-01-01', 120), 300);
INSERT INTO patient_logs VALUES (2, CONVERT(DATE, '2020-01-21', 120), 400);
INSERT INTO patient_logs VALUES (2, CONVERT(DATE, '2020-01-21', 120), 300);
INSERT INTO patient_logs VALUES (2, CONVERT(DATE, '2020-01-01', 120), 500);
INSERT INTO patient_logs VALUES (3, CONVERT(DATE, '2020-01-20', 120), 400);
INSERT INTO patient_logs VALUES (1, CONVERT(DATE, '2020-03-04', 120), 500);
INSERT INTO patient_logs VALUES (3, CONVERT(DATE, '2020-01-20', 120), 450);




--analyse
month account_id patient_number unique_patient_number
1		1			2				2
1		2			4				3
1		3			2				2
3		1			1				1


select temp3.month,temp3.account_id,temp3.patient_number from (
	SELECT temp2.*,
		   RANK() OVER (PARTITION BY temp2.month ORDER BY temp2.patient_number DESC, temp2.account_id) as ranking
	FROM (
		SELECT temp.month, temp.account_id, COUNT(temp.patient_id) as patient_number
		FROM (
			SELECT DISTINCT DATEPART(MONTH, date) as month, p.account_id, p.patient_id
			FROM patient_logs p
		) temp
		GROUP BY temp.month, temp.account_id
	) temp2 ) temp3
where temp3.ranking in (1,2);


-- Solution2: ?
select a.month, a.account_id, a.no_of_unique_patients
from (
		select x.month, x.account_id, no_of_unique_patients,
			row_number() over (partition by x.month order by x.no_of_unique_patients desc) as rn
		from (
				select pl.month, pl.account_id, count(1) as no_of_unique_patients
				from (select distinct DATEPART(MONTH, date)  as month, account_id, patient_id
						from patient_logs) pl
				group by pl.month, pl.account_id) x
     ) a
where a.rn < 3;
