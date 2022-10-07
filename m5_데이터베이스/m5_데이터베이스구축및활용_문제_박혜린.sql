������ ��� AI ���� �ַ�� ������ ��������

������� : �����ͺ��̽� ���� �� Ȱ��

- ���� : 22.10.07
- ���� : ������
- ���� : 80


�� HR TABLES(EMPLOYEES, DEPARTMENTS, COUNTRIES, JOB_HISSTORY, JOBS, LOCATIONS, REGIONS)�� Ȱ���Ͽ� ���� �������� �����ϼ���.
--Q1. HR EMPLOYEES ���̺��� �̸�, ����, 10% �λ�� ������ ����ϼ���.
--A. 
select * from employees;
SELECT first_name, salary*12 ����, (salary*12)*1.1 "10%�λ� ����"
FROM employees;

SELECT first_name, salary ����, salary*1.1 "10%�λ� ����"
FROM employees;
    
--Q2.  2005�� ��ݱ⿡ �Ի��� ����鸸 ���	
--A.        
SELECT * FROM EMPLOYEES;
SELECT hire_date
FROM employees
WHERE TO_CHAR(hire_date,'q') <= 2;

SELECT * FROM employees WHERE hire_date BETWEEN '05/01/01' AND '05/06/30';  

--Q3. ���� SA_MAN, IT_PROG, ST_MAN �� ����� ���
--A.
select * from employees;
SELECT job_id ����, last_name
FROM employees
WHERE job_id='SA_MAN' or job_id='IT_PROG' or job_id='ST_MAN';

--Q4. manager_id �� 101���� 103�� ����� ���
--A.   	
SELECT manager_id, last_name
FROM employees
WHERE manager_id >= 101 AND manager_id <= 103;

--Q5. EMPLOYEES ���̺��� LAST_NAME, HIRE_DATE �� �Ի����� 6���� �� ù ��° �������� ����ϼ���.
--A.
SELECT last_name, hire_date �Ի���, next_day(add_months(hire_date,6),'������') "6���� ��"
FROM employees;

--Q6. EMPLOYEES ���̺��� EMPLPYEE_ID, LAST_NAME, SALARY, HIRE_DATE �� �Ի��� �������� �����ϱ����� W_MONTH(�ټӿ���)�� ������ ����ؼ� ����ϼ���.(�ټӿ��� ���� ��������)
--A.
SELECT employee_id, last_name, salary, hire_date, trunc((sysdate-hire_date)/30) W_MONTH
FROM employees
ORDER BY w_month DESC;

--Q7. EMPLOYEES ���̺��� EMPLPYEE_ID, LAST_NAME, SALARY, HIRE_DATE �� �Ի��� �������� W_YEAR(�ټӳ��)�� ����ؼ� ����ϼ���.(�ټӳ�� ���� ��������)
--A.
SELECT employee_id, last_name, salary, hire_date, trunc((sysdate-hire_date)/365,0) W_YEAR
FROM employees
ORDER BY w_year DESC;

--Q8. EMPLOYEE_ID�� Ȧ���� ������ EMPLPYEE_ID�� LAST_NAME�� ����ϼ���.
--A. 
SELECT * FROM EMPLOYEES;
SELECT employee_id, last_name FROM employees
WHERE MOD(employee_id, 2) = 1
ORDER BY employee_id;


--Q9. EMPLOYEES ���̺��� EMPLPYEE_ID, LAST_NAME �� M_SALARY(����)�� ����ϼ���. �� ������ �Ҽ��� ��°�ڸ������� ǥ���ϼ���.
--A
SELECT employee_id, last_name, trunc(salary/12, 2) M_SALARY
FROM employees;


--Q10. EMPLOYEES ���̺��� EMPLPYEE_ID, LAST_NAME, SALARY, HIRE_DATE �� �Ի��� �������� �ټӳ���� ����ؼ� �Ʒ������� �߰��� �Ŀ� ����ϼ���.
--2001�� 1�� 1�� â���Ͽ� ������� 20�Ⱓ ��ǿ� ȸ��� ������  �ټӳ���� ���� 30 ������� ������  ��޿� ���� 1000���� BONUS�� ����.
--�������� ����.    
--A.
SELECT employee_id, last_name, salary, hire_date,
trunc(((to_date('20/12/31')-hire_date)/365)) W_YEAR,
(width_bucket(trunc((to_date('20/12/31')-hire_date)/365),0,20,30)) ���,
(width_bucket(trunc((to_date('20/12/31')-hire_date)/365),0,20,30))*1000 ���ʽ�
FROM employees
ORDER BY ���ʽ� DESC;

--Q11. EMPLOYEES ���̺��� commission_pct ��  Null�� ������  ����ϼ���.
--A.
SELECT COUNT(*) FROM employees 
WHERE commission_pct is null;

--Q12. EMPLOYEES ���̺��� deparment_id �� ���� ������ �����Ͽ�  POSITION�� '����'���� ����ϼ���.
--A.
SELECT *
FROM EMPLOYEES 
WHERE department_id is null;

SELECT last_name, department_id, NVL(TO_CHAR(department_id),'����') POSITION
FROM employees WHERE department_id is null;

--Q13. ����� 120���� ����� ���, �̸�, ����(job_id), ������(job_title)�� ���(join~on, where �� �����ϴ� �� ���� ��� ���)
--A.
--WHERE
SELECT e.employee_id, e.last_name, e.job_id ����, j.job_title ������
FROM employees e, jobs j
WHERE e.job_id=j.job_id
AND e.employee_id=120;
--JOIN~ON
SELECT e.employee_id, e.last_name, e.job_id ����, j.job_title ������
FROM employees e LEFT JOIN jobs j on e.job_id=j.job_id;

--Q14.  employees ���̺��� �̸��� FIRST_NAME�� LAST_NAME�� �ٿ��� 'NAME' �÷������� ����ϼ���.
--��) Steven King
--A. 
SELECT first_name||' '||last_name NAME
FROM employees;


--Q15. lmembers purprod ���̺�� ���� �ѱ��ž�, 2014 ���ž�, 2015 ���ž��� �ѹ��� ����ϼ���.
--A.
SELECT SUM(puramt) �ѱ��ž�, 
SUM(case when purdate <= '20141231' then puramt end) "2014 ���ž�", 
SUM(case when purdate > '20141231' and purdate <= '20151231' then puramt end) "2015 ���ž�"
FROM purprd;

--Q16. HR EMPLOYEES ���̺��� escape �ɼ��� ����Ͽ� �Ʒ��� ���� ��µǴ� SQL���� �ۼ��ϼ���.
--job_id Į������  _�� ���ϵ�ī�尡 �ƴ� ���ڷ� ����Ͽ� '_A'�� �����ϴ�  ��� ���� ���
--A.
SELECT job_id FROM EMPLOYEES
WHERE job_id LIKE '%#_A%' ESCAPE '#';


--Q17. HR EMPLOYEES ���̺��� SALARY, LAST_NAME ������ �ø����� �����Ͽ� ����ϼ���.
--A. 
SELECT salary, last_name
FROM employees
ORDER BY salary;

SELECT salary, last_name
FROM employees
ORDER BY last_name;
   
--Q18. Seo��� ����� �μ����� ����ϼ���.
--A.
SELECT * FROM departments;
SELECT * FROM employees
WHERE last_name='Seo';

SELECT e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id=d.department_id
AND e.last_name='Seo';

--Q19. LMEMBERS �����Ϳ��� ���� ���űݾ��� �հ踦 ���� CUSPUR ���̺��� ������ �� CUSTDEMO ���̺�� 
--����ȣ�� �������� �����Ͽ� ����ϼ���.
--A.
SELECT *
FROM curpur, demo
WHERE curpur.custno=demo.custno;


--Q20.PURPROD ���̺�� ���� �Ʒ� ������ �����ϼ���.
-- 2�Ⱓ ���űݾ��� ���� ������ �и��Ͽ� ����, ���޻纰�� ���ž��� ǥ���ϴ� AMT_14, AMT_15 ���̺� 2���� ���� (��³��� : ����ȣ, ���޻�, SUM(���űݾ�) ���űݾ�)
--AMT14�� AMT15 2�� ���̺��� ����ȣ�� ���޻縦 �������� FULL OUTER JOIN �����Ͽ� ������ AMT_YEAR_FOJ ���̺� ����
--14��� 15���� ���űݾ� ���̸� ǥ���ϴ� ���� �÷��� �߰��Ͽ� ���(��, ����ȣ, ���޻纰�� ���űݾ� �� ������ ���еǾ�� ��)
--A.


SELECT * FROM PURPROD
WHERE YEAR <2015;
DESC PURPROD;

CREATE TABLE AMT14
AS SELECT ����ȣ, ���޻�, SUM(���űݾ�) ���űݾ� 
FROM PURPROD
WHERE �������� < 20150101
GROUP BY ����ȣ, ���޻�
ORDER BY ����ȣ;

select * from amt14;

CREATE TABLE AMT15
AS SELECT ����ȣ, ���޻�, SUM(���űݾ�) ���űݾ� 
FROM PURPROD
WHERE �������� > 20141231
GROUP BY ����ȣ, ���޻�
ORDER BY ����ȣ;

select * from amt15;

--FULL OUTER JOIN ���̺� ����
CREATE TABLE AMT_YEAR_FOJ
AS SELECT A4.����ȣ, A4.���޻�, A4.���űݾ� ����14, A5.���űݾ� ����15
FROM AMT14 A4 FULL OUTER JOIN AMT15 A5
ON (A4.����ȣ=A5.����ȣ AND A4.���޻�=A5.���޻�);



--Q(BONUS). HR ���̺���� �м��ؼ� ��ü ��Ȳ�� ������ �� �ִ� ��� ���̺��� �ۼ��ϼ���. (�� : �μ��� ��� SALARY ����)
--A.


