--[����_1004_9] lmembers �����͸� ������ �Ӽ�(����,����,��������) �����հ�(�ݱ⺰), ��ձ���(�ݱ⺰), ���ź�(�ݱ⺰)�� ���
SELECT * FROM demo;
SELECT * FROM purprd;

--demo(gender,age,area) | purprd(puramt) | purprd(puramt)-AVG | purprd(purtime)

--���� �Ӽ�
SELECT demo.gender, demo.age, demo.area
FROM demo;


SELECT * FROM purprd;
--�����հ�(�б⺰), ��ձ���(�б⺰), ���ź�(�б⺰)
SELECT SUBSTR(purdate,1,4) �⵵, CEIL(SUBSTR(purdate,5,2)/3) �б�, SUM(puramt) �����հ�, ROUND(AVG(puramt),1) ��ձ���, COUNT(puramt) ���ź�
FROM purprd
GROUP BY SUBSTR(purdate,1,4), CEIL(SUBSTR(purdate,5,2)/3)
ORDER BY SUBSTR(purdate,1,4), CEIL(SUBSTR(purdate,5,2)/3);

--�����հ�(�ݱ⺰), ��ձ���(�ݱ⺰), ���ź�(�ݱ⺰)
SELECT SUBSTR(purdate,1,4) �⵵, CEIL(SUBSTR(purdate,5,2)/6) �б�, SUM(puramt) �����հ�, ROUND(AVG(puramt),1) ��ձ���, COUNT(puramt) ���ź�
FROM purprd
GROUP BY SUBSTR(purdate,1,4), CEIL(SUBSTR(purdate,5,2)/6)
ORDER BY SUBSTR(purdate,1,4), CEIL(SUBSTR(purdate,5,2)/6);

---------------------------------------------------------------------------
SELECT COUNT(*) FROM PURPRD;
select sum(puramt), round(avg(puramt),0) from purprd;

--Q. lmembers purprd ���̺�� ���� �ѱ��ž�, 2014 ���ž�, 2015 ���ž��� �ѹ��� ���
SELECT (SELECT SUM(P1.PURAMT) FROM PURPRD P1) AS AMT,
(SELECT SUM(P2.PURAMT) FROM PURPRD P2 WHERE P2.PURDATE < 20150101) AS AMT_2014,
(SELECT SUM(P3.PURAMT) FROM PURPRD P3 WHERE P3.PURDATE > 20141231) AS AMT_2015
FROM DUAL;

select sum(puramt) �ѱ��ž�, 
sum(case when purdate <= '20141231' then puramt end) "2014 ���ž�", 
sum(case when purdate > '20141231' and purdate <= '20151231' then puramt end) "2015 ���ž�"
from purprd;
-- 2014 ��� 2015 ���� ���� ���������, ���÷��̼� �� ���� ��·��� �ݿ��Ͽ� üũ�ؾ� ��
-- ���⿡ ������ �ִ� ���� ã�� 


-- Q. lmembers �����Ϳ��� ���� ���� �ݾ��� �հ踦 ���� cuspur ���̺��� ������ �� demo ���̺�� ����ȣ(custno)�� �������� �����Ͽ� ���
CREATE TABLE CURPUR
AS SELECT custno, sum(puramt) puramt_sum
from purprd
group by custno
order by custno;

select d.* ,c.puramt_sum
from demo d, curpur c
where d.custno=c.custno
order by d.custno;

-- [����_1006_1] purprd �����ͷκ��� �Ʒ� ������ �����ϼ���.
-- 2�Ⱓ ���űݾ��� ���� ������ �и��Ͽ� ����, ���޻纰�� ���ž��� ǥ���ϴ� AMT_14, AMT_15 ���̺� 2���� ���� (��³��� : ����ȣ, ���޻�, SUM(���űݾ�), ���űݾ�)
SELECT * FROM PURPRD;
CREATE TABLE AMT_14
AS SELECT custno ����ȣ, COUNT(asso) ���޻�, SUM(puramt) ���ž�
FROM purprd
GROUP BY custno
ORDER BY CUSTNO;

SELECT * FROM AMT_14;
DROP TABLE AMT_14;

-- AMT_14�� AMT_15 2�� ���̺��� ����ȣ�� ���޻縦 �������� FULL OUTER JOIN �����Ͽ� ������ AMT_YEAR_FOJ ���̺� ����


-- 14��� 15���� ���űݾ� ���̸� ǥ���ϴ� ���� �÷��� �߰��Ͽ� ���(��, ����ȣ, ���޻纰�� ���űݾ� �� ������ ���еǾ�� ��)


