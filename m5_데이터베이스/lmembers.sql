--lmembers
SELECT * FROM prodcl;
SELECT * FROM channel;
SELECT * FROM competitor;
SELECT * FROM demo;
SELECT * FROM member;
SELECT * FROM purprd;

SELECT mname
FROM member
GROUP BY mname;

SELECT asso
FROM channel
GROUP BY asso;

SELECT custno, SUM(puramt)
FROM purprd
GROUP BY custno;

SELECT mcl
FROM prodcl
GROUP BY mcl;

SELECT stcode
FROM purprd
GROUP BY stcode;


SELECT * FROM channel;
SELECT * FROM competitor;
SELECT * FROM demo;
SELECT * FROM member;
SELECT * FROM prodcl;
SELECT * FROM purprd;

--고객별로 속성(성별, 나이, 거주지역)
SELECT custno 고객번호, gender 성별, age 나이, area 거주지역
FROM demo
ORDER BY custno;


--성별+나이 그룹, 카운트
SELECT gender 성별, age 나이, COUNT(age) 카운트
FROM demo
GROUP BY gender, age
ORDER BY gender;


--구매합계(년도별), 평균구매(년도별), 구매빈도(년도별)
SELECT SUBSTR(purdate,1,4) 년도별, SUM(puramt) 구매합계, ROUND(AVG(puramt),0) 평균구매, COUNT(puramt) 구매빈도
FROM purprd
GROUP BY SUBSTR(purdate,1,4)
ORDER BY SUBSTR(purdate,1,4);


--구매합계(월별), 평균구매(월별), 구매빈도(월별)
SELECT SUBSTR(purdate,1,6) 월별, SUM(puramt) 구매합계, ROUND(AVG(puramt),0) 평균구매, COUNT(puramt) 구매빈도
FROM purprd
GROUP BY SUBSTR(purdate,1,6)
ORDER BY SUBSTR(purdate,1,6);


--구매합계(분기별), 평균구매(분기별), 구매빈도(분기별)
SELECT SUBSTR(purdate,1,4) 년도, CEIL(SUBSTR(purdate,5,2)/3) 분기, SUM(puramt) 구매합계, ROUND(AVG(puramt),0) 평균구매, COUNT(puramt) 구매빈도
FROM purprd
GROUP BY SUBSTR(purdate,1,4), CEIL(SUBSTR(purdate,5,2)/3)
ORDER BY SUBSTR(purdate,1,4), CEIL(SUBSTR(purdate,5,2)/3);


--구매합계(반기별), 평균구매(반기별), 구매빈도(반기별)
SELECT SUBSTR(purdate,1,4) 년도, CEIL(SUBSTR(purdate,5,2)/6) 분기, SUM(puramt) 구매합계, ROUND(AVG(puramt),0) 평균구매, COUNT(puramt) 구매빈도
FROM purprd
GROUP BY SUBSTR(purdate,1,4), CEIL(SUBSTR(purdate,5,2)/6)
ORDER BY SUBSTR(purdate,1,4), CEIL(SUBSTR(purdate,5,2)/6);


--채널+이용횟수
SELECT asso 제휴사, SUM(freq) "이용횟수 합"
FROM channel
GROUP BY asso
ORDER BY SUM(freq) DESC;


--프로덕트 : 제일 많이 이용한 제휴사 조회
SELECT asso, COUNT(*)
FROM prodcl
GROUP BY asso
ORDER BY COUNT(*) DESC;


--멤버십 : 가입수가 많은 달 순서로 정렬
SELECT mname,joinmonth,  COUNT(*)
FROM member
GROUP BY mname,joinmonth
ORDER BY COUNT(*) DESC;


--멤버십 : 가입수가 많은 달 순서로 정렬
SELECT mname,  COUNT(*)
FROM member
GROUP BY mname
ORDER BY mname,COUNT(*) DESC;


-- 제휴사에 따른 월별 상품 구매율
SELECT COUNT(asso) 제휴사, SUBSTR(purdate,1,6) 월별, SUM(puramt) 구매합계, ROUND(AVG(puramt),0) "평균 구매", COUNT(BGROUP) 대분류, COUNT(MGROUP) 중분류, COUNT(SGROUP) 소분류
FROM purprd
GROUP BY SUBSTR(purdate,1,6)
ORDER BY SUBSTR(purdate,1,6);

SELECT bgroup, mgroup, sgroup
FROM purprd
ORDER BY bgroup DESC;

SELECT purprd.asso, prodcl.mcl, prodcl.scl, puramt
FROM prodcl, purprd
WHERE prodcl.asso=purprd.asso;

SELECT TO_CHAR(purprd.purdate,'yyyy-mm'), purprd.asso, prodcl.mcl, prodcl.scl, puramt
FROM prodcl, purprd
WHERE prodcl.asso=purprd.asso AND purprd.purdate=TO_DATE('201402','yyyymm');

-- 201401
SELECT SUBSTR(purprd.purdate,1,6) 월별, purprd.asso 제휴사, prodcl.mcl 중분류명, prodcl.scl 소분류명
FROM prodcl, purprd
WHERE prodcl.asso=purprd.asso 
AND TO_CHAR(TO_DATE(purprd.purdate),'yyyymm') ='201401';

-- 201402
SELECT SUBSTR(purprd.purdate,1,6) 월별, purprd.asso 제휴사, prodcl.mcl 중분류명, prodcl.scl 소분류명
FROM prodcl, purprd
WHERE prodcl.asso=purprd.asso 
AND TO_CHAR(TO_DATE(purprd.purdate),'yyyymm') ='201402'; 

--201403
SELECT SUBSTR(purprd.purdate,1,6) 월별, purprd.asso 제휴사, prodcl.mcl 중분류명, prodcl.scl 소분류명
FROM prodcl, purprd
WHERE prodcl.asso=purprd.asso 
AND TO_CHAR(TO_DATE(purprd.purdate),'yyyymm') ='201403';

--201404
SELECT SUBSTR(purprd.purdate,1,6) 월별, purprd.asso 제휴사, prodcl.mcl 중분류명, prodcl.scl 소분류명
FROM prodcl, purprd
WHERE prodcl.asso=purprd.asso 
AND TO_CHAR(TO_DATE(purprd.purdate),'yyyymm') ='201404';

-- 201405
SELECT SUBSTR(purprd.purdate,1,6) 월별, purprd.asso 제휴사, prodcl.mcl 중분류명, prodcl.scl 소분류명
FROM prodcl, purprd
WHERE prodcl.asso=purprd.asso 
AND TO_CHAR(TO_DATE(purprd.purdate),'yyyymm') ='201405';

--201406
SELECT SUBSTR(purprd.purdate,1,6) 월별, purprd.asso 제휴사, prodcl.mcl 중분류명, prodcl.scl 소분류명
FROM prodcl, purprd
WHERE prodcl.asso=purprd.asso 
AND TO_CHAR(TO_DATE(purprd.purdate),'yyyymm') ='201406';


-- 중분류명 count
SELECT COUNT(mcl) AS cnt, mcl 중분류명
FROM prodcl
GROUP BY mcl
ORDER BY cnt DESC;

-- 
SELECT COUNT(mcl), mcl
FROM prodcl, purprd
WHERE prodcl.asso = purprd.asso;



-- 채널에 따른 월별 상품 구매율

-- purprd 제휴사, channel 제휴사 다름. 어떻게 다른지?
SELECT  purprd.asso 구매제휴사, channel.asso 채널제휴사, channel.custno 고객번호, channel.freq 이용횟수
FROM channel, purprd
WHERE channel.custno=purprd.custno;

-- 월별
-- 201501
SELECT SUBSTR(purprd.purdate,1,6) 월별, channel.asso 채널제휴사, channel.custno 고객번호, channel.freq 이용횟수
FROM channel, purprd
WHERE channel.custno=purprd.custno
AND TO_CHAR(TO_DATE(purprd.purdate),'yyyymm') ='201501';

SELECT custno, COUNT(custno)
FROM channel
GROUP BY custno;






SELECT * FROM channel;
SELECT * FROM competitor;
SELECT * FROM purprd;
