--DML

SELECT * FROM book;
SELECT bookname, price FROM book;
SELECT publisher FROM book;
SELECT DISTINCT publisher FROM book;

SELECT * FROM book
WHERE price < 10000;

--Q. ������ 10000�� �̻� 20000�� ������ ���� �˻�

SELECT * FROM book
WHERE price >= 10000 and price <= 20000;

--Q. ���ǻ簡 �½����� Ȥ�� ���ѹ̵���� ������ �˻�
SELECT * FROM book
WHERE publisher = '�½�����' or publisher = '���ѹ̵��';

SELECT * FROM book
WHERE publisher IN('�½�����', '���ѹ̵��');

--Q. ���ǻ簡 �½����� Ȥ�� ���ѹ̵� �ƴ� ������ �˻�

SELECT * FROM book
WHERE publisher NOT IN('�½�����', '���ѹ̵��');

SELECT * FROM book
WHERE bookname LIKE '�౸�� ����';

--Q. �����̸��� �౸�� ���Ե� ���ǻ縦 �˻�

SELECT bookname, publisher FROM book
WHERE bookname LIKE '�౸%'; 
--% �� %�౸% �� �� �յڷ� ���� % % �ϰ� �ڿ��� ���ڰ� ���� �ڿ��� %

--Q. �����̸��� ���� �� ��° ��ġ�� '��'��� ���ڿ��� ���� ���� �˻�

SELECT bookname, publisher FROM book
WHERE bookname LIKE '_��%';

--Q. �౸�� ���� ���� �� ������ 20,000�� �̻��� ���� �˻�
SELECT * FROM book
WHERE bookname LIKE '%�౸%' and price >= 20000;

--�������� sort -> ORDER BY
SELECT * FROM book
ORDER BY bookname;

--�������� ����
SELECT * FROM book
ORDER BY bookname DESC;

--Q. ������ ���ݼ����� �˻��ϰ� ������ ������ �̸������� �˻�
SELECT * FROM book
ORDER BY price, bookname;

--Q. ������ ������ ������������ �˻��ϼ���. ���� ������ ���ٸ� ���ǻ��� ������������ ���
SELECT * FROM book
ORDER BY price DESC, publisher ASC;

SELECT * FROM orders;
SELECT SUM(saleprice)
FROM orders;

--Q. 2�� �迬�� ���� �ֹ��� ������ �� �Ǹž��� ���ϼ���.
--AS "�÷��̸�" �� �ֵ���ǥ
SELECT SUM(saleprice) AS "�� �Ǹž�" FROM orders
WHERE custid=2;

--Q. saleprice�� �հ�(TOTAL), ���(AVG), �ּҰ�(MIN), �ִ밪(MAX)�� ���
-- ���� ������ �ֵ���ǥ ���൵ ��
SELECT SUM(saleprice) AS TOTAL, AVG(saleprice) AS AVG,
MIN(saleprice) AS MIN, MAX(saleprice) AS MAX From orders;

SELECT COUNT(*)
FROM orders;

SELECT custid, COUNT(*) AS ��������, SUM(saleprice) AS "�� �Ǹž�"
FROM orders
GROUP BY custid;
-- ������ ������ group by ���� ��������, �� �Ǹž�

--[����_0930_1]
--Q. ������ 8000�� �̻��� ������ ������ ���� ���Ͽ� ���� �ֹ� ������ �� ������ ���ϼ���.
-- ��, �α� �̻� ������ ���� ���ϼ���.
SELECT custid, COUNT(*) AS "�� ����"
FROM orders
WHERE saleprice >= 8000
GROUP BY custid
HAVING count(*) >= 2;


-- �� ���̺� �������� ������ ���� ����
SELECT * FROM customer;
SELECT * FROM orders;

SELECT * 
FROM customer, orders
WHERE customer.custid=orders.custid;

--Q. ���� ���� �ֹ��� ���� �����͸� ������ �����Ͽ� ���
SELECT * FROM customer, orders
WHERE customer.custid=orders.custid 
ORDER BY customer.custid;

--Q. ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻�
SELECT customer.name, orders.saleprice
FROM customer, orders
WHERE customer.custid=orders.custid;

--Q. ������ �ֹ��� ��� ������ �� �Ǹž��� ���ϰ� ������ ����
SELECT customer.name, SUM(orders.saleprice)
FROM customer, orders
WHERE customer.custid=orders.custid
GROUP BY customer.name 
ORDER BY customer.name;

--Q. ���� �̸��� ���� �ֹ��� ������ �̸��� ���ϼ���
SELECT C.name, B.bookname
FROM customer C, orders O, book B
WHERE C.custid=O.custid AND O.bookid=B.bookid;

--Q. ������ 20000���� ������ �ֹ��� ���� �̸��� ������ �̸��� ���ϼ���
SELECT C.name, B.bookname
FROM customer C, orders O, book B
WHERE C.custid = O.custid
and O.bookid = B.bookid and B.price = 20000;

--Q. ������ �������� ���� ���� �����Ͽ� ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� ���ϼ���
SELECT customer.name, orders.saleprice as �ǸŰ���
FROM customer LEFT JOIN orders on customer.custid=orders.custid;

SELECT C.name, O.saleprice
FROM customer C, orders O
WHERE C.custid = O.custid(+);
-- ȣ�� �÷��� (+) ���൵ �ȴ�,,

SELECT * FROM book;
--Q. ���� ��� ������ �̸��� ���
SELECT bookname
FROM book
WHERE price = (SELECT MAX(price) FROM book);

--[����_0930_2] ������ ������ �� �ִ� ���� �̸��� �˻�
SELECT name
FROM customer
WHERE custid IN (SELECT custid FROM orders);

SELECT customer.name
FROM customer, orders
WHERE customer.custid = orders.custid
GROUP BY customer.name;

--[����_0930_3] ���ѹ̵��� ������ ������ ������ ���� �̸��� ���
SELECT name
FROM customer
WHERE custid IN (SELECT custid FROM orders WHERE bookid IN(SELECT bookid FROM book WHERE publisher='���ѹ̵��'));

SELECT customer.name
FROM customer, book, orders
WHERE book.bookid = orders.bookid
and customer.custid = orders.custid
AND book.publisher = '���ѹ̵��';

--[����_0930_4] ���ǻ纰�� ���ǻ��� ��� ���� ���ݺ��� ��� ������ ���
SELECT book.bookname
FROM book
WHERE book.price > (SELECT avg(b2.price) FROM book b2 WHERE b2.publisher=book.publisher);

SELECT *
FROM book;


--[����_0930_5] ������ �ֹ����� ���� ���� �̸��� ���
SELECT name
FROM customer
MINUS
SELECT name
FROM customer
WHERE custid IN (SELECT custid FROM orders);

--[����_0930_6] �ֹ��� �ִ� ���� �̸��� �ּҸ� ���
SELECT name, address
FROM customer
WHERE EXISTS(SELECT * FROM orders WHERE customer.custid=orders.custid);


--DDL
CREATE TABLE newbook(
bookid      NUMBER,
bookname    VARCHAR2(20) NOT NULL,
publisher   VARCHAR2(20) UNIQUE,
price       NUMBER DEFAULT 10000 CHECK(price>1000),
PRIMARY KEY (bookid));

DESC newbook;

DROP TABLE newbook;

CREATE TABLE newcustomer(
custid NUMBER PRIMARY KEY,
name VARCHAR2(40),
address VARCHAR2(40),
phone VARCHAR2(30));

DESC newcustomer;


CREATE TABLE neworders(
orderid NUMBER,
custid NUMBER NOT NULL,
bookid NUMBER NOT NULL,
saleprice NUMBER,
orderdate DATE,
PRIMARY KEY(orderid),
FOREIGN KEY(custid) REFERENCES NewCustomer(custid) ON DELETE CASCADE);

DESC neworders;

CREATE TABLE newbook(
bookid NUMBER PRIMARY KEY,
bookname VARCHAR2(20) NOT NULL,
publisher VARCHAR2(20) UNIQUE,
price NUMBER DEFAULT 10000 CHECK(price>1000));

DESC newbook;
ALTER TABLE newbook ADD isbn VARCHAR2(15);

--[����_1004_1] newbook ���̺��� isbn �Ӽ��� �����ϼ���.
SELECT * FROM newbook;
ALTER TABLE newbook DROP COLUMN isbn;

--[����_1004_2] newbook ���̺��� �⺻Ű�� ������ �� �ٽ� bookid �Ӽ��� �⺻Ű�� �����ϼ���.
ALTER TABLE newbook DROP PRIMARY KEY;
ALTER TABLE newbook ADD PRIMARY KEY(bookid);

--[����_1004_3] newbook ���̺��� �����ϼ���
DROP TABLE newbook;

SELECT * FROM customer;
--Q. CUSTOMER ���̺��� �� ��ȣ�� 5�� ���� �ּҸ� "���ѹα� �λ�"���� ����
UPDATE customer
-- ����ǥ �ϳ��� �־�� ��
SET address = '���ѹα� �λ�' 
WHERE custid = 5;

--Q. CUSTOMER ���̺��� �ڼ��� ���� �ּҸ� �迬�� ���� �ּҷ� ����
UPDATE customer
SET address=(SELECT address FROM customer WHERE name='�迬��')
WHERE name='�ڼ���';

--Q. CUSTOMER ���̺��� ����ȣ�� 5�� ���� ������ �� ����� Ȯ��
DELETE FROM customer
WHERE custid=5;

