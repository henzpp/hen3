SELECT ABS(-78), ABS(+78)
FROM dual;

SELECT ROUND(4.875,1)
FROM dual;

--Q. ���� ��� �ֹ� �ݾ��� ��� ������ �ݿø��� ���� ���ϼ���.
SELECT * FROM orders;

SELECT custid "����ȣ", ROUND(SUM(SALEPRICE)/COUNT(*),-2) "��ձݾ�"
FROM orders
GROUP BY custid;

--Q. �� �̸��� ��� �ֹ� �ݾ��� ��� ������ �ݿø��� ���� ���ϼ���
SELECT C.name, ROUND(avg(O.saleprice),-2)
FROM orders O, customer C
WHERE C.custid=O.custid
GROUP BY C.name;

--Q. ���� ���� '�߱�'�� ���Ե� ������ '��'�� ������ �� ���� ���, ������ ���
SELECT * FROM book;

SELECT bookid, REPLACE(bookname, '�߱�','��') bookname, publisher, price
FROM book;

--���ڼ�, ����Ʈ �� LENGTH
SELECT bookname ����, length(bookname) ���ڼ�, lengthb(bookname) AS ����Ʈ��
FROM book;

--������ �ֱ� INSERT
SELECT * FROM customer;
INSERT INTO customer VALUES(5, '�ڼ���', '���ѹα� ����', NULL);


--[����_1004_4] Q. customer ���̺��� ���� ���� ���� ����� �� ���̳� �Ǵ��� ���� �ο����� ���ϼ���.
SELECT * FROM customer;
SELECT SUBSTR(name, 1, 1) "��", COUNT(*) "�ο�"
FROM customer
GROUP BY SUBSTR(name,1,1);

SELECT * FROM orders;
--Q. �ֹ��Ϸκ��� 10�� �� ������ Ȯ���Ѵ�. �� �ֹ��� Ȯ�����ڸ� ���ϼ���.
SELECT orderid "�ֹ���ȣ", orderdate "�ֹ���", orderdate+10 "Ȯ��"
FROM orders;

--[����_1004_5] Q. 2020�� 7�� 7�Ͽ� �ֹ����� ������ �ֹ���ȣ, �ֹ���, ����ȣ, ������ȣ�� ��� ����ϼ���.
SELECT * FROM orders;
SELECT orderid �ֹ���ȣ, TO_CHAR(orderdate,'yyyy-mm-dd dy') �ֹ���, custid ����ȣ, bookid ������ȣ
FROM orders
WHERE orderdate=TO_DATE('20200707', 'yyyymmdd');

--���� ��¥
SELECT SYSDATE FROM dual;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'yyyy/mm/dd dy hh24:mi:ss') "SYSDATE_1"
FROM dual;

SELECT * FROM customer;
--Q. �̸�, ��ȭ��ȣ�� ���Ե� ������� ���̼���. ��, ��ȭ��ȣ�� ���� ���� '����ó ����'���� ǥ���Ͽ� ���
SELECT name �̸�, NVL(phone, '����ó ����') ��ȭ��ȣ
FROM customer;

--SELECT COALESCE(NULL,NULL,'third value', 'forth value'); ����° ���� Null�� �ƴ� ù��° ���̱� ������ ����° ���� ��ȯ
SELECT NAME �̸�, phone, COALESCE(PHONE, '����ó����') ��ȭ��ȣ
FROM customer;

SELECT ROWNUM ����, custid ����ȣ, name �̸�, phone ��ȭ��ȣ
FROM customer
WHERE ROWNUM <= 3;

SELECT * FROM orders;
--Q. ��� �ֹ��ݾ� ������ �ֹ��� ���ؼ� �ֹ���ȣ�� �ݾ��� ���
SELECT orderid, saleprice FROM orders
WHERE saleprice < (SELECT AVG(SALEPRICE) FROM orders);

--Q. �� ���� ��� �ֹ��ݾ׺��� ū �ݾ��� �ֹ� ������ ���ؼ� �ֹ���ȣ, ����ȣ, �ݾ��� ���
SELECT orderid �ֹ���ȣ, custid ����ȣ, saleprice �ݾ�
FROM orders o1
WHERE saleprice > (SELECT AVG(saleprice) FROM orders o2 WHERE O1.custid = o2.custid);


--[����_1004_6] ���ѹα��� �����ϴ� ������ �Ǹ��� ������ �� �Ǹž��� ���
SELECT * FROM customer, orders;
SELECT SUM(orders.saleprice) as TOTAL
FROM orders, customer
WHERE customer.custid = orders.custid
AND customer.address LIKE '���ѹα�%';

--[����_1004_7] 3�� ���� �ֹ��� ������ �ְ� �ݾ׺��� �� ��� ������ ������ �ֹ��� �ֹ���ȣ�� �ݾ��� ���
SELECT * FROM orders;


--[����_1004_8] ����ȣ�� 2 ������ ���� �Ǹž��� ���(��, ���̸��� ���� �Ǹž� ����)
SELECT cs.name, SUM(orders.saleprice)
FROM (SELECT custid, name 
FROM customer
WHERE custid<=2) cs, orders
WHERE cs.custid = orders.custid 
GROUP BY cs.name;

--[����_1004_9] lmembers �����͸� ������ �Ӽ�(����,����,��������) �����հ�(�ݱ⺰), ��ձ���(�ݱ⺰), ���ź�(�ݱ⺰)�� ���
SELECT * FROM demo;



