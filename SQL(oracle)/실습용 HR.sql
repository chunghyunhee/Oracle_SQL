/* express 18g에서 alter user hr로 지정하기 위해 스키마 샘플을 다운했고, 
employees 테이블을 사용하여 실습했다 */

--2장. where절을 이용한 데이터 검색
select * from tab;

-- employees table에서 모든 열을 조회하는 방법
select *  --출력하고자 하는 열
from employees; --선택하는 tabel

--원하는 열만 조회하기
select employee_id, first_name, last_name --출력하는열
from employees; --참조하는 테이블

--employees 테이블에서 원하는 열을 출력하고 employee_id를 기준으로 내림차순 정렬
select employee_id, first_name, last_name --선택하는 열
from employees --참조하는 테이블
order by employee_id desc; --정렬방법

--중복되는 열 삭제
select job_id
from employees; --실제중복확인

select distinct job_id --중복행삭제
from employees; 

--주어진 table에 대해 별칭지정
select employee_id as 사원번호, first_name as 이름, last_name as 성
from employees;

--데이터연결
select employee_id, first_name||last_name --두 열을 합치는 경우
from employees;

select employee_id, first_name||' '||last_name, email||'@'||'company.com' --문자열 붙인다
from employees;

--산술연산자
select employee_id, salary, salary+500, salary-100, (salary*1.1)/2
from employees;

--employees에서 사원번호, 급여, 추가급여,인하급여, 조정급여를 출력
select employee_id as 사원번호, 
    salary as 급여,
    salary+500 as 추가급여,
    salary-100 as 인하급여,
    (salary*1.1)/2 as 조정급여
from employees;

--조건절 where지정
--비교연산자, SQL연산자, 논리연산자 모두 사용가능

--비교연산자
select *
from employees --참조할 테이블
where employee_id=100; --조건
--employees에서 fist_name="david"인 직원을 검색하는 경우
select *
from employees
where first_name='David';
--employees 테이블에서 employee_id가 105이상인 직원의 정보
select *
from employees
where employee_id >= 105;

--SQL연산자 : 조회조건의 확장
--employee테이블에서 salary가 10000이상이고 20000이하인 직원의 정보를 출력한다
select *
from employees
where salary between 10000 and 20000;
--list 연산자는 조회하고자 하는 데이터가 여러개인 경우에 사용한다, 하나라도 속하면 출력한다(조건식의 목록)
select *
from employees
where salary in (10000,17000, 24000);
--like연산자 조회조건값이 명확하지 않을 때 사용
--employees테이블에서 job_id값이 AD를 포함하는 모든(%) 데이터를 조회하시오
select *
from employees
where job_id like 'AD%'; --맨 앞에 AD문자를 가지면서 그 뒤로는 모든 문자(%)를 포함하는 경우를 출력
select *
from employees
where first_name like 'Le%';
select *
from employees
where first_name like '%in';
--employees테이블에서 AD를 포함하면서 AD뒤에 따라오는 문자열이 3자리인 데이터 값을 가지는 직원의 정보를 조회(AD값+3자리)
select *
from employees
where job_id like 'AD___'; 
--is null연산자 : 결손데이터의 확인
select *
from employees
where manager_id is NULL;

--논리연산자
--salary가 4000을 초과하면서 job_id가 IT_PROG인 데이터를 검색한다. 
select *
from employees
where salary>4000 
AND job_id='IT_PROG';
select *
from employees
where salary>4000
AND job_id='IT_PROG'
OR job_id='FI_ACCOUNT';

--연산자 예제 실습
--1. <>연산자를 사용하여 employee 테이블에서 employee_id가 105가 아닌 직원을 조회한다. 
select *
from employees
where employee_id <> 105;
--2. manager_id가 null이 아닌 직원만을 검색한다. 
select *
from employees
where manager_id is not null;


--3장. 함수
--단일행함수 : 데이터값을 하나씩 계산하고 조작하기
--문자타입함수
--employees에서 last_name을 소문자와 대문자로 각각 출력하고 email의 첫문자는 대문자로 출력한다. 
select last_name,
    lower(last_name) LOWER적용,
    upper(last_name) UPPER적용,
    email,
    initcap(email) INITCAP적용
from employees;
--substr
--employees테이블에서 job_id데이터의 첫째자리부터 두 개의 문자를 출력한다. 
select job_id, substr(job_id, 1, 2) 적용결과
from employees;
--replace
--employees 테이블에서 job_id문자열 값이 account이면 ACCNT로 출력한다
select job_id, replace(job_id, 'ACCOUNT', 'ACCNT') 적용결과
from employees;
--LPAD, RPAD : 특정문자로 자릿수 채우기
--employees테이블에서 first_name에 대해 12자리의 문자열을 만들되 first_name가 12자리보다 작으면 왼쪽부터 *를 채운다
select first_name, LPAD(first_name, 12, '*') 적용결과
from employees;
select first_name, RPAD(first_name, 12, '*') 적용결과
from employees;
--LTRIM, RTRIM : 특정문자의 삭제
--employees테이블에서 job_id의 데이터에 대해 왼쪽에서 'F'를 만나면 삭제 오른쪽에서 'T'를 만나면 삭제
select job_id,
    LTRIM(job_id, 'F') LTRIM적용결과,
    RTRIM(job_id, 'T') RTRIM적용결과
from employees;
--TRIM : 공백의 제거(문자열 중간을 제외한 공백의 제거)
select 'start'||TRIM('    - space -    ')||'end' 제거된_공백
from dual;

--숫자타입함수
---employees 테이블에서 salary를 30일로 나눈후 나눈 값의 소숫점 첫째자리, 둘째자리까지 반올림한 값을 구하세요
select salary,
    salary/30 일급,
    ROUND(salary/30,1) 적용결과1,
    ROUND(salary/30, 2) 적용결과2
from employees;
---employees테이블에서 department_id가 100인 직원에 대해 오늘 날짜, hire_date사이의 개월 수를 출력하라
select sysdate, hire_date, months_between(sysdate, hire_date) 적용결과
from employees
where department_id=100;
---employees테이블에서 employee_id가 100과 106인 사이의 직원의 hire_date에 3개월을 더한 값 hire_date에 3개월을 뺀 값을 출력
select hire_date,
    add_months(hire_date, 3) 더하기_적용결과,
    add_months(hire_date, -3) 빼기_적용결과
from employees
where employee_id between 100 and 106;
---employee_id가 100과 106사이인 직원의 hire_date에서 가장 가까운 금요일의 날짜가 언제인지 문자로 지정출력, 숫자로도 출력
select hire_date,
    next_day(hire_date, '금요일') 적용결과_문자지정,
    next_day(hire_date, 6) 적용결과_숫자지정
from employees
where employee_id between 100 and 106;
---employees테이블에서 employee_id가 100과 106사이인 직원의 hire_date를 기준으로 해당 월의 마지막 날짜를 출력하라
select hire_date,
    last_day(hire_date) 적용결과
from employees
where employee_id between 100 and 106;
---employees테이블에서 employee_id가 100이상 106사이인 직원의 hire_date에 대해 월기준 반올림, 연기준 반올림, 월기준 절삭 등을 적용
select hire_date,
    round(hire_date, 'MONTH') 적용결과_round_m,
    round(hire_date, 'YEAR') 적용결과_round_y,
    trunc(hire_date, 'MONTH') 적용결과_trunc_m,
    trunc(hire_date, 'YEAR') 적용결과_trunc_y
from employees
where employee_id between 100 and 106;

---데이터타입변환
---자동데이터타입변환
select 1+'2'
from dual;
---수동데이터타입변환
---날짜 형식의 변환
select to_char(sysdate, 'YY'),
    to_char(sysdate, 'YYYY'),
    to_char(sysdate, 'MM'),
    to_char(sysdate, 'MON'),
    to_char(sysdate, 'YYYYMMDD') 응용적용1,
    to_char( to_date('20171008'), 'YYYYMMDD') 응용적용2
from dual;
---시간 형식 지정
select to_char(sysdate, 'HH:MI:SS PM') 시간형식,
    to_char(sysdate, 'YYYY/MM/DD HH:MI:SS PM') 날짜와시간조합
from dual;
---기타형식요소를 활용하여 날짜와 시간데이터를 출력
select to_char(sysdate, 'HH-MI-SS PM') 시간형식,
    to_char(sysdate, ' "날짜:", YYYY/MM/DD "시각:" HH:MI:SS PM') 날짜와시각표현
from dual;

--숫자형식 변환하기 
select to_number('123')
from dual;
select to_date('20171007', 'YYMMDD')
from dual;

---일반함수
select *
from employees
order by commission_pct;
---employees테이블엣 salary에서 commistion_pct를 곱하되 commision_pct가 null일 때는 1로 치환하여 곱한 결과를 출력한다. 
select salary*NVL(commission_pct, 1)
from employees
order by commission_pct;
---데이터값이 정확히 맞거나 틀리는 경우를 확인한다.  decode함수 
select first_name,
    last_name,
    department_id,
    salary 원래급여,
    decode(department_id, 60, salary*1.1, salary) 조정된급여,
    decode(department_id, 60, '10%인상', '미인상') 인상여부
from employees;
---복잡한 조건문의 실행 case함수
select employee_id, first_name, last_name, salary,
    case
        salary >= 9000 then '상위급여'
        salary between 6000 and 8999 then '중위급여'
        else '하위급여'
    end as '급여등급'
from employees
where job_id='IT_PROG';
---salary가 높은 순서대로 순위를 매기는 경우
select employee_id, 
    salary,
    rank() over(order by salary desc) rank_급여,
    dense_rank() over(order by salary desc) dense_rank급여,
    row_number() over(order by salary desc) row_number급여
from employees;
---순위함수를 사용하여 employees테이블 직원이 속한 employee_id내에서 salary값이 높은 순서대로 순위를 매긴다
select A.employee_id,
    A.department_id,
    B.department_name,
    salary,
    rank() over(partition by A.department_id order by salary desc) rank_급여,
    dense_rank() over(partition by A.department_id order by salary desc) dense_rank급여,
    row_number() over(partition by A.department_id order by salary desc) row_number급여
from employees A, departments B
where A.department_id=B.department_id
order by B.department_id, A.salary desc;

---그룹함수
---employees테이블에서 salary열의 행을 세는 select함수문을 사용한다
select count(salary) salary행수
from employees;
---employees테이블에서 salary의 합계와 평균을 구하는 함수를 적용해본다 
select sum(salary) 합계, avg(salary) 평균, sum(salary)/count(salary) 계산된평균
from employees;
---employees테이블에서 salary의 최댓값,최솟값, first_name의 first_name의 최댓값과 최솟값을 출력한다
select max(salary) 최댓값, min(salary) 최솟값, max(first_name) 최대문자값, min(first_name) 최소문자값
from employees;
---employees테이블에서 employees_id가 10이상인 직원에 대해 job_id별로 그룹화 하여 job_id별 총급여와 job_id별 평귭 급여를구하고 
---job_id별 총 급여를 기준으로 내림차순 정렬한다. 
select job_id 직무,
    sum(salary) 총급여, 
    avg(salary) 직무별평균급여
from employees
where employee_id > 10
group by job_id
order by 직무별평균급여 desc, 직무별평균급여;
---그룹을 여러번 묶게 되는 경우
select job_id job_id_대그룹,
    manager_id manager_id_중그룹,
    sum(salary) 그룹핑_총급여,
    avg(salary) 그룹핑_평균급여
from employees
where job_id >= 10
group by job_id, manager_id
order by 그룹핑_총급여 desc, 그룹핑_평균급여;
---employees테이블에서 employee_id가 10이상인 직원에 대해 job_id별로 그룹화 하여 그룹별 총급여, 평균급여를 구하되 
---job_id별 총급여가 30000보다 큰 값만을 출력한다. 출력결과는 job_id별 총급여로 내림차순 정렬한다. 
select job_id 직무, sum(salary) 직무별_총급여, avg(salary) 직무별_평균급여
from employees
where employee_id >= 10
group by job_id
having sum(salary) > 30000
order by 직무별_총급여 desc , 직무별_평균급여;

---ERD확인하기 
select A.first_name, A.last_name, B. *
from employees A, job_history B
where A.employee_id=B.employee_id
and A.employee_id=101;


--조인 
--employees, deapartment, locations테이블을 조인하여 각 직원이 어느 부서에 속하는지와 부서의 소재자가 어딘지를 조회가능
select A.employee_id, A.department_id, B.department_name, C.location_id, C.city
from employees A, departments B, locations C
where A.department_id=B.department_id --조인1
and B.location_id = C.location_id; --조인2

--외부조인: 모든 데이터를 연결하는 경우
--동등조인은 데이터 값이 정확히 일치하는 경우에만 결과를 출력한다. 
select count(*) 조인된건수
from employees A, departments B
where A.department_id=B.department_id;

--employees테이블과 departmnets테이블을 department_id로 조인하여 department_id가 null값인 Kinberl Grand도 함께 출력해본다. 
select A.employee_id, A.first_name, A.last_name, B.department_id, B.department_name
from employees A, departments B
where A.department_id= b.department_id(+)
order by A.employee_id;

--employees테이블을 자체조인하여 직원별 담당 매니저를 조회한다
select A.employee_id, A.first_name, A.last_name, A.manager_id, B.first_name||' '||B.last_name manager_name
from employees A, employees B
where A.manager_id=B.employee_id
order by A.employee_id;
--employees테이블의 department_id집합과 departments테이블의 department_id집합을 union연산자로 합하는 경우
select department_id
from employees
union --합하는연산자
select department_id
from departments;

--employees테이블의 department_id와 departments테이블에서 department_id집합의 교집합을 출력한다.
select department_id
from employees
intersect
select department_id
from departments
order by department_id;
--department테이블의 department_id집합에서의 employees테이블의 department_oid집합을 minus연산자를 이용하여 뻰다
select department_id
from departments
minus
select department_id
from employees;

--서브뭐리
--서브쿼리에서 데이터를 받아 메인쿼리로 데이터를 전달하는 역할을 한다. 
select *
from employees A
where A.salary = (
                    select salary
                    from employees
                    where last_name='De Haan'
                    );

--employees테이블에서 department_id값이 가장 낮은 salary가 얼마인지 찾아보고 가장 낮은 값을 가지는 사람의 이름을 출력한다. 
select *
from employees A
where A.salary in (
                    select min(salary) 최저급여
                    from employees
                    group by department_id
                    )
order by A.salary desc;
--다중 열 서브쿼리
--employees에이블에서 job_id별로 가장 낮은 salary가 얼마인지 찾아보고 찾아낸 job_id별 salary에 해당하는 직원이 누구인지를 
--다중 열 서브쿼리를 이용해 찾아보세요
select *
from employees A
where (A.job_id, A.salary) in (
                                select job_id, min(salary) 그룹별급여
                                from employees
                                group by job_id
                                )
order by A.salary DESC;

--DML
--1. insert
--departments테이블에 department_id가 271, department_name이 'Sample_Dept', 'manager_id'가 200, 'location_id'가 1700인 행 삽입
insert into departments (department_id, department_name, manager_id, location_id)
values (271, 'Sample_Dept', 200, 1700);
--데이터 변경된 값 확인
select *
from departments;

--departments테이블에 department_id가 272, department_name이 'Sample_Dept' manager_id가 200, location_id가 1700인 행을 삽입
insert into departments
values (272, 'Sample_Dept', 200, 1700);
commit; --데이터 변경 완료하려면 커밋하는 부분이 반드시 필요하다. 

--2. update
--departments테이블에 department_name이 'Sample_Dept'인 행을 찾아서 manager_id를 201, location_id를 1800으로 변경한다. 
update departments
set manager_id = 201, 
    location_id = 1800
where department_name='Sample_Dept';

--서브쿼리를 사용하여 대량의 데이터를 변경할 수도 있다. 
/*departments테이블에서 department_id가 40인 manager_id와 location_id의 데이터값을 찾고 
department_name이 'Sample_Dept'인 행의 manager_id와 location_id를 찾아낸 데이터와 동일하게 변경한다*/
update departments
set (manager_id, location_id) = (select manager_id, location_id
                                from departments
                                where department_id=40)
where department_name='Sample_Dept';
commit;
select *
from departments;

--departments테이블에서 department_name이 'Sample_Dept'인 행을 삭제한다
delete from departments
where department_name='Sample_Dept';
--서브쿼리를 이용하여 삭제하는 경우
delete from departments
where department_id in (select department_id
                        from departments
                        where department_name='Sample_Dept');
                        
commit;

select *
from departments;

/*DML 명령어 사용시 주의할 점
1. 서브쿼리와 where절을 분리하여 DML을 실행한다
2. DML 시행후 커밋은 필수이다. 
3. DML을 잘못 실행하여 커밋하면 DBA에게 도움을 요청한다*/

/*관계형 데이터베이스에서 운영시 중요한 규칙 3가지가 있다. 그중 가장 중요한 것은 
데이터 무결성, 제약조건, 트랜잭션과 동시성 제어 이다.   */

--DDL(데이터 정의어 : 테이블과 관련된 열을 생성하고 변경하고 삭제하는 명령어를 의미한다
--create table명령어(테이블 생성 명령어)
create table sample_product
    (product_id number,
    product_name varchar2(30),
    manu_date date
    );
--테이블 확인
select *
from sample_product;
--만든 테이블에 데이터 삽입(DML)
insert into sample_product
values (1, 'television',to_date('140101', 'YYMMDD'));
insert into sample_product
values (2, 'washer', to_date('150101', 'YYMMDD'));
insert into sample_product
values (3, 'cleaner', to_date('160101', 'YYMMDD'));
commit; --데이터 커밋
select * --커밋한 데이터 확인
from sample_product
order by product_id;

--테이블 수정하기(추가, 변경, 삭제하는 경우)
--sample_product 테이블에서 factory열을 추가한다. (행추가)
alter table sample_product
    add(factory varchar(10));
select *
from sample_product;
--열 수정하기 
--sample_product에 있는 factory열의 데이터타입과 크기를 char의 10으로 바꾼다, 
alter table sample_product
    modify(factory char(10));
select *
from sample_product;
--열이름 수정하기 
alter table sample_product
    rename column factory to factory_name;
--sample_product의 facory_name을 삭제하는 경우
alter table sample_product
    drop column factory_name;
select *
from sample_product;
--테이블의 내용 삭제하기(테이블내의 모든 데이터를 삭제하되,테이블 자체의 구조는 삭제되지 않는다
truncate table sample_product;
select *
from sample_product;
--전체 테이블 자체를 삭제하는 경우
drop table sample_product;
select *
from sample_product;--테이블 삭제되었으므로, 오류가 난다. 


--뷰 : 가상의 데이터 형태 
--기존에 만들어 있던 뷰를 호출하는 방식은 테이블을 불러오는 형식과 동일하다. 
select *
from emp_details_view;
--employees테이블과 emp_details_view를 조인하여 employee_id가 100인 직원의 employee_id, hire_date, department_name, job_title을 출력
--뷰를 사용하여 원하는 정보만을 출력하는데 더 편리하다
select A.employee_id, A.hire_date, B.department_name, B.job_title
from employees A, emp_details_view B
where A.employee_id=B.employee_id
and A.employee_id=100;

--뷰를 생성
create view clerk AS
    select employee_id, last_name, department_id, job_id
    from employees
    where job_id='PU_CLERK',
        or job_id='SH_CLERK',
        or job_id='ST_CLERK'
    with cleark option;
select *
from clerk;
--뷰를 생성하는 방법
create view vw_emp AS
select e.ename, e.job, d.deptno, d.deptname, d.loc
    from employees e, departments d
    where d.deptno=e.deptno;




