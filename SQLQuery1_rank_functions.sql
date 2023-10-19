/*
CREATE TABLE personel
(
p_no INT IDENTITY(1,1) PRIMARY KEY,
name VARCHAR(25) NOT NULL, 
lastname VARCHAR(30) NOT NULL,
gender CHAR(1) NOT NULL,
birth_date DATE,
birth_place VARCHAR(20),
work_start_date date,
unit VARCHAR(25),
title VARCHAR(25),
working_hours TINYINT,
salary MONEY,
bonus MONEY
);	


INSERT INTO personel(name,lastname,gender,birth_date,birth_place,work_start_date,unit,title,working_hours,salary,bonus)
VALUES
('Serkan','EKİNCİ','E','1985.03.25','Adana','2002.03.01','KALİTE','MÜHENDİS',35,2500,350),
('Semih Furkan','TURHAN','E','1980.04.15','Adana','2002.05.03','İDARİ','İK UZMANI',30,2800,250),
('Ekin Emir','SAKARYA','E','1983.03.23','İstanbul','2005.05.12','İDARİ','TEKNİSYEN',30,3000,250),
('Muhammet Ali','ÇOLAK','E','1982.05.05','İstanbul','2005.06.17','ARGE','TEKNİSYEN',40,2800,350),
('Kübra','ÇITAK','K','1987.12.05','İstanbul','2000.01.12','İDARİ','MÜHENDİS',30,4500,500),
('Kübra GÜL','ESMER','K','1982.10.22','Ankara',	'1998.05.07','KALİTE','İK UZMANI',35,4000,250),
('Emirhan','TANAR','E','1983.02.28','İstanbul','1997.05.07','KALİTE','İK UZMANI',35,5200,450),
('Enes','YANIK','E','1975.05.07','İzmir','2010.07.17','İDARİ','İK UZMANI',45,4500,450),
('Ahmet Turan','ACI','E','1974.05.01','Konya','2000.08.18','ARGE','İK UZMANI',40,4200,400),
('Muhammet Yasin','TAŞ','E','1974.07.02','Adana','1995.09.05','TEKNİK','MÜHENDİS',40,4400,400),
('Fadıl Ahmet','CAN','E','1976.09.18','Konya','1998.10.12','İDARİ','İK UZMANI',45,3250,450),
('Yusuf Alperen','ALBAYRAK','E','1976.08.19','Ankara','2000.11.25','KALİTE','İK UZMANI',30,5200,250),
('Hasan Furkan','HASKIRIŞ','E','1978.09.20','İstanbul','1999.10.27','KALİTE','İK UZMANI',35,4200,350),
('Emine Zuhal','UYSAL','K','1985.08.04','İzmir','2000.05.27','KALİTE','İK UZMANI',30,2500,100),
('Görkem Taha','UYSAL','E','1990.12.01','İzmir','2000.03.06','İDARİ','MÜHENDİS',30,2000,150),
('Lara','UYSAL','K','1982.02.15','Ankara','1995.05.12','TEKNİK','TEKNİSYEN',30,4800,150),
('Uğur','BUZDAĞ','E','1980.10.30','İstanbul','2001.08.10','KALİTE','İK UZMANI',40,4800,400),
('İlyas','IŞILDAK','E','1980.10.28','Ankara','2001.09.28','TEKNİK','MÜHENDİS',30,2200,300),
('Bayram','ÇAKIR','E','1981.11.19','İzmir','2001.07.30','TEKNİK','TEKNİSYEN',30,2700,300),
('Deniz','KÖSEDAĞ','E','1981.12.20','İzmir','2002.12.20','ARGE','İK UZMANI',30,2900,350),
('Efe Can','ÇAPANOĞLU','E','1982.02.20','İstanbul','1998.05.25','ARGE','TEKNİSYEN',30,4800,200),
('Serdar Engin','BOZOKLU','E','1983.07.21','İstanbul','2005.09.05','KALİTE','İK UZMANI',30,3000,200),
('Berat','DUMAN','E','1975.06.13','İstanbul','2005.03.05','KALİTE','TEKNİSYEN',30,2800,200),
('Bedirhan','ŞİRİN','E','1978.04.02','İzmir','1998.04.04','İDARİ','İK UZMANI',35,3300,250),
('Emre','ERTÜZÜN','E','1980.07.03','Bilecik','2002.07.18','TEKNİK','TEKNİSYEN',35,3100,300),
('Fatih','GÖKÇE','E','1975.06.18','İstanbul','2002.03.25','TEKNİK','TEKNİSYEN',35,3100,450),
('Dilek','CANİŞ','K','1978.03.03','İstanbul','2005.08.13','KALİTE','TEKNİSYEN',40,2500,500),
('Mehmet','GEYLAN','E','1974.01.07','Adana','2007.08.17','TEKNİK','TEKNİSYEN',40,2200,450),
('Hüseyin','MAHDUM','E','1987.11.21','Ankara','2005.12.11','TEKNİK','TEKNİSYEN',35,2600,350),
('Muhammed Ali','MELAYİM','E','1987.12.22','İstanbul','2007.08.13','KALİTE','MÜHENDİS',35,3100,400);
*/


select * from personel

select p_no, salary,
rank() over(order by salary desc) as with_rank,
row_number() over(order by salary desc) as with_rownumber,
dense_rank() over(order by salary desc) as with_denserank,
max(salary) over() as max_salary
--max_salary-salary as diff
from personel


select p_no, salary,title,
rank() over(order by salary desc) as with_rank,
row_number() over(order by salary desc) as with_rownumber,
dense_rank() over(order by salary desc) as with_denserank,
max(salary) over(partition by title) as max_salary		--partition by ifadesi kendi titl'ı içinde anlamı katar.
--max_salary-salary as diff
from personel
order by salary desc,with_rownumber asc

--lag fonksiyonu önceki satırı kontrol eder lead fonksiyonu öndeki satırı.


