select * from employees;
select * from jobs;
select * from job_history;
select * from countries;
select * from locations;
select * from regions;
select * from departments;

-- 데이터 탐색적 분석
-- HR 데이터 -> 직원 관리, 국가 관리
-- 보너스 받고, 평균 연봉
-- 직무 별 평균 연봉 확인
-- 부서의 인원 수 -> 부서 별 규모 확인으로 중요 부서 파악
-- 근속연수 -> 회사의 안정성
-- 입사 연도 별 인원 수 -> 성장하는 회사인지 파악 가능

select count(*) from employees;
select MIN(hire_date), MAX(hire_date) from employees; 

-- 지역 + 부서
select d.department_id, d.department_name, l.location_id, l.country_id, c.country_name
from departments d, locations l, countries c
where l.country_id=c.country_id
and d.location_id=l.location_id;

-- 그룹 별 country 확인
select count(*) from countries
group by region_id;


-- Q. HR employees 테이블에서 이름, 연봉, 10% 인상된 연봉을 출력
select first_name||' '||last_name NAME, salary*12 연봉, trunc((salary*12)*1.1) "10% 인상"
from employees;

-- Q. HR employees 테이블에서 COMMISSION_PCT의 null값 갯수를 출력
select count(*) from employees
where commission_pct is null;
-- 전체 107 중 72가 null 30% 정도만 커미션 받음


--[과제_1006_2] hr 테이블들을 분석해서 전체 현황을 설명할 수 있는 요약 테이블을 작성하세요. 
-- ex) 부서별 평균 salary 순위


-- DCL
CREATE USER c##user01
identified by userpass;

select * from all_users;
drop user c##user01;


-- grant, revoke
CREATE USER c##user01
identified by userpass;
-- 권한 주기 -> 세션 생성 테이블 생성 권한
grant create session, create table to c##user01;
-- 권한 뺏음
revoke create session, create table from c##user01;

-- 사용자 암호 변경
alter user c##user01
identified by passuser;

-- 삭제 -> user01 관련된 모든 것 삭제 -> cascade
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
-- rollback 하니까 원래대로 돌아감(테이블만, 내용 X)
-- 롤백 -> commit으로 세이브 포인트 두고 그 지점으로 돌아감
rollback;
drop table users;
commit;

--autocommit 확인 및 설정
show autocommit;
set autocommit on;
set autocommit off;