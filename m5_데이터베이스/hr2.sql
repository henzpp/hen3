select * from employees;
select * from jobs;
select * from job_history;
select * from countries;
select * from locations;
select * from regions;
select * from departments;

-- ������ Ž���� �м�
-- HR ������ -> ���� ����, ���� ����
-- ���ʽ� �ް�, ��� ����
-- ���� �� ��� ���� Ȯ��
-- �μ��� �ο� �� -> �μ� �� �Ը� Ȯ������ �߿� �μ� �ľ�
-- �ټӿ��� -> ȸ���� ������
-- �Ի� ���� �� �ο� �� -> �����ϴ� ȸ������ �ľ� ����

select count(*) from employees;
select MIN(hire_date), MAX(hire_date) from employees; 

-- ���� + �μ�
select d.department_id, d.department_name, l.location_id, l.country_id, c.country_name
from departments d, locations l, countries c
where l.country_id=c.country_id
and d.location_id=l.location_id;

-- �׷� �� country Ȯ��
select count(*) from countries
group by region_id;


-- Q. HR employees ���̺��� �̸�, ����, 10% �λ�� ������ ���
select first_name||' '||last_name NAME, salary*12 ����, trunc((salary*12)*1.1) "10% �λ�"
from employees;

-- Q. HR employees ���̺��� COMMISSION_PCT�� null�� ������ ���
select count(*) from employees
where commission_pct is null;
-- ��ü 107 �� 72�� null 30% ������ Ŀ�̼� ����


--[����_1006_2] hr ���̺���� �м��ؼ� ��ü ��Ȳ�� ������ �� �ִ� ��� ���̺��� �ۼ��ϼ���. 
-- ex) �μ��� ��� salary ����


-- DCL
CREATE USER c##user01
identified by userpass;

select * from all_users;
drop user c##user01;


-- grant, revoke
CREATE USER c##user01
identified by userpass;
-- ���� �ֱ� -> ���� ���� ���̺� ���� ����
grant create session, create table to c##user01;
-- ���� ����
revoke create session, create table from c##user01;

-- ����� ��ȣ ����
alter user c##user01
identified by passuser;

-- ���� -> user01 ���õ� ��� �� ���� -> cascade
drop user c##user01 cascade;

create table users(
id number,
name varchar2(20),
age number);

insert into users values(1,'hodu park',7);
insert into users values(2,'hoduru park',7);
select * from users;

delete from users where id=1;
select * from users;
-- rollback �ϴϱ� ������� ���ư�(���̺�, ���� X)
-- �ѹ� -> commit���� ���̺� ����Ʈ �ΰ� �� �������� ���ư�
rollback;
drop table users;
commit;

--autocommit Ȯ�� �� ����
show autocommit;
set autocommit on;
set autocommit off;