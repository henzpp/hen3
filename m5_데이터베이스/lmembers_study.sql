--[과제_1004_9] lmembers 데이터를 고객별로 속성(성별,나이,거주지역) 구매합계(반기별), 평균구매(반기별), 구매빈도(반기별)를 출력
SELECT * FROM demo;
SELECT * FROM purprd;

--demo(gender,age,area) | purprd(puramt) | purprd(puramt)-AVG | purprd(purtime)

--고객별 속성
SELECT demo.gender, demo.age, demo.area
FROM demo;


SELECT * FROM purprd;
--구매합계(분기별), 평균구매(분기별), 구매빈도(분기별)
SELECT SUBSTR(purdate,1,4) 년도, CEIL(SUBSTR(purdate,5,2)/3) 분기, SUM(puramt) 구매합계, ROUND(AVG(puramt),1) 평균구매, COUNT(puramt) 구매빈도
FROM purprd
GROUP BY SUBSTR(purdate,1,4), CEIL(SUBSTR(purdate,5,2)/3)
ORDER BY SUBSTR(purdate,1,4), CEIL(SUBSTR(purdate,5,2)/3);

--구매합계(반기별), 평균구매(반기별), 구매빈도(반기별)
SELECT SUBSTR(purdate,1,4) 년도, CEIL(SUBSTR(purdate,5,2)/6) 분기, SUM(puramt) 구매합계, ROUND(AVG(puramt),1) 평균구매, COUNT(puramt) 구매빈도
FROM purprd
GROUP BY SUBSTR(purdate,1,4), CEIL(SUBSTR(purdate,5,2)/6)
ORDER BY SUBSTR(purdate,1,4), CEIL(SUBSTR(purdate,5,2)/6);

---------------------------------------------------------------------------
SELECT COUNT(*) FROM PURPRD;
select sum(puramt), round(avg(puramt),0) from purprd;

--Q. lmembers purprd 테이블로 부터 총구매액, 2014 구매액, 2015 구매액을 한번에 출력
SELECT (SELECT SUM(P1.PURAMT) FROM PURPRD P1) AS AMT,
(SELECT SUM(P2.PURAMT) FROM PURPRD P2 WHERE P2.PURDATE < 20150101) AS AMT_2014,
(SELECT SUM(P3.PURAMT) FROM PURPRD P3 WHERE P3.PURDATE > 20141231) AS AMT_2015
FROM DUAL;

select sum(puramt) 총구매액, 
sum(case when purdate <= '20141231' then puramt end) "2014 구매액", 
sum(case when purdate > '20141231' and purdate <= '20151231' then puramt end) "2015 구매액"
from purprd;
-- 2014 대비 2015 매출 소폭 상승했으나, 인플레이션 등 물가 상승률을 반영하여 체크해야 함
-- 매출에 영향을 주는 요인 찾기 


-- Q. lmembers 데이터에서 고객별 구매 금액의 합계를 구한 cuspur 테이블을 생성한 후 demo 테이블과 고객번호(custno)를 기준으로 결합하여 출력
CREATE TABLE CURPUR
AS SELECT custno, sum(puramt) puramt_sum
from purprd
group by custno
order by custno;

select d.* ,c.puramt_sum
from demo d, curpur c
where d.custno=c.custno
order by d.custno;

-- [과제_1006_1] purprd 데이터로부터 아래 사항을 수행하세요.
-- 2년간 구매금액을 연간 단위로 분리하여 고객별, 제휴사별로 구매액을 표시하는 AMT_14, AMT_15 테이블 2개를 생성 (출력내용 : 고객번호, 제휴사, SUM(구매금액), 구매금액)
SELECT * FROM PURPRD;
CREATE TABLE AMT_14
AS SELECT custno 고객번호, COUNT(asso) 제휴사, SUM(puramt) 구매액
FROM purprd
GROUP BY custno
ORDER BY CUSTNO;

SELECT * FROM AMT_14;
DROP TABLE AMT_14;

-- AMT_14와 AMT_15 2개 테이블을 고객번호와 제휴사를 기준으로 FULL OUTER JOIN 적용하여 결합한 AMT_YEAR_FOJ 테이블 생성


-- 14년과 15년의 구매금액 차이를 표시하는 증감 컬럼을 추가하여 출력(단, 고객번호, 제휴사별로 구매금액 및 증감이 구분되어야 함)


