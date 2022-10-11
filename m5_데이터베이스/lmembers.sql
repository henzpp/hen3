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
AND TO_CHAR(TO_DATE(purprd.purdate),'yyyymm') ='201406'
AND purprd.asso = 'B';
-- A ��ȭ��
-- B ��Ʈ - �¶���?? ���� �پ� -> ���̸�Ʈ ���?
-- C ����
-- D �ӽ�

SELECT * FROM CHANNEL;

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

--���з����� ���ϱ�
SELECT RNO,CUSTNO,PURDATE,SUM(PURAMT)
FROM purprd
GROUP BY RNO,CUSTNO,PURDATE
ORDER BY CUSTNO ASC, PURDATE DESC;

SELECT CUSTNO ����ȣ, SUBSTR(purdate,1,6) ����, SUM(puramt) �����հ�, ROUND(AVG(puramt),0) ��ձ���, COUNT(puramt) ���ź�
FROM purprd
GROUP BY CUSTNO,SUBSTR(purdate,1,6)
ORDER BY CUSTNO,SUBSTR(purdate,1,6);

-- �󵵼� ���� : �����ϰ� ������ �漺 ��(�ּ� 2�޿� �ѹ�) / �󵵼��� �پ�� �� / �󵵼��� �þ ��
-- �����հ� ���� : �� / �߰� / ����

--���� ���ź�
SELECT CUSTNO ����ȣ, SUM(puramt) �����հ�, ROUND(AVG(puramt),0) ��ձ���, COUNT(puramt) ���ź�
FROM purprd
GROUP BY CUSTNO
ORDER BY CUSTNO;

--���� ��� ���� �ܰ� : �����հ� / ���ź�
SELECT CUSTNO ����ȣ, SUM(puramt) �����հ�, COUNT(puramt) ���ź�, ROUND((SUM(puramt)/COUNT(puramt)),0) ��ձ��Ŵܰ�
FROM purprd
GROUP BY CUSTNO
ORDER BY CUSTNO;

--���� ù ������
SELECT CUSTNO ����ȣ, TO_DATE(MIN(purdate)) ù������
FROM purprd
GROUP BY CUSTNO
ORDER BY CUSTNO;

--���� ������ ������
SELECT CUSTNO ����ȣ, TO_DATE(MAX(purdate)) ������������
FROM purprd
GROUP BY CUSTNO
ORDER BY CUSTNO;

--CLTV : ��� ���� �ܰ� * ���� �� * ��� ���� �Ⱓ
SELECT CUSTNO ����ȣ, ROUND((SUM(puramt)/COUNT(puramt)),0) ��ձ��Ŵܰ�, COUNT(puramt) ���ź�, TO_DATE(MAX((purdate)))-TO_DATE(MIN((purdate))) ��ӱ��űⰣ,
       (ROUND((SUM(puramt)/COUNT(puramt)),0) * COUNT(puramt) * ((TO_DATE(MAX(purdate)))-(TO_DATE(MIN(purdate))))) CLTV
FROM purprd
GROUP BY CUSTNO
ORDER BY CLTV DESC;

--VW_CLTV TABLE ����
CREATE VIEW VW_CLTV
AS SELECT CUSTNO ����ȣ, ROUND((SUM(puramt)/COUNT(puramt)),0) ��ձ��Ŵܰ�, COUNT(puramt) ���ź�, TO_DATE(MAX((purdate)))-TO_DATE(MIN((purdate))) ��ӱ��űⰣ,
       (ROUND((SUM(puramt)/COUNT(puramt)),0) * COUNT(puramt) * ((TO_DATE(MAX(purdate)))-(TO_DATE(MIN(purdate))))) CLTV
FROM purprd
GROUP BY CUSTNO
ORDER BY CLTV DESC;

SELECT * FROM VW_CLTV;

--CLTV RANK ���ϱ�
SELECT ����ȣ, ��ձ��Ŵܰ�, ���ź�, ��ӱ��űⰣ,CLTV,
       RANK() OVER (ORDER BY CLTV DESC) as CLTV_RANK
FROM VW_CLTV
ORDER BY CLTV_RANK;


SELECT * FROM channel;
SELECT * FROM competitor;
SELECT * FROM purprd;
SELECT * FROM PRODCL;

SELECT CHANNEL.CUSTNO, CHNNEL.ASSO, PRODCL.ASSO, PRODCL.MCL
FROM CHANNEL, PRODCL,PURPRD
WHERE CHANNEL.CUSTNO=PURPRD.CUSTNO
AND PURPRD.ASSO=PRODCL.ASSO;
