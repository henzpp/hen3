SELECT ABS(-78), ABS(+78)
FROM dual;

SELECT ROUND(4.875,1)
FROM dual;

--Q. 고객별 평균 주문 금액을 백원 단위로 반올림한 값을 구하세요.
SELECT * FROM orders;

SELECT custid "고객번호", ROUND(SUM(SALEPRICE)/COUNT(*),-2) "평균금액"
FROM orders
GROUP BY custid;

--Q. 고객 이름별 평균 주문 금액을 백원 단위로 반올림한 값을 구하세요
SELECT C.name, ROUND(avg(O.saleprice),-2)
FROM orders O, customer C
WHERE C.custid=O.custid
GROUP BY C.name;

--Q. 도서 제목에 '야구'가 포함된 도서를 '농구'로 변경한 후 도서 목록, 가격을 출력
SELECT * FROM book;

SELECT bookid, REPLACE(bookname, '야구','농구') bookname, publisher, price
FROM book;

--글자수, 바이트 수 LENGTH
SELECT bookname 제목, length(bookname) 글자수, lengthb(bookname) AS 바이트수
FROM book;

--데이터 넣기 INSERT
SELECT * FROM customer;
INSERT INTO customer VALUES(5, '박세리', '대한민국 대전', NULL);


--[과제_1004_4] Q. customer 테이블에서 같은 성을 가진 사람이 몇 명이나 되는지 성별 인원수를 구하세요.
SELECT * FROM customer;
SELECT SUBSTR(name, 1, 1) "성", COUNT(*) "인원"
FROM customer
GROUP BY SUBSTR(name,1,1);

SELECT * FROM orders;
--Q. 주문일로부터 10일 후 매출을 확정한다. 각 주문의 확정일자를 구하세요.
SELECT orderid "주문번호", orderdate "주문일", orderdate+10 "확정"
FROM orders;

--[과제_1004_5] Q. 2020년 7월 7일에 주문받은 도서의 주문번호, 주문일, 고객번호, 도서번호를 모두 출력하세요.
SELECT * FROM orders;
SELECT orderid 주문번호, TO_CHAR(orderdate,'yyyy-mm-dd dy') 주문일, custid 고객번호, bookid 도서번호
FROM orders
WHERE orderdate=TO_DATE('20200707', 'yyyymmdd');

--현재 날짜
SELECT SYSDATE FROM dual;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'yyyy/mm/dd dy hh24:mi:ss') "SYSDATE_1"
FROM dual;

SELECT * FROM customer;
--Q. 이름, 전화번호가 포함된 고객목록을 보이세요. 단, 전화번호가 없는 고객은 '연락처 없음'으로 표현하여 출력
SELECT name 이름, NVL(phone, '연락처 없음') 전화번호
FROM customer;

--SELECT COALESCE(NULL,NULL,'third value', 'forth value'); 세번째 값이 Null이 아닌 첫번째 값이기 때문에 세번째 값을 반환
SELECT NAME 이름, phone, COALESCE(PHONE, '연락처없음') 전화번호
FROM customer;

SELECT ROWNUM 순번, custid 고객번호, name 이름, phone 전화번호
FROM customer
WHERE ROWNUM <= 3;

SELECT * FROM orders;
--Q. 평균 주문금액 이하의 주문에 대해서 주문번호와 금액을 출력
SELECT orderid, saleprice FROM orders
WHERE saleprice < (SELECT AVG(SALEPRICE) FROM orders);

--Q. 각 고객의 평균 주문금액보다 큰 금액의 주문 내역에 대해서 주문번호, 고객번호, 금액을 출력
SELECT orderid 주문번호, custid 고객번호, saleprice 금액
FROM orders o1
WHERE saleprice > (SELECT AVG(saleprice) FROM orders o2 WHERE O1.custid = o2.custid);


--[과제_1004_6] 대한민국에 거주하는 고객에게 판매한 도서의 총 판매액을 출력
SELECT * FROM customer, orders;
SELECT SUM(orders.saleprice) as TOTAL
FROM orders, customer
WHERE customer.custid = orders.custid
AND customer.address LIKE '대한민국%';

--[과제_1004_7] 3번 고객이 주문한 도서의 최고 금액보다 더 비싼 도서를 구입한 주문의 주문번호와 금액을 출력
SELECT orderid, saleprice
FROM orders o
WHERE saleprice > ( SELECT MAX(o.saleprice)
    FROM customer c, orders o
    WHERE o.custid=c.custid AND c.custid='3');



--[과제_1004_8] 고객번호가 2 이하인 고객의 판매액을 출력(단, 고객이름과 고객별 판매액 포함)
SELECT cs.name, SUM(orders.saleprice)
FROM (SELECT custid, name 
FROM customer
WHERE custid<=2) cs, orders
WHERE cs.custid = orders.custid 
GROUP BY cs.name;

--[과제_1004_9] lmembers 데이터를 고객별로 속성(성별,나이,거주지역) 구매합계(반기별), 평균구매(반기별), 구매빈도(반기별)를 출력

SELECT  * FROM customer;
select * from orders;

select c.name, sum(o.saleprice)
from orders o, customer c
where c.custid=o.custid(+)
group by c.name;

--Q. NULL을 0으로 컬럼명을 고객별 판매액으로 수정
select c.name, NVL(SUM(o.saleprice),0) "고객별 판매액"
from orders o, customer c
where c.custid=o.custid(+)
group by c.name;

-- view는 가상의 테이블이라고 하며 데이터는 없고 SQL만 저장되어 있는 object 
-- view는 기본 테이블이나 뷰를 삭제하게 되면 해당 데이터를 기초로 한 다른 뷰들이 자동으로 삭제되고 ALTER 명령을 사용할 수 없다.
-- 내용을 수정하기 위해서는 DROP & CREATE를 반복하여야 하며 원본 이름으로 생성할 수 없다. 실무에서는 "vw_"접미사나 접두사를 붙여 사용.
create view vw_customer
as select *
from customer
where address like '%대한민국%';

select * from vw_customer;

-- Q. orders 테이블에서 고객이름과 도서이름을 바로 확인할 수 있는 뷰를 생성한 후
-- 김연아 고객이 구입한 도서의 주문번호, 도서이름, 주문액을 출력
CREATE VIEW vw_orders
as select o.orderid, o.custid, c.name, o.bookid, b.bookname, o.saleprice, o.orderdate
from orders o, customer c, book b
WHERE o.custid=c.custid AND o.bookid=b.bookid;

SELECT orderid, bookname, saleprice
FROM vw_orders
WHERE name='김연아';

-- Q. 앞서 생성한 뷰를 vw_customer를 삭제
DROP VIEW vw_customer;