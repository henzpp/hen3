select * from employees;
select last_name, 'is a' job_id from employees;
select last_name ||'is a'||job_id as EXPLAIN from employees;

-- distinct
select distinct job_id from employees;

select * from employees where commission_pct is null;
select * from employees where commission_pct is not null;

-- Q. employees ���̺��� commission_pct�� null�� ������ ���
SELECT count(*) 
FROM employees 
where commission_pct is null;

-- Q. employees ���̺��� employee_id�� Ȧ���� �͸� ���
SELECT * from employees
where mod(employee_id, 2) = 1;

-- �ݿø�
select round(355.95555, 2) from dual;
--355 -> 400
select round(355.95555, -2) from dual;
-- �ݿø� X �ڸ�
select trunc(45.55551,1) from dual;

-- �Ҽ��� ��°¥�� ���� �ڸ�
select last_name, trunc(salary/12,2) ���� from employees;

-- width_bucket(������, �ּҰ�, �ִ밪, bucket ����)
select width_bucket(92, 0, 100, 10) from dual;
-- 0���� 100���� 50�������� ������ �� 38�� ��� ������ ���ϴ���?
select width_bucket(38, 0, 100, 50) from dual;

-- �빮��
select upper('Hello World') from dual;
-- �ҹ���
select lower('Hello World') from dual;

-- ��� �ȳ���
select last_name, salary from employees where last_name='king';
-- �� �ҹ��ڷ� �ٲ㼭 �˻�
select last_name, salary from employees where lower(last_name)='king';

select job_id length(job_id) from employees;
select substr('Hello World',3,3) from dual;
select substr('Hello World',-3,3) from dual;

-- ���ʿ� # ���̱� �� ���� �� 20
select lpad('Hello World',20,'#') from dual;
select rpad('Hello World',20,'#') from dual;

-- a ���ֱ�
select last_name, trim('A' from last_name) A���� from employees;
SELECT ltrim('aaaHello Worldaaa','a') from dual;
SELECT rtrim('aaaHello Worldaaa','a') from dual;
-- ���� ���ֱ�
SELECT trim('   Hello World    ') from dual;
SELECT ltrim('   Hello World    ') from dual;
SELECT rtrim('   Hello World   ') from dual;

select sysdate from dual;

select * from employees;
select last_name, trunc((sysdate-hire_date)/365,0) �ټӿ��� from employees;


--[����_1005_1] employees ���̺��� ä���Ͽ� 6������ �߰��� ��¥�� last_name�� ���� ��� 
select last_name, add_months(hire_date,6) "6���� �߰�"
from employees;

select last_name, hire_date from employees;
SELECT last_name, hire_date+180
FROM employees;

--[����_1005_2] �̹����� ������ ��ȯ�ϴ� �Լ��� ����Ͽ� ������ ���
select sysdate from dual;
select last_day(to_date(sysdate,'yyyy-mm-dd')) from dual;

--[����_1005_3] employees ���̺��� ä���ϰ� ����������� �ټӿ����� ���
select hire_date, trunc((sysdate-hire_date)/30,0) �ټӿ��� from employees;

--[����_1005_4] �Ի��� 6���� �� ù��° �������� last_name���� ���
select last_name, next_day(add_months(hire_date,6),'������') "6���� ��" from employees;

--[����_1005_5] job_id���� �����հ� ������� �ְ��� �������� ���, �� ��� ������ 5000�̻��� ��츸 �����Ͽ� ������������ ����
select * from employees;
--job id, sum(salary), avg(salary)>=5000, max(salary), min(salary) DESC
select job_id, sum(salary) �����հ�, avg(salary) �������, max(salary) �ְ���, min(salary) ��������
from employees
group by job_id
having avg(salary) >= 5000
order by count(*) DESC;

--[����_1005_6] �����ȣ(employee_id)�� 110�� ����� �μ����� ���
select employee_id, job_id from employees
where employee_id='110';

--[����_1005_7] ���(employee_id)�� 120���� ������ ���, �̸�, ����(job_id), ������(job_title)?? ���
select * from employees;
select e.employee_id ���, e.last_name �̸�, j.job_id ����, j.job_title ������ 
from employees e, jobs j
where employee_id='120';

--[����_1005_8] ���, �̸�, ���� ����ϼ���. ��, ������ �Ʒ� ���ؿ� ����
        --salary > 20000 then '��ǥ�̻�'
        --salary > 15000 then '�̻�' 
        --salary > 10000 then '����' 
        --salary > 5000 then '����' 
        --salary > 3000 then '�븮'
        --������ '���'
select employee_id ���, last_name �̸�, salary ���� from employees;

        
select employee_id ���, last_name �̸�,
    case when e.salary > 20000 then '��ǥ�̻�'
        when e.salary > 15000 then '�̻�'
        when e.salary > 10000 then '����'
        when e.salary > 5000 then '����'
        when e.salary > 3000 then '�븮'
        else '���'
    end as ����
from employees e;
            


--[����_1005_9] employees ���̺��� employee_id�� salary�� �����ؼ� employee_salary ���̺��� �����Ͽ� ���
create view employee_salary
as select employee_id, salary
from employees;
select * from employee_salary;

create table employee_salary_
as select employee_id, salary
from employees;
select * from employee_salary_;


--[����_1005_10] employee_salary ���̺� first_name, last_name �÷��� �߰��� �� name���� �����Ͽ� ���
create or replace view employee_salary
as select employee_id, salary, first_name||' '||last_name as name
from employees;
select * from employee_salary;

drop view employee_salary;

alter table employee_salary_ add first_name varchar(2);
alter table employee_salary_ add last_name varchar(2);

alter table employee_salary_ drop column first_name;
select * from employee_salary_;


--[����_1005_11] employee_salary ���̺��� employee_id�� �⺻Ű�� �����ϰ� constraint_name�� ES_PK�� ���� �� ���
-- table
ALTER TABLE EMPLOYEE_SALARY_ 
ADD CONSTRAINT ES_PK
PRIMARY KEY (EMPLOYEE_ID);

-- view�� disable �ٿ������!!
ALTER view EMPLOYEE_SALARY
ADD CONSTRAINT ES_PK_
PRIMARY KEY (EMPLOYEE_ID) disable;

--[����_1005_12] employee_salary ���̺��� employee_id���� constraint_name�� ���� �� ���� ���θ� Ȯ��
ALTER TABLE EMPLOYEE_SALARY_
DROP CONSTRAINT ES_PK;

ALTER view 

select *
from user_constraints
where table_name='employee_salary_';








