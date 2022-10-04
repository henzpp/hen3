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



SELECT *
FROM demo
ORDER BY custno;