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
