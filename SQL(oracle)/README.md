[3장]

3.1.2 

[예제 3-1]

SELECT *
FROM   employees;
---------------------------------------------------

3.1.3

[예제 3-2]

SELECT employee_id, first_name, last_name 
FROM   employees;
---------------------------------------------------

3.1.3

[예제 3-3]

SELECT employee_id, first_name, last_name 
FROM   employees
ORDER BY employee_id DESC;
---------------------------------------------------

3.1.4

SELECT job_id
FROM   employees;
---------------------------------------------------

[예제 3-4]

SELECT DISTINCT job_id
FROM   employees;
---------------------------------------------------

3.1.5

[예제 3-5]

SELECT employee_id AS 사원번호, first_name AS 이름, last_name AS 성
FROM   employees;
---------------------------------------------------

3.1.6

[예제 3-6]

SELECT  employee_id, first_name||last_name
FROM    employees;
---------------------------------------------------

[예제 3-7]

SELECT employee_id, 
       first_name||' '||last_name,
       email||'@'||'company.com'
FROM   employees;
---------------------------------------------------

3.1.7

[예제 3-8]

SELECT employee_id, salary, salary+500, salary-100, (salary*1.1)/2
FROM   employees;
---------------------------------------------------

3.1.7

[예제 3-9]

SELECT employee_id AS 사원번호, 
       salary AS 급여, 
       salary+500 AS 추가급여, 
       salary-100 AS 인하급여, 
       (salary*1.1)/2 AS 조정급여
FROM   employees;
---------------------------------------------------

3.2.1

[예제 3-10]

SELECT *
FROM   employees
WHERE  employee_id = 100;
---------------------------------------------------

[예제 3-11]

SELECT *
FROM   employees
WHERE  first_name = 'David';
---------------------------------------------------

[예제 3-12]

SELECT *
FROM   employees
WHERE  employee_id >= 105;
---------------------------------------------------

3.2.2

[예제 3-13]

SELECT *
FROM   employees
WHERE  salary BETWEEN 10000 AND 20000;
---------------------------------------------------

[예제 3-14]

SELECT *
FROM   employees
WHERE  salary IN (10000, 17000, 24000);
---------------------------------------------------

[예제 3-15]

SELECT *
FROM   employees
WHERE  job_id LIKE 'AD%';
---------------------------------------------------

[예제 3-16]

SELECT *
FROM   employees
WHERE  job_id LIKE 'AD___';
---------------------------------------------------

[예제 3-17]

SELECT *
FROM   employees
WHERE  manager_id IS NULL;
---------------------------------------------------

3.2.3

[예제 3-18]

SELECT *
FROM   employees
WHERE  salary > 4000
AND    job_id = 'IT_PROG';
---------------------------------------------------

[예제 3-19]

SELECT *
FROM   employees
WHERE  salary > 4000
AND    job_id = 'IT_PROG'
OR     job_id = 'FI_ACCOUNT';
---------------------------------------------------

[예제 3-20]

SELECT *
FROM   employees
WHERE  employee_id <> 105;
---------------------------------------------------

[예제 3-21]

SELECT *
FROM   employees
WHERE  manager_id IS NOT NULL;
---------------------------------------------------


[4장]

4.2.1

[예제 4-1]

SELECT last_name, 
       LOWER(last_name) LOWER적용, 
       UPPER(last_name) UPPER적용, 
       email, 
       INITCAP(email) INITCAP적용
FROM   employees; 
---------------------------------------------------

[예제 4-2]

SELECT job_id, SUBSTR(job_id, 1, 2) 적용결과
FROM   employees;
---------------------------------------------------

[예제 4-3]

SELECT job_id, REPLACE(job_id, 'ACCOUNT', 'ACCNT') 적용결과
FROM   employees;
---------------------------------------------------

[예제 4-4]

SELECT first_name, LPAD(first_name, 12, '*') LPAD적용결과
FROM   employees;
---------------------------------------------------

[예제 4-5]

SELECT job_id, 
       LTRIM(job_id, 'F') LTRIM적용결과,
       RTRIM(job_id, 'T') RTRIM적용결과
FROM   employees;
---------------------------------------------------


SELECT 'start'||TRIM('   - space -  ')||'end' 제거된_공백
FROM   dual;
---------------------------------------------------

4.2.2

[예제 4-6]

SELECT salary, 
       salary/30 일급, 
       ROUND(salary/30,0) 적용결과0, 
       ROUND(salary/30,1) 적용결과1, 
       ROUND(salary/30,-1) 적용결과MINUS1
FROM   employees;
---------------------------------------------------

[예제 4-7]

SELECT salary, 
       salary/30 일급, 
       TRUNC(salary/30,0) 적용결과0, 
       TRUNC(salary/30,1) 적용결과1, 
       TRUNC(salary/30,-1) 적용결과MINUS1
FROM   employees;
---------------------------------------------------

4.2.3

SELECT TO_CHAR(SYSDATE,'YY/MM/DD/HH24:MI') 오늘날짜,
       SYSDATE + 1 더하기1,
       SYSDATE -1 빼기1,
       TO_DATE('20171202')-TO_DATE('20171201') 날짜빼기,
       SYSDATE + 13/24 시간더하기
FROM   DUAL;  
---------------------------------------------------

[예제 4-8]

SELECT SYSDATE, hire_date, MONTHS_BETWEEN(SYSDATE, hire_date) 적용결과 
FROM   employees
WHERE  department_id = 100;
---------------------------------------------------

[예제 4-9]

SELECT hire_date, 
       ADD_MONTHS(hire_date, 3) 더하기_적용결과,
       ADD_MONTHS(hire_date, -3) 빼기_적용결과
FROM   employees
WHERE  employee_id BETWEEN 100 AND 106;
---------------------------------------------------

[예제 4-10]

SELECT hire_date,
       NEXT_DAY(hire_date,'금요일') 적용결과_문자지정,
       NEXT_DAY(hire_date, 6) 적용결과_숫자지정
FROM   employees
WHERE  employee_id BETWEEN 100 AND 106;
---------------------------------------------------

[예제 4-11]

SELECT hire_date,
       LAST_DAY(hire_date) 적용결과
FROM   employees
WHERE  employee_id BETWEEN 100 AND 106;
---------------------------------------------------

[예제 4-12]

SELECT hire_date,
       ROUND(hire_date,'MONTH') 적용결과_ROUND_M,
       ROUND(hire_date,'YEAR')  적용결과_ROUND_Y,
       TRUNC(hire_date,'MONTH') 적용결과_TRUNC_M,
       TRUNC(hire_date,'YEAR')  적용결과_TRUNC_Y
FROM   employees
WHERE  employee_id BETWEEN 100 AND 106;
---------------------------------------------------

4.2.4

SELECT 1 + '2'
FROM DUAL;
---------------------------------------------------


SELECT TO_CHAR(SYSDATE,'YY'),
       TO_CHAR(SYSDATE,'YYYY'),
       TO_CHAR(SYSDATE,'MM'),
       TO_CHAR(SYSDATE,'MON'),
       TO_CHAR(SYSDATE,'YYYYMMDD') 응용적용1,
       TO_CHAR(TO_DATE('20171008'),'YYYYMMDD') 응용적용2
FROM   dual; 
---------------------------------------------------


SELECT TO_CHAR(SYSDATE, 'HH:MI:SS PM') 시간형식,
       TO_CHAR(SYSDATE, 'YYYY/MM/DD HH:MI:SS PM') 날짜와시간조합
FROM   dual;
---------------------------------------------------


SELECT TO_CHAR(SYSDATE, 'HH-MI-SS PM') 시간형식,
       TO_CHAR(SYSDATE, ' "날짜:" YYYY/MM/DD "시각:" HH:MI:SS PM' ) 날짜와시각표현
FROM   dual;
---------------------------------------------------


SELECT TO_NUMBER('123')
FROM   dual;
---------------------------------------------------


SELECT TO_DATE('20171007','YYMMDD')
FROM   dual;
---------------------------------------------------


SELECT *
FROM   employees
ORDER BY commission_pct;
---------------------------------------------------


SELECT  salary * commission_pct
FROM   employees
ORDER BY commission_pct;
---------------------------------------------------


[예제 4-13]

SELECT  salary * NVL(commission_pct, 1)
FROM   employees
ORDER BY commission_pct;
---------------------------------------------------

[예제 4-14]

SELECT first_name, 
       last_name, 
       department_id, 
       salary 원래급여,
       DECODE(department_id, 60, salary*1.1, salary) 조정된급여,
       DECODE(department_id, 60, '10%인상', '미인상') 인상여부
FROM   employees;
---------------------------------------------------

[예제 4-15]

SELECT employee_id, first_name, last_name, salary, 
       CASE 
            WHEN salary >= 9000 THEN '상위급여'
            WHEN salary BETWEEN 6000 AND 8999  THEN '중위급여'
            ELSE '하위급여'
       END AS 급여등급
FROM  employees
WHERE job_id = 'IT_PROG';
---------------------------------------------------

[예제 4-16]

SELECT  employee_id,
        salary,
        RANK()       OVER(ORDER BY salary DESC) RANK_급여,
        DENSE_RANK() OVER(ORDER BY salary DESC) DENSE_RANK_급여,
        ROW_NUMBER() OVER(ORDER BY salary DESC) ROW_NUMBER_급여
FROM employees; 
---------------------------------------------------

[예제 4-17]

SELECT  A.employee_id,
        A.department_id,
        B.department_name,
        salary,
        RANK()       OVER(PARTITION BY A.department_id ORDER BY salary DESC) RANK_급여,
        DENSE_RANK() OVER(PARTITION BY A.department_id ORDER BY salary DESC) DENSE_RANK_급여,
        ROW_NUMBER() OVER(PARTITION BY A.department_id ORDER BY salary DESC) ROW_NUMBER_급여
FROM employees A, departments B
WHERE A.department_id = B.department_id
ORDER BY B.department_id, A.salary DESC;
---------------------------------------------------

4.3.1

[예제 4-18]

SELECT COUNT(salary) salary행수
FROM   employees;
---------------------------------------------------

[예제 4-19]

SELECT SUM(salary) 합계, AVG(salary) 평균, SUM(salary)/COUNT(salary) 계산된평균
FROM   employees;
---------------------------------------------------

[예제 4-20]

SELECT MAX(salary) 최댓값, MIN(salary) 최솟값, MAX(first_name) 최대문자값, MIN(first_name) 최소문자값
FROM   employees;
---------------------------------------------------

4.3.2

[예제 4-21]

SELECT job_id 직무, SUM(salary) 직무별_총급여, AVG(salary) 직무별_평균급여
FROM   employees
WHERE  employee_id >= 10
GROUP BY job_id
ORDER BY  직무별_총급여 DESC, 직무별_평균급여;
---------------------------------------------------


SELECT job_id  job_id_대그룹, 
       manager_id manager_id_중그룹, 
       SUM(salary) 그룹핑_총급여, 
       AVG(salary) 그룹핑_평균급여
FROM   employees
WHERE  employee_id >= 10
GROUP  BY job_id, manager_id
ORDER BY  그룹핑_총급여 DESC, 그룹핑_평균급여;
---------------------------------------------------

4.3.3

[예제 4-22]

SELECT job_id 직무, SUM(salary) 직무별_총급여, AVG(salary) 직무별_평균급여
FROM   employees
WHERE  employee_id >= 10
GROUP  BY job_id
HAVING SUM(salary) > 30000
ORDER BY  직무별_총급여 DESC, 직무별_평균급여;
---------------------------------------------------


[5장]

5.2

SELECT A.first_name, A.last_name, B.*
FROM   employees A, job_history B
WHERE  A.employee_id = B.employee_id
AND    A.employee_id = 101;
---------------------------------------------------


[6장]

6.2

SELECT  *
FROM    employees A, departments B
WHERE   A.department_id = B.department_id;
---------------------------------------------------

[예제 6-1]

SELECT A.employee_id, A.department_id, B.department_name, C.city
FROM   employees A, departments B, locations C
WHERE  A.department_id = B.department_id  
AND    B.location_id = C.location_id;       
---------------------------------------------------

6.3

SELECT  COUNT(*) 조인된건수
FROM    employees A, departments B
WHERE   A.department_id = B.department_id;
---------------------------------------------------

[예제 6-2]

SELECT A.employee_id, A.first_name, A.last_name, B.department_id, B.department_name
FROM   employees A, departments B
WHERE  A.department_id = B.department_id(+)
ORDER BY A.employee_id;
---------------------------------------------------


SELECT A.employee_id, A.first_name, A.last_name, B.department_id, B.department_name
FROM   employees A, departments B
WHERE  A.department_id(+) = B.department_id
ORDER BY A.employee_id;
---------------------------------------------------

6.4

[예제 6-3]

SELECT A.employee_id, A.first_name, A.last_name, A.manager_id,  
       B.first_name||' '||B.last_name manager_name
FROM   employees A, employees B
WHERE  A.manager_id = B.employee_id
ORDER BY A.employee_id;
---------------------------------------------------

6.5

[예제 6-4]

SELECT department_id
FROM   employees
UNION
SELECT department_id
FROM   departments;
---------------------------------------------------

[예제 6-5]

SELECT department_id
FROM   employees
UNION ALL
SELECT department_id
FROM   departments
ORDER BY department_id;
---------------------------------------------------

[예제 6-6]

SELECT department_id
FROM   employees
INTERSECT
SELECT department_id
FROM   departments
ORDER BY department_id;
---------------------------------------------------

[예제 6-7]

SELECT department_id
FROM   departments
MINUS
SELECT department_id
FROM   employees; 
---------------------------------------------------


[7장]

7.2

[예제 7-1]

SELECT *
FROM employees A
WHERE A.salary = (
                  SELECT salary
                  FROM employees
                  WHERE last_name = 'De Haan'
                  );
---------------------------------------------------


SELECT *
FROM employees A
WHERE A.salary = (
                  SELECT salary
                  FROM employees
                  WHERE last_name = 'Taylor'
                  );
---------------------------------------------------

7.3

[예제 7-2]

SELECT *
FROM employees A
WHERE A.salary IN (
                   SELECT MIN(salary) 최저급여
                   FROM employees
                   GROUP BY department_id
                  )
ORDER BY A.salary DESC;
---------------------------------------------------

7.4

[예제 7-3]

SELECT *
FROM employees A
WHERE (A.job_id, A.salary) IN (
                               SELECT job_id, MIN(salary) 그룹별급여
                               FROM employees
                               GROUP BY job_id
                              )
ORDER BY A.salary DESC;
---------------------------------------------------

7.5

[예제 7-4]

SELECT *
FROM employees A,
                  ( SELECT  department_id
                    FROM    departments
                    WHERE   department_name = 'IT') B
WHERE A.department_id = B.department_id;
---------------------------------------------------


[8장]

8.2

[예제 8-1]

INSERT INTO departments ( department_id, department_name, manager_id, location_id)
VALUES
(271, 'Sample_Dept', 200, 1700);
---------------------------------------------------

[예제 8-2]

INSERT INTO departments 
VALUES
(272, 'Sample_Dept', 200, 1700); 
---------------------------------------------------


INSERT INTO departments 
VALUES
(271, Sample_Dept, 200, 1700);
---------------------------------------------------


commit;
---------------------------------------------------

8.3

UPDATE departments
SET    manager_id = 201,
       location_id = 1800
WHERE  department_name = 'Sample_Dept';
---------------------------------------------------

8.3

[예제 8-3]

UPDATE departments
SET    (manager_id, location_id) = ( SELECT manager_id, location_id
                                     FROM   departments
                                     WHERE  department_id = 40)
WHERE  department_name = 'Sample_Dept';
---------------------------------------------------

[예제 8-4]

UPDATE departments
SET    department_id = null
WHERE  department_name = 'Sample_Dept';
---------------------------------------------------

8.4

[예제 8-5]

DELETE FROM departments
WHERE  department_name = 'Sample_Dept';
---------------------------------------------------


DELETE FROM departments
WHERE  department_id IN (SELECT department_id
                         FROM   departments
                         WHERE  department_name = 'Sample_Dept');
---------------------------------------------------


[9장]

9.1.2

INSERT INTO departments 
VALUES
(100, 'Sample_Dept', 200, 1700);
---------------------------------------------------


INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES
(273, 'Sample_Dept', 200, 1111);
---------------------------------------------------


INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary)
VALUES
(207, 'fist_name' , 'last_name', 'SKING', '111.111.1111', to_date('030617','YYMMDD'),'IT_PROG', 6000);
---------------------------------------------------


INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES
(273, null , 200, 1700);
---------------------------------------------------


INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary)
VALUES
(209, 'fist_name' , 'last_name', 'TEST', '111.111.1111', to_date('030617','YYMMDD'),'IT_PROG', 0); 
---------------------------------------------------


[10장]

10.2

[예제 10-1]

CREATE TABLE sample_product 
       ( product_id   number, 
         product_name varchar2(30), 
         manu_date    date
       );
---------------------------------------------------

10.2


INSERT INTO sample_product VALUES ( 1, 'television', to_date('140101','YYMMDD'));
INSERT INTO sample_product VALUES ( 2, 'washer', to_date('150101','YYMMDD'));
INSERT INTO sample_product VALUES ( 3, 'cleaner', to_date('160101','YYMMDD'));
commit;
---------------------------------------------------

10.3.1

[예제 10-2]

ALTER TABLE sample_product ADD (factory varchar(10));
---------------------------------------------------

10.3.2

[예제 10-3]

ALTER TABLE sample_product MODIFY ( factory char(10));
---------------------------------------------------


ALTER TABLE sample_product  MODIFY ( product_name varchar(5));
---------------------------------------------------

10.3.3

[예제 10-4]

ALTER TABLE sample_product RENAME COLUMN factory to factory_name; 
---------------------------------------------------

10.3.4

[예제 10-5]

ALTER TABLE sample_product DROP COLUMN factory_name; 
---------------------------------------------------

10.4

[예제 10-6]

TRUNCATE TABLE sample_product;
---------------------------------------------------

10.5

DROP TABLE sample_product;
---------------------------------------------------


SELECT *
FROM sample_product;
---------------------------------------------------


[11장]

11.1

[예제 11-1]

SELECT A.employee_id, A.hire_date, B.department_name, B.job_title
FROM  employees A, emp_details_view B
WHERE A.employee_id = B.employee_id
AND   A.employee_id = 100; 
---------------------------------------------------


[12장]

12.1

@c:\sql_practice\create_table.sql; 

@c:\sql_practice\1.address.sql;

@c:\sql_practice\2.customer.sql;

@c:\sql_practice\3.item.sql;  

@c:\sql_practice\4.reservation.sql; 

@c:\sql_practice\5.order_info.sql;  
---------------------------------------------------


SELECT *
FROM   order_info;
---------------------------------------------------

[분석1]

SELECT COUNT(*)  전체주문건, 
       SUM(B.sales) 총매출, 
       AVG(B.sales) 평균매출,
       MAX(B.sales) 최고매출,
       MIN(B.sales) 최저매출
FROM reservation A, order_info B
WHERE A.reserv_no = B.reserv_no;
---------------------------------------------------

[분석2]

SELECT COUNT(*) 총판매량, 
       SUM(B.sales) 총매출, 
       SUM(DECODE(B.item_id,'M0001',1,0)) 전용상품판매량, 
       SUM(DECODE(B.item_id,'M0001',B.sales,0)) 전용상품매출
FROM reservation A, order_info B
WHERE A.reserv_no = B.reserv_no
AND   A.cancel    = 'N';
---------------------------------------------------

[분석3]

SELECT C.item_id 상품아이디, 
       C.product_name 상품이름, 
       SUM(B.sales) 상품매출
FROM reservation A, order_info B, item C 
WHERE A.reserv_no = B.reserv_no
AND   B.item_id   = C.item_id
AND   A.cancel    = 'N'
GROUP BY C.item_id, C.product_name
ORDER BY SUM(B.sales) DESC;
---------------------------------------------------

[분석4]

SELECT SUBSTR(A.reserv_date,1,6) 매출월,  
       SUM(DECODE(B.item_id,'M0001',B.sales,0)) SPECIAL_SET,
       SUM(DECODE(B.item_id,'M0002',B.sales,0)) PASTA,
       SUM(DECODE(B.item_id,'M0003',B.sales,0)) PIZZA,
       SUM(DECODE(B.item_id,'M0004',B.sales,0)) SEA_FOOD,
       SUM(DECODE(B.item_id,'M0005',B.sales,0)) STEAK,
       SUM(DECODE(B.item_id,'M0006',B.sales,0)) SALAD_BAR,
       SUM(DECODE(B.item_id,'M0007',B.sales,0)) SALAD,
       SUM(DECODE(B.item_id,'M0008',B.sales,0)) SANDWICH,
       SUM(DECODE(B.item_id,'M0009',B.sales,0)) WINE,
       SUM(DECODE(B.item_id,'M0010',B.sales,0)) JUICE
FROM reservation A, order_info B
WHERE A.reserv_no = B.reserv_no
AND   A.cancel    = 'N'
GROUP BY SUBSTR(A.reserv_date,1,6)
ORDER BY SUBSTR(A.reserv_date,1,6);
---------------------------------------------------

[분석5]

SELECT SUBSTR(A.reserv_date,1,6) 매출월, 
       SUM(B.sales) 총매출, 
       SUM(DECODE(B.item_id,'M0001',B.sales,0)) 전용상품매출
FROM reservation A, order_info B
WHERE A.reserv_no = B.reserv_no
AND   A.cancel    = 'N'
GROUP BY SUBSTR(A.reserv_date,1,6)
ORDER BY SUBSTR(A.reserv_date,1,6);
---------------------------------------------------

[분석6]

SELECT SUBSTR(A.reserv_date,1,6) 매출월, 
       SUM(b.sales) 
       - SUM(decode(b.item_id,'M0001',b.sales,0)) 전용상품외매출, 
       SUM(decode(b.item_id,'M0001',b.sales,0))   전용상품매출,
       ROUND(SUM(DECODE(B.item_id,'M0001',B.sales,0))/SUM(B.sales)*100,1) 매출기여율
FROM reservation A, order_info B
WHERE A.reserv_no = B.reserv_no
AND   A.cancel    = 'N'
GROUP BY SUBSTR(A.reserv_date,1,6)
ORDER BY SUBSTR(A.reserv_date,1,6); 
---------------------------------------------------

[분석7]

SELECT SUBSTR(A.reserv_date,1,6) 매출월, 
       SUM(B.sales) 총매출, 
       SUM(B.sales) 
       - SUM(decode(B.item_id,'M0001',B.sales,0)) 전용상품외매출, 
       SUM(DECODE(B.item_id,'M0001',B.sales,0)) 전용상품매출,
       ROUND(SUM(DECODE(B.item_id,'M0001',B.sales,0))/SUM(B.sales)*100,1) 매출기여율,
       COUNT(A.reserv_no) 총예약건,
       SUM(DECODE(A.cancel,'N',1,0)) 예약완료건,
       SUM(DECODE(A.cancel,'Y',1,0)) 예약취소건
FROM reservation A, order_info B
WHERE A.reserv_no = B.reserv_no
-- AND   A.cancel    = 'N'
GROUP BY SUBSTR(A.reserv_date,1,6)
ORDER BY SUBSTR(A.reserv_date,1,6);
---------------------------------------------------

SELECT SUBSTR(A.reserv_date,1,6) 매출월, 
       sum(B.sales) 총매출, 
       SUM(B.sales) 
       - SUM(decode(B.item_id,'M0001',B.sales,0)) 전용상품외매출, 
       SUM(DECODE(B.item_id,'M0001',B.sales,0)) 전용상품매출,
       ROUND(SUM(DECODE(B.item_id,'M0001',B.sales,0))/SUM(B.sales)*100,1) 매출기여율,
       COUNT(A.reserv_no) 총예약건,
       SUM(DECODE(A.cancel,'N',1,0)) 예약완료건,
       SUM(DECODE(A.cancel,'Y',1,0)) 예약취소건
FROM reservation A, order_info B
WHERE A.reserv_no = B.reserv_no(+)
-- AND   A.cancel    = 'N'
GROUP BY SUBSTR(A.reserv_date,1,6)
ORDER BY SUBSTR(A.reserv_date,1,6);
---------------------------------------------------

[분석8]

SELECT SUBSTR(A.reserv_date,1,6) 매출월, 
       SUM(B.sales) 총매출, 
       SUM(B.sales)
       - SUM(DECODE(B.item_id,'M0001',B.sales,0)) 전용상품외매출, 
       SUM(DECODE(B.item_id,'M0001',B.sales,0)) 전용상품매출,
       ROUND(SUM(DECODE(B.item_id,'M0001',B.sales,0))/SUM(B.sales)*100,1)||'%' 전용상품판매율,
       COUNT(A.reserv_no) 총예약건,
       SUM(DECODE(A.cancel,'N',1,0)) 예약완료건,
       SUM(DECODE(A.cancel,'Y',1,0)) 예약취소건,
       ROUND(SUM(DECODE(A.cancel,'Y',1,0))/COUNT(A.reserv_no)*100,1)||'%' 예약취소율
FROM reservation A, order_info B
WHERE A.reserv_no = B.reserv_no(+)
-- AND   A.cancel    = 'N'
GROUP BY SUBSTR(A.reserv_date,1,6)
ORDER BY SUBSTR(A.reserv_date,1,6);
---------------------------------------------------

[분석9]

SELECT  SUBSTR(reserv_date,1,6) 날짜,  
          A.product_name 상품명,
          SUM(DECODE(A.WEEK,'1',A.sales,0)) 일요일,
          SUM(DECODE(A.WEEK,'2',A.sales,0)) 월요일,
          SUM(DECODE(A.WEEK,'3',A.sales,0)) 화요일,
          SUM(DECODE(A.WEEK,'4',A.sales,0)) 수요일,
          SUM(DECODE(A.WEEK,'5',A.sales,0)) 목요일,
          SUM(DECODE(A.WEEK,'6',A.sales,0)) 금요일,
          SUM(DECODE(A.WEEK,'7',A.sales,0)) 토요일   
FROM
      (
        SELECT A.reserv_date,
               C.product_name,
               TO_CHAR(TO_DATE(A.reserv_date, 'YYYYMMDD'),'d') WEEK,
               B.sales
        FROM reservation A, order_info B, item C
        WHERE A.reserv_no = B.reserv_no
        AND   B.item_id   = C.item_id
        AND   B.item_id = 'M0001'
      ) A
GROUP BY SUBSTR(reserv_date,1,6), A.product_name
ORDER BY SUBSTR(reserv_date,1,6);
---------------------------------------------------

[분석10]

SELECT *
    FROM 
    (
      SELECT SUBSTR(A.reserv_date,1,6) 매출월,
             A.branch                 지점,
             SUM(B.sales)              전용상품매출,
             RANK() OVER(PARTITION BY SUBSTR(A.reserv_date,1,6)   
      ORDER BY SUM(B.sales) DESC) 지점순위
      FROM  reservation A, order_info B
      WHERE A.reserv_no = B.reserv_no
      AND   A.cancel = 'N'
      AND   B.item_id = 'M0001'
      GROUP BY SUBSTR(A.reserv_date,1,6), A.branch
      ORDER BY SUBSTR(A.reserv_date,1,6)
    ) A
    WHERE A.지점순위 <= 3; 
---------------------------------------------------

SELECT *
    FROM 
    (
      SELECT SUBSTR(A.reserv_date,1,6) 매출월,
             A.branch                  지점,
             SUM(B.sales)              전용상품매출,
             ROW_NUMBER() OVER(PARTITION BY SUBSTR(A.reserv_date,1,6) 
               ORDER BY SUM(B.sales) DESC) 지점순위,
             DECODE(A.branch,'강남','A','종로','A','영등포','A','B') 지점등급
      FROM  reservation A, order_info B
      WHERE A.reserv_no = B.reserv_no
      AND   A.cancel = 'N'
      AND   B.item_id = 'M0001'
      GROUP BY SUBSTR(A.reserv_date,1,6), A.branch, 
             DECODE(A.branch,'강남','A','종로','A','영등포','A','B')
      ORDER BY SUBSTR(A.reserv_date,1,6)
    ) A
    WHERE A.지점순위 = 1;
    -- AND 지점등급 = 'A'
---------------------------------------------------

[분석11]

SELECT A.매출월                매출월,
       MAX(총매출)             총매출,
       MAX(전용상품외매출)     전용상품외매출,
       MAX(전용상품매출)       전용상품매출,
       MAX(전용상품판매율)     전용상품판매율,
       MAX(총예약건)           총예약건,
       MAX(예약완료건)         예약완료건,
       MAX(예약취소건)         예약취소건,
       MAX(예약취소율)         예약취소율,
       MAX(최대매출지점)       최대매출지점,
       MAX(지점매출액)         지점매출액
FROM
(
    SELECT SUBSTR(A.reserv_date,1,6) 매출월, 
           SUM(B.sales) 총매출, 
           SUM(B.sales)
           - SUM(DECODE(B.item_id,'M0001',B.sales,0)) 전용상품외매출, 
           SUM(DECODE(B.item_id,'M0001',B.sales,0)) 전용상품매출,
           ROUND(SUM(DECODE(B.item_id,'M0001',B.sales,0))/SUM(B.sales)*100,1)||'%' 전용상품판매율,
           COUNT(A.reserv_no) 총예약건,
           SUM(DECODE(A.cancel,'N',1,0)) 예약완료건,
           SUM(DECODE(A.cancel,'Y',1,0)) 예약취소건,
           ROUND(SUM(DECODE(A.cancel,'Y',1,0))/COUNT(A.reserv_no)*100,1)||'%' 예약취소율,
           '' 최대매출지점,
           0  지점매출액
    FROM reservation A, order_info B
    WHERE A.reserv_no = B.reserv_no(+)
    -- AND   A.cancel    = 'N'
    GROUP BY SUBSTR(A.reserv_date,1,6), '', 0
UNION
    SELECT A.매출월,
           0          총매출,
           0          전용상품외매출,
           0          전용상품매출,
           ''         전용상품판매율,
           0          총예약건,
           0          예약완료건,
           0          예약취소건,
           ''         예약취소율,
           A.지점       최대매출지점,
           A.전용상품매출 지점매출액 
    FROM 
    (
      SELECT SUBSTR(A.reserv_date,1,6) 매출월,
             A.branch                  지점,
             SUM(B.sales)              전용상품매출,
             ROW_NUMBER() OVER(PARTITION BY SUBSTR(A.reserv_date,1,6)   
      ORDER BY SUM(B.sales) DESC) 지점순위,
             DECODE(A.branch,'강남','A','종로','A','영등포','A','B') 지점등급
      FROM  reservation A, order_info B
      WHERE A.reserv_no = B.reserv_no
      AND   A.cancel = 'N'
      AND   B.item_id = 'M0001'
      GROUP BY SUBSTR(A.reserv_date,1,6), A.branch, 
          DECODE(A.branch,'강남','A','종로','A','영등포','A','B')
      ORDER BY SUBSTR(A.reserv_date,1,6)
    ) A
    WHERE A.지점순위 = 1 
    -- AND 지점등급 = 'A'
) A
GROUP BY A.매출월
ORDER BY A.매출월;
---------------------------------------------------

[분석12]

SELECT COUNT(customer_id) 고객수, 
       SUM(DECODE(sex_code,'M',1,0)) 남자, 
       SUM(DECODE(sex_code,'F',1,0)) 여자,
       ROUND(AVG(MONTHS_BETWEEN(TO_DATE('20171231','YYYYMMDD'),TO_DATE(birth,'YYYYMMDD'))/12),1) 평균나이,
       ROUND(AVG(MONTHS_BETWEEN(TO_DATE('20171231','YYYYMMDD'),first_reg_date)),1) 평균거래기간
FROM customer;
---------------------------------------------------

[분석13]

SELECT A.customer_id     고객아이디, 
       A.customer_name   고객이름, 
       COUNT(C.order_no) 전체상품주문건수, 
       SUM(C.sales) 총매출,
       SUM(DECODE(C.item_id,'M0001',1,0)) 전용상품주문건수,
       SUM(DECODE(C.item_id,'M0001',C.sales,0)) 전용상품매출
FROM customer A, reservation B, order_info C
WHERE A.customer_id = B.customer_id
AND   B.reserv_no   = C.reserv_no
AND   B.cancel = 'N'
GROUP BY A.customer_id, A.customer_name
ORDER BY SUM(DECODE(C.item_id,'M0001',C.sales,0)) DESC;
---------------------------------------------------

[분석14]

SELECT B.address_detail 주소, B.zip_code, COUNT(B.address_detail) 카운팅
FROM (
      SELECT DISTINCT A.customer_id, A.zip_code
      FROM  customer A, reservation B, order_info C
      WHERE A.customer_id = B.customer_id
      AND   B.reserv_no   = C.reserv_no
      AND   B.cancel = 'N'
      -- AND   C.item_id = 'M0001'
      ) A, address B
WHERE A.zip_code = B.zip_code
GROUP BY B.address_detail, B.zip_code 
ORDER BY COUNT(B.address_detail) DESC;
---------------------------------------------------

SELECT NVL(B.job,'정보없음') 직업, COUNT(NVL(B.job,1)) 카운팅
FROM (
      SELECT DISTINCT A.customer_id, A.zip_code
      FROM  customer A, reservation B, order_info C
      WHERE A.customer_id = B.customer_id
      AND   B.reserv_no   = C.reserv_no
      AND   B.cancel = 'N'
      -- AND   C.item_id = 'M0001'
      ) A, customer B
WHERE A.customer_id = B.customer_id
GROUP BY NVL(B.job,'정보없음')
ORDER BY COUNT(NVL(B.job,1)) DESC;
---------------------------------------------------

[분석15]

SELECT *
FROM
(  
  SELECT  A.customer_id,
          A.customer_name,
          SUM(C.sales) 전용상품매출,
          ROW_NUMBER() OVER(PARTITION BY C.item_id ORDER BY SUM(C.sales) DESC) 순위
  FROM customer A, reservation B, order_info C
  WHERE A.customer_id = B.customer_id
  AND   B.reserv_no   = C.reserv_no
  AND   B.cancel = 'N'
  AND   C.item_id = 'M0001'
  GROUP BY A.customer_id, C.item_id, A.customer_name
) A
WHERE A.순위 <= 10
ORDER BY A.순위;
---------------------------------------------------

SELECT ROWNUM, A.* 
FROM
(
  SELECT A.customer_id, 
         A.customer_name, 
         SUM(DECODE(C.item_id,'M0001',C.sales,0)) 전용상품_매출
  FROM customer A, reservation B, order_info C
  WHERE A.customer_id = B.customer_id
  AND   B.reserv_no   = C.reserv_no
  AND   B.cancel = 'N'
  GROUP BY A.customer_id, A.customer_name
  ORDER BY SUM(DECODE(C.item_id,'M0001',C.sales,0)) DESC 
) A
WHERE ROWNUM <= 10;
---------------------------------------------------


SELECT A.주소, COUNT(A.주소) 카운팅
FROM
(
  SELECT   A.customer_id       고객아이디,
         A.customer_name     고객이름,
         NVL(A.job,'정보없음') 직업,
         D.address_detail     주소,
         SUM(C.sales) 전용상품_매출,
         RANK() OVER(PARTITION BY C.item_id ORDER BY SUM(C.sales) DESC) 순위
  FROM customer A, reservation B, order_info C, address D
  WHERE A.customer_id = B.customer_id
  AND   B.reserv_no   = C.reserv_no
  AND   A.zip_code    = D.zip_code
  AND   B.cancel = 'N'
  AND   C.item_id = 'M0001'
  GROUP BY A.customer_id, C.item_id, A.customer_name,  NVL(A.job,'정보없음'), D.address_detail
) A
WHERE A.순위 <= 10
GROUP BY A.주소
ORDER BY COUNT(A.주소) DESC;
---------------------------------------------------


SELECT A.직업, COUNT(A.직업) 카운팅
FROM
(
  SELECT   A.customer_id       고객아이디,
         A.customer_name     고객이름,
         NVL(A.job,'정보없음') 직업,
         D.address_detail     주소,
         SUM(C.sales) 전용상품_매출,
         RANK() OVER(PARTITION BY C.item_id ORDER BY SUM(C.sales) DESC) 순위
  FROM customer A, reservation B, order_info C, address D
  WHERE A.customer_id = B.customer_id
  AND   B.reserv_no   = C.reserv_no
  AND   A.zip_code    = D.zip_code
  AND   B.cancel = 'N'
  AND   C.item_id = 'M0001'
  GROUP BY A.customer_id, C.item_id, A.customer_name,  NVL(A.job,'정보없음'), D.address_detail
) A
WHERE A.순위 <= 10
GROUP BY A.직업
ORDER BY COUNT(A.직업) DESC;
---------------------------------------------------

[분석16]

SELECT *
 FROM (
       SELECT A.고객아이디,
              A.고객이름,
              D.product_name 상품명,
              SUM(C.sales) 상품매출,
              RANK() OVER(PARTITION BY A.고객아이디 ORDER BY SUM(C.sales) DESC) 선호도순위
       FROM
       (
          SELECT A.customer_id       고객아이디,
                 A.customer_name     고객이름,
                 SUM(C.sales)        전용상품_매출
          FROM customer A, reservation B, order_info C
          WHERE A.customer_id = B.customer_id
          AND   B.reserv_no   = C.reserv_no
          AND   B.cancel = 'N'
          AND   C.item_id = 'M0001'
          GROUP BY A.customer_id, A.customer_name
          HAVING SUM(C.sales) > = 216000  
      ) A, reservation B, order_info C, item D
      WHERE A.고객아이디 = B.customer_id
      AND   B.reserv_no   = C.reserv_no
      AND   C.item_id     = D.item_id
      AND   D.item_id     <> 'M0001'
      AND   B.cancel = 'N'
      GROUP BY A.고객아이디, A.고객이름, D.product_name
) A
WHERE A.선호도순위 = 1;







