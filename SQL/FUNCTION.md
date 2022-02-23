# 함수
- 단일행 함수 : 내장 함수 중 입력값에 대해 단 하나의 출력값을 리턴하는 함수
- ```SELECT```, ```WHERE```, ```ORDER BY``` 절에 사용 가능
- 각 행들에 대해 개별적으로 작용하여 데이터 값들을 조작하고, 각각의 행에 대한 조작 결과 리턴

<BR>

## 1. 문자형 함수 
- 문자를 입력하면 문자나 숫자 값을 반환
- ```LOWER```, ```UPPER```, ```SUBSTR```, ```LENGTH```, ```LTRIM```, ```RTRIM```, ```TRIM```, ```ASCII```
```SQL
SELECT
LOWER('SQL Developer'), -- 소문자로 변환
UPPER('SQL Developer'), -- 대문자로 변환
ASCII('A'), -- 알파벳의 아스키 코드값 반환
CHR('65'), -- 아스키 코드의 문자 반환
CONCAT('SQL','Developer'), -- 두개의 문자열 합침
SUBSTR('SQL Developer', 1,3), -- 문자열의 첫번째 문자부터 세번째문자열까지만 출력
LENGTH('SQL'), -- 문자열의 길이 출력
LTRIM(' SQL'), -- 왼쪽 공백 제거
RTRIM('SQL ') -- 오른쪽 공백 제거
FROM DUAL;
```

<bR>

## 2. 숫자형 함수
- 숫자를 입력하면 숫자 값을 반환
- ```ABS```, ```MOD```, ```ROUND```, ```TRUNC```, ```SIGN```, ```SHR```, ```CEIL```, ```FLOOR```, ```EXP```, ```LOG```, ```LN```, ```POWER```, ```SIN```, ```COS```, ```TAN```
```SQL
SELECT
ABS(-1), -- 절대 값 반환
SIGN(1), -- 사인 값 반환
MOD(4,3), -- 두 값을 나눴을 때 나머지 반환
CEIL(22.1), -- 무조건 올림
FLOOR(22.9), -- 무조건 내림
ROUND(22.839, 2) -- 소수점 두번째 자리수에서 반올림
ROUND(22.839, -1), -- 10의 자리에서 반올림
TRUNC(22.839, 2) -- 소수점 두번째 자리에서 자름
FROM DUAL;
```

<BR>

## 3. 날짜형 함수
- DATE 타입의 값을 연산 
- ```SYSDATE```, ```EXTRACT```, ```TO_NUMBER```
```SQL
SELECT
SYSDATE, -- 현재 년월일시분초 출력
EXTRACT(YEAR FROM SYSDATE), -- 년(YEAR)/월(MONTH)/일(DAY) 출력
TO_NUMBER(TO_CHAR(SYSDATE,'YYYY')) --년(YYYY)/월(MM)/일(DD)/시(HH24)/분(MI)/초(SS) 출력
FROM DUAL;
```
- 날짜형 데이터 연산
```SQL
SELECT
SYSDATE -1, -- 현재에서 하루 빼기
SYSDATE -(1/24), -- 현재에서 1시간 빼기
SYSDATE -(1/24/60), -- 현재에서 1분 빼기
SYSDATE -(1/24/60/60), -- 현재에서 1초 빼기
SYSDATE -(1/24/60/60) * 10 -- 현재에서 10초 빼기
FROM DUAL;
```

<BR>

## 4. 변환형 함수
- 문자, 숫자, 날짜형의 데이터형을 다른 데이터형으로 형변환
- ```TO_NUMBER```, ```TO_CHAR```, ```TO_DATE```, ```CONVERT```
```SQL
SELECT
TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS'), -- 날짜형을 문자형으로 변환
TO_CHAR(10.25, '$999999999.99'), -- 숫자형을 문자형으로 변환
TO_NUMBER('100')+TO_NUMBER('100'), -- 문자형을 숫자형으로 변환
TO_DATE(TO_CHAR(SYSDATE, 'YYYYMMDD'), 'YYYYMMDD') -- 날짜형을 문자형으로 변환 후 다시 날짜형으로 변환
FROM DUAL;
```

<BR>

## 5. NULL 관련 함수
- ```NULL```을 처리하기 위한 함수
- ```NVL```, ```NULLIF```, ```COALESCE```
- ```NULL``` : 어떠한 값고 가지지 않고 있다는 뜻으로 빈칸과 같은 개념으로서 이용할 수 없는, 할당되지 않은, 적용 불가능을 의미
- ```NULL```이 포함된 산술식의 결과는 언제나 ```NULL```
```SQL
SELECT
NVL(koResidence, '서울시'), -- 해당 칼럼이 NULL이면 '서울시'로 출력
NULLIF('SQL','SQL'), -- 두 문자열이 같다면 NULL 출력
NULLIF('SQL','SQLD'), -- 두 문자열이 다르면 첫 번째 문자열 출력
COALESCE(NULL, 'SQL', 'SQLD') -- NULL이 아닌 첫 번째 인자 출력
FROM DUAL;
```
```NVL```함수 : 첫 번째 인자로 들어오는 값 혹은 표현식이 NULL인 경우 두 번째 인자의 값이나 표현식을 리턴해주는 함수

<BR>

## 6. 집계함수
- 각각의 그룹별로 단 하나의 행을 리턴해주는 함수
- 여러 행들의 그룹이 모여서 그룹당 단 하나의 결과 행을 되돌려주는 함수

|항목|결과|
|---|-----|
|COUNT(*)| NULL 값을 포함한 행의 수를 출력
|COUNT(표현식)| 표현식의 값이 NULL이 아닌 행의 수를 출력
|SUM(표현식)| 표현식이 NULL 값이 것을 제외한 합계 출력|
|AVG(표현식)| 표현식이 NULL 값인 것을 제외한 평균 출력
|MAX(표현식)| 표현식이 NULL 값이 것을 제외한 최대값 출력
|MIN(표현식)| 표현식이 NULL 값이 것을 제외한 최소값 출력
|STDDEV(표현식)| 표현식이 NULL 값이 것을 제외한 표준편차 출력|
|VARIAN(표현식)| 표현식이 NULL 값이 것을 제외한 분산 출력|

- 공집합과 ```MAX``` 함수
    - 집계 함수인 ```MAX``` 함수와 단일행 내장 함수인 ```NVL``` 함수를 사용하면 집계 결과가 공집합일 경우라도 값을 출력할 수 있다.
    - ```MAX``` 함수는 공집합일 경우라도 어떻게든 행을 리턴하며, 리턴되는 값은 ```NULL```이다.
    - ```MAX``` 함수의 특성을 이용하여 조회대상 칼럼을 ```MAX``` 함수로 감싼 후, ```NVL``` 함수를 이용하여 ```NULL``` 이면 지정한 값으로 출력
        ```SQL
        SELECT NVL(MAX(칼럼명), '없음')
        ```
        - **칼럼명이 NULL일 경우 '없음'을 출력**

- 집계함수와 ```NULL```
    - ```NULL```은 집계 함수의 계산에 포함되지 않는다.(집계 대상에서 제외)
    ```
    NULL이 포함되어 있는 데이터에서
    COUNT(*) 과 COUNT(NUM)은 다르다.
    ```

<BR><BR>

# 그룹함수
- 특정 집합의 소계/중계/합계/총합계를 구할 때 사용

```해당 예시는 https://androphil.tistory.com/166 [소림사의 홍반장!] 를 참고했습니다.```

## ```ROLLUP```
- 소그룹 간의 소계 계산
- ```ROLLUP``` 함수 내에 인자로 지정된 그룹화 칼럼은 소계를 생성하는 데 사용
- 그룹화 칼럼의 수가 N이라고 했을 때 N+1의 소계 생성
- ```ROLLUP``` 함수 내의 인자 순서가 바뀌면 결과도 바뀜(```ROLLUP```은 계층 구조)

- ***예시 1*** : 직업별로 급여 합계와 총계를 구하기
    ```SQL
    SELECT job, SUM(sal) 
    FROM emp 
    GROUP BY ROLLUP(job);
    ```
    > 결과
    ```
    JOB        | SUM(SAL) 
    ---------- |---------- 
    ANALYST    | 6000 
    CLERK      | 3200 
    MANAGER    | 33925 
    PRESIDENT  | 5000 
    SALESMAN   | 4000
               | 52125
    ```

- ***예시 2*** : 부서 별 급여 합계와 전체 사원 수 및 전체 급여 합계와 전체 사원 수 구하기
    ```SQL
    SELECT b.dname, a.job, SUM(a.sal) sal, COUNT(a.empno) emp_count 
    FROM emp a, dept b 
    WHERE a.deptno = b.deptno 
    GROUP BY ROLLUP(b.dname, a.job)
    ```
    > 결과
    ```
    DNAME      | JOB        | SAL        | EMP_COUNT 
    ---------- | ---------- | ---------- | ---------- ACCOUNTING | CLERK      | 1300       | 1 
    ACCOUNTING | MANAGER    | 2450       | 1 
    ACCOUNTING | PRESIDENT  | 5000       | 1 
    ACCOUNTING |            | 8750       | 3 
    -- ACCOUNTING 부서의 급여 합계와 전체 사원 수 
    
    RESEARCH   | ANALYST    | 6000       | 2 
    RESEARCH   | CLERK      | 1900       | 2 
    RESEARCH   | MANAGER    | 2975       | 1 
    RESEARCH   |            | 10875      | 5 
    -- RESEARCH 부서의 급여 합계와 전체 사원 수 

    SALES      | MANAGER     | 28500     | 1
    SALES      | SALESMAN    | 4000      | 3 
    SALES      |             | 32500     | 4 
    -- SALES부서의 급여 합계와 전체 사원 수

               |             | 52125     | 12 
    -- 전체 급여 합계와 전체 사원 수
    ```

<BR>

## ```CUBE```
- 인자로 기재한 칼럼에 대한 다차원 합계를 계산
- ***예시***
    ```SQL
    SELECT b.dname, a.job, SUM(a.sal) sal, COUNT(a.empno) emp_count 
    FROM emp a, dept b 
    WHERE a.deptno = b.deptno 
    GROUP BY CUBE(b.dname, a.job)
    ```
    > 결과
    ```
    DNAME      | JOB        | SAL        | EMP_COUNT 
    ---------- | ---------- | ---------- | ---------- ACCOUNTING | CLERK      | 1300       | 1 
    ACCOUNTING | MANAGER    | 2450       | 1 
    ACCOUNTING | PRESIDENT  | 5000       | 1 
    ACCOUNTING |            | 8750       | 3 
    -- ACCOUNTING 부서의 직업별 급여의 총계와 사원 수 
    
    RESEARCH   | ANALYST    | 6000       | 2 
    RESEARCH   | CLERK      | 1900       | 2 
    RESEARCH   | MANAGER    | 2975       | 1 
    RESEARCH   |            | 10875      | 5 
    -- RESEARCH 부서의 직업별 급여의 총계와 사원 수 
    
    SALES      | MANAGER    | 28500      | 1 
    SALES      | SALESMAN   | 4000       | 3 
    SALES      |            | 32500      | 4 
    -- SALES 부서의 직업별 급여 총계와 사원 수

               | ANALYST    | 6000       | 2 
               | CLERK      | 3200       | 3 
               | MANAGER    | 33925      | 3 
               | PRESIDENT  | 5000       | 1 
               | SALESMAN   | 4000       | 3 
               |            | 52125      | 12 
    -- 직업별 급여의 총계와 사원 수
    ```

<BR>

## ```GROUPING```
- ```ROLLUP, CUBE```에 모두 사용 가능
- 해당 행이 ```GROUP BY```에 의해서 산출된 행인 경우에는 0을 반환
- ```ROLLUP```이나 ```CUBE```에 의해서 산출된 행인 경우에는 1을 반환
- **해당 행 결과집합에 의해 산출된 데이터 인지, ```ROLLUP```이나 ```CUBE```에 의해서 산출된 데이터 인지를 알 수 있도록 지원하는 함수**

<BR>

## ```GROUPING SETS```
- 합계 데이터 출력
- ***예시1*** : 직업과 총 인원수 구하기
    ```SQL
    SELECT job, deptno, COUNT(*) cnt
    FROM emp
    GROUP BY GROUPING SETS((job,deptno), ())
    -- 빈괄호()는 전체합계를 뜻함
    ```
    > 결과
    ```
    JOB      | DEPTNO  | CNT
    -------- | ------- | ------
    ANALYST  | 20      | 2
    MANAGER  | 10      | 1
    MANAGER  | 20      | 1
    MANAGER  | 30      | 1
    SALESMAN | 10      | 1
    SALESMAN | 20      | 1
    SALESMAN | 30      | 2
             |         | 9
    ```

- ***예시2*** : 직업, 부서별, 총 인원수 구하기
    ```SQL
    SELECT job, deptno, COUNT(*) cnt
    FROM emp
    GROUP BY GROUPING SETS(job, (job, deptno), ()) ;
    ```
    > 결과
    ```
    JOB      | DEPTNO  | CNT
    -------- | ------- | ------
    ANALYST  | 20      | 2
    ANALYST  |         | 2
    MANAGER  | 10      | 1
    MANAGER  | 20      | 1
    MANAGER  | 30      | 1
    MANAGER  |         | 3
    SALESMAN | 10      | 1
    SALESMAN | 20      | 1
    SALESMAN | 30      | 2
    SALESMAN |         | 4
             |         | 9
    ```


# 윈도우 함수
- 누적합계, 누적비율, 누적등수 등 각각의 행들의 관계에서 연산 처리
- 누척 호출 불가능

<BR>

## 윈도우 함수 문법
    
```sql
SELECT
    윈도우함수(인자) OVER (PARTITION BY 칼럼 ORDER BY 칼럼)
    윈도우절(ROWS|RANGE BETWEEN UNBOUNDED PRECEDING | CURRENT ROW
                            AND UNBOUNDED FOLLOWING | CURRENT ROW)
FROM 테이블명;
```

- 윈도우함수 : 윈도우함수 기재
- 인자 : 윈도우 함수에 따라 0개 혹은 그 이상의 인자 값
- ```OVER``` : 윈도우 함수 사용 시 ```OVER```는 반드시 작성
- ```PARTITION BY``` : ```FROM```절 이하에서 나온 결과집합을 특정 칼럼을 기준으로 그룹화
-```ORDER BY``` : 기재한 정렬 기준에 따라 윈도우 함수의 결과가 상이
- 윈도우 절
    - 윈도우 함수가 연산을 처리하는 대상이 되는 행의 범위 지정
    - ```ROWS``` : 물리적인 결과 행의 수 (조회된 ROW 하나하나를 대상으로 연산)
    - ```RANGE``` : 논리적인 값에 의한 범위 (정렬된 칼럼에 같은 값이 존재하는 행이 여러개일 경우 동일한 칼럼값을 가지는 모든 행들을 묶어서 연산)
    - ```BETWEEN ~ AND``` : 행 범위의 시작과 끝 지정
    - ```UNBOUNDED PRECEDING``` : 행 범위의 시작 위치가 전체 행 범위에서 첫 번째 행임을 의미
    - ```UNBOUNDED FOLLOWING``` : 행 범위의 마지막 위치가 전체 행 범위에서 마지막 행임을 의미
    - ```1 PRECEDING``` : 행 범위의 시작 위치가 1만큼 이전 행임을 의미
    - ```1 FOLLOWING``` : 행 범위의 마지막 위치가 1만큼 다음 행임을 의미

<bR>

## 윈도우 함수 종류
1. 순위 관련 함수
    - ```RANK``` : 지정한 기준에 따라 순위를 구하고 동일 순위가 있다면 건너뛰고 다음 순위 산출 (1등, 2등, 2등, 4등)
    - ```DENSE_RANK``` : 지정한 기준에 따라 순위를 구하고 동일 순위가 있다면 건너뛰지 않고 다음 순위 산출 (1등, 2등, 2등, 3등)
    - ```ROW_NUMBER``` : 지정한 기준에 따라 순위를 구하고 동일 순위가 있어도 무조건 순위 산출 (1등, 2등, 3등, 4등)

2. 집계 관련 함수
    - ```SUM```, ```MAX```, ```MIN```, ```AVG```, ```COUNT```
        - 지정한 기준에 따라 [합계, 최대값, 최소값, 평균값, 개수] 산출

3. 행순서 관련 함수
    - ```FIRST_VALUE```, ```LAST_VALUE```, ```LAG```, ```LEAD```
        - 지정한 기준에 따라 [가장 먼저 나오는 값, 가장 나중에 나오는 값, 이전값, 다음값] 산출

4. 그룹 내 비율 관련 함수
    - ```CUME_DIST``` : 지정한 기준에 따라 누적백분율을 구하고 속적으로 누적되다가 최종행은 1이 된다.
    - ```PERCENT_RANK``` : 지정한 기준에 따라 각행의 순서별 백분율을 구하고, 제일 먼저 나오는 것을 0, 가장 늦게 나오는 것을 1로 한다.
    - ```NTILE``` : 지정한 기준에 따라 특정 값으로 N등분한 결과 산출
    - ```RATIO_TO_REPORT``` : 지정한 기준에 따라 각 행이 차지하는 비율 산출