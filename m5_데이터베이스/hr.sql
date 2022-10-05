select * from employees;
select last_name, 'is a' job_id from employees;
select last_name ||'is a'||job_id as EXPLAIN from employees;

-- distinct
select distinct job_id from employees;

select * from employees where commission_pct is null;
select * from employees where commission_pct is not null;

-- Q. employees 테이블에서 commission_pct의 null값 갯수를 출력
SELECT count(*) 
FROM employees 
where commission_pct is null;

-- Q. employees 테이블에서 employee_id가 홀수인 것만 출력
SELECT * from employees
where mod(employee_id, 2) = 1;

-- 반올림
select round(355.95555, 2) from dual;
--355 -> 400
select round(355.95555, -2) from dual;
-- 반올림 X 자름
select trunc(45.55551,1) from dual;

-- 소수점 둘째짜리 까지 자름
select last_name, trunc(salary/12,2) 월급 from employees;

-- width_bucket(지정값, 최소값, 최대값, bucket 갯수)
select width_bucket(92, 0, 100, 10) from dual;
-- 0에서 100까지 50구간으로 나눴을 때 38은 어느 구간에 속하는지?
select width_bucket(38, 0, 100, 50) from dual;

-- 대문자
select upper('Hello World') from dual;
-- 소문자
select lower('Hello World') from dual;

-- 요건 안나옴
select last_name, salary from employees where last_name='king';
-- 다 소문자로 바꿔서 검색
select last_name, salary from employees where lower(last_name)='king';

select job_id length(job_id) from employees;
select substr('Hello World',3,3) from dual;
select substr('Hello World',-3,3) from dual;

-- 왼쪽에 # 붙이기 총 글자 수 20
select lpad('Hello World',20,'#') from dual;
select rpad('Hello World',20,'#') from dual;

-- a 없애기
select last_name, trim('A' from last_name) A삭제 from employees;
SELECT ltrim('aaaHello Worldaaa','a') from dual;
SELECT rtrim('aaaHello Worldaaa','a') from dual;
-- 공백 없애기
SELECT trim('   Hello World    ') from dual;
SELECT ltrim('   Hello World    ') from dual;
SELECT rtrim('   Hello World   ') from dual;

select sysdate from dual;

select * from employees;
select last_name, trunc((sysdate-hire_date)/365,0) 근속연수 from employees;


--[과제_1005_1] employees 테이블에서 채용일에 6개월을 추가한 날짜를 last_name과 같이 출력 
select last_name, add_months(hire_date,6) "6개월 추가"
from employees;

select last_name, hire_date from employees;
SELECT last_name, hire_date+180
FROM employees;

--[과제_1005_2] 이번달의 말일을 반환하는 함수를 사용하여 말일을 출력
select sysdate from dual;
select last_day(to_date(sysdate,'yyyy-mm-dd')) from dual;

--[과제_1005_3] employees 테이블에서 채용일과 현재시점간의 근속월수를 출력
select hire_date, trunc((sysdate-hire_date)/30,0) 근속월수 from employees;

--[과제_1005_4] 입사일 6개월 후 첫번째 월요일을 last_name별로 출력
select last_name, next_day(add_months(hire_date,6),'월요일') "6개월 후" from employees;

--[과제_1005_5] job_id별로 연봉합계 연봉평균 최고연봉 최저연봉 출력, 단 평균 연봉이 5000이상인 경우만 포함하여 내림차순으로 정렬
select * from employees;
--job id, sum(salary), avg(salary)>=5000, max(salary), min(salary) DESC
select job_id, sum(salary) 연봉합계, avg(salary) 연봉평균, max(salary) 최고연봉, min(salary) 최저연봉
from employees
group by job_id
having avg(salary) >= 5000
order by count(*) DESC;

--[과제_1005_6] 사원번호(employee_id)가 110인 사원의 부서명을 출력
select employee_id, job_id from employees
where employee_id='110';

--[과제_1005_7] 사번(employee_id)가 120번인 직원의 사번, 이름, 업무(job_id), 업무명(job_title)?? 출력
select * from employees;
select e.employee_id 사번, e.last_name 이름, j.job_id 업무, j.job_title 업무명 
from employees e, jobs j
where employee_id='120';

--[과제_1005_8] 사번, 이름, 직급 출력하세요. 단, 직급은 아래 기준에 의함
        --salary > 20000 then '대표이사'
        --salary > 15000 then '이사' 
        --salary > 10000 then '부장' 
        --salary > 5000 then '과장' 
        --salary > 3000 then '대리'
        --나머지 '사원'
select employee_id 사번, last_name 이름, salary 직급 from employees;

        
select employee_id 사번, last_name 이름,
    case when e.salary > 20000 then '대표이사'
        when e.salary > 15000 then '이사'
        when e.salary > 10000 then '부장'
        when e.salary > 5000 then '과장'
        when e.salary > 3000 then '대리'
        else '사원'
    end as 직급
from employees e;
            


--[과제_1005_9] employees 테이블에서 employee_id와 salary만 추출해서 employee_salary 테이블을 생성하여 출력
create view employee_salary
as select employee_id, salary
from employees;
select * from employee_salary;

create table employee_salary_
as select employee_id, salary
from employees;
select * from employee_salary_;


--[과제_1005_10] employee_salary 테이블에 first_name, last_name 컬럼을 추가한 후 name으로 변경하여 출력
create or replace view employee_salary
as select employee_id, salary, first_name||' '||last_name as name
from employees;
select * from employee_salary;

drop view employee_salary;

alter table employee_salary_ add first_name varchar(2);
alter table employee_salary_ add last_name varchar(2);

alter table employee_salary_ drop column first_name;
select * from employee_salary_;


--[과제_1005_11] employee_salary 테이블의 employee_id에 기본키를 적용하고 constraint_name을 ES_PK로 지정 후 출력
-- table
ALTER TABLE EMPLOYEE_SALARY_ 
ADD CONSTRAINT ES_PK
PRIMARY KEY (EMPLOYEE_ID);

-- view는 disable 붙여줘야함!!
ALTER view EMPLOYEE_SALARY
ADD CONSTRAINT ES_PK_
PRIMARY KEY (EMPLOYEE_ID) disable;

--[과제_1005_12] employee_salary 테이블의 employee_id에서 constraint_name을 삭제 후 삭제 여부를 확인
ALTER TABLE EMPLOYEE_SALARY_
DROP CONSTRAINT ES_PK;

ALTER view 

select *
from user_constraints
where table_name='employee_salary_';








