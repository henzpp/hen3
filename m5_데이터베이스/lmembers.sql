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

--������ �Ӽ�(����, ����, ��������)
SELECT custno ����ȣ, gender ����, age ����, area ��������
FROM demo
ORDER BY custno;


--����+���� �׷�, ī��Ʈ
SELECT gender ����, age ����, COUNT(age) ī��Ʈ
FROM demo
GROUP BY gender, age
ORDER BY gender;


--�����հ�(�⵵��), ��ձ���(�⵵��), ���ź�(�⵵��)
SELECT SUBSTR(purdate,1,4) �⵵��, SUM(puramt) �����հ�, ROUND(AVG(puramt),0) ��ձ���, COUNT(puramt) ���ź�
FROM purprd
GROUP BY SUBSTR(purdate,1,4)
ORDER BY SUBSTR(purdate,1,4);


--�����հ�(����), ��ձ���(����), ���ź�(����)
SELECT SUBSTR(purdate,1,6) ����, SUM(puramt) �����հ�, ROUND(AVG(puramt),0) ��ձ���, COUNT(puramt) ���ź�
FROM purprd
GROUP BY SUBSTR(purdate,1,6)
ORDER BY SUBSTR(purdate,1,6);


--�����հ�(�б⺰), ��ձ���(�б⺰), ���ź�(�б⺰)
SELECT SUBSTR(purdate,1,4) �⵵, CEIL(SUBSTR(purdate,5,2)/3) �б�, SUM(puramt) �����հ�, ROUND(AVG(puramt),0) ��ձ���, COUNT(puramt) ���ź�
FROM purprd
GROUP BY SUBSTR(purdate,1,4), CEIL(SUBSTR(purdate,5,2)/3)
ORDER BY SUBSTR(purdate,1,4), CEIL(SUBSTR(purdate,5,2)/3);


--�����հ�(�ݱ⺰), ��ձ���(�ݱ⺰), ���ź�(�ݱ⺰)
SELECT SUBSTR(purdate,1,4) �⵵, CEIL(SUBSTR(purdate,5,2)/6) �б�, SUM(puramt) �����հ�, ROUND(AVG(puramt),0) ��ձ���, COUNT(puramt) ���ź�
FROM purprd
GROUP BY SUBSTR(purdate,1,4), CEIL(SUBSTR(purdate,5,2)/6)
ORDER BY SUBSTR(purdate,1,4), CEIL(SUBSTR(purdate,5,2)/6);


--ä��+�̿�Ƚ��
SELECT asso ���޻�, SUM(freq) "�̿�Ƚ�� ��"
FROM channel
GROUP BY asso
ORDER BY SUM(freq) DESC;


--���δ�Ʈ : ���� ���� �̿��� ���޻� ��ȸ
SELECT asso, COUNT(*)
FROM prodcl
GROUP BY asso
ORDER BY COUNT(*) DESC;


--����� : ���Լ��� ���� �� ������ ����
SELECT mname,joinmonth,  COUNT(*)
FROM member
GROUP BY mname,joinmonth
ORDER BY COUNT(*) DESC;


--����� : ���Լ��� ���� �� ������ ����
SELECT mname,  COUNT(*)
FROM member
GROUP BY mname
ORDER BY mname,COUNT(*) DESC;


-- ���޻翡 ���� ���� ��ǰ ������
SELECT COUNT(asso) ���޻�, SUBSTR(purdate,1,6) ����, SUM(puramt) �����հ�, ROUND(AVG(puramt),0) "��� ����", COUNT(BGROUP) ��з�, COUNT(MGROUP) �ߺз�, COUNT(SGROUP) �Һз�
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
SELECT SUBSTR(purprd.purdate,1,6) ����, purprd.asso ���޻�, prodcl.mcl �ߺз���, prodcl.scl �Һз���
FROM prodcl, purprd
WHERE prodcl.asso=purprd.asso 
AND TO_CHAR(TO_DATE(purprd.purdate),'yyyymm') ='201401';

-- 201402
SELECT SUBSTR(purprd.purdate,1,6) ����, purprd.asso ���޻�, prodcl.mcl �ߺз���, prodcl.scl �Һз���
FROM prodcl, purprd
WHERE prodcl.asso=purprd.asso 
AND TO_CHAR(TO_DATE(purprd.purdate),'yyyymm') ='201402'; 

--201403
SELECT SUBSTR(purprd.purdate,1,6) ����, purprd.asso ���޻�, prodcl.mcl �ߺз���, prodcl.scl �Һз���
FROM prodcl, purprd
WHERE prodcl.asso=purprd.asso 
AND TO_CHAR(TO_DATE(purprd.purdate),'yyyymm') ='201403';

--201404
SELECT SUBSTR(purprd.purdate,1,6) ����, purprd.asso ���޻�, prodcl.mcl �ߺз���, prodcl.scl �Һз���
FROM prodcl, purprd
WHERE prodcl.asso=purprd.asso 
AND TO_CHAR(TO_DATE(purprd.purdate),'yyyymm') ='201404';

-- 201405
SELECT SUBSTR(purprd.purdate,1,6) ����, purprd.asso ���޻�, prodcl.mcl �ߺз���, prodcl.scl �Һз���
FROM prodcl, purprd
WHERE prodcl.asso=purprd.asso 
AND TO_CHAR(TO_DATE(purprd.purdate),'yyyymm') ='201405';

--201406
SELECT SUBSTR(purprd.purdate,1,6) ����, purprd.asso ���޻�, prodcl.mcl �ߺз���, prodcl.scl �Һз���
FROM prodcl, purprd
WHERE prodcl.asso=purprd.asso 
AND TO_CHAR(TO_DATE(purprd.purdate),'yyyymm') ='201406';


-- �ߺз��� count
SELECT COUNT(mcl) AS cnt, mcl �ߺз���
FROM prodcl
GROUP BY mcl
ORDER BY cnt DESC;

-- 
SELECT COUNT(mcl), mcl
FROM prodcl, purprd
WHERE prodcl.asso = purprd.asso;



-- ä�ο� ���� ���� ��ǰ ������

-- purprd ���޻�, channel ���޻� �ٸ�. ��� �ٸ���?
SELECT  purprd.asso �������޻�, channel.asso ä�����޻�, channel.custno ����ȣ, channel.freq �̿�Ƚ��
FROM channel, purprd
WHERE channel.custno=purprd.custno;

-- ����
-- 201501
SELECT SUBSTR(purprd.purdate,1,6) ����, channel.asso ä�����޻�, channel.custno ����ȣ, channel.freq �̿�Ƚ��
FROM channel, purprd
WHERE channel.custno=purprd.custno
AND TO_CHAR(TO_DATE(purprd.purdate),'yyyymm') ='201501';

SELECT custno, COUNT(custno)
FROM channel
GROUP BY custno;






SELECT * FROM channel;
SELECT * FROM competitor;
SELECT * FROM purprd;
