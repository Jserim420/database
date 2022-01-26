# DML (데이터 조작어)
- 테이블의 데이터를 입력/수정/삭제/조회하는 역할
- 입력(```INSERT```), 수정(```UPDATE```), 삭제(```DELETE```), 조회(```SELECT```)

## 1. ```INSERT```
- 테이블에 데이터를 신규로 입력할 때 사용
- 신규데이터 입력
    ```sql
    INSERT INTO subwayStation T (T.stationNo, T.lineName, T.stationName)
    VALUES ('00001', '신분당선', '판교');
    -- 해당 테이블의 (칼럼)에 ('칼럼값') 입력
    COMMIT; -- DB에 최종적으로 커밋(영구저장)
    ```

<BR>

## 2. ```UPDATE```
- 테이블 내 행의 칼럼값 수정
- 한번의 ```UPDATE```문 실행으로 여러 개의 행에 대한 여러 개의 칼럼 수정 가능
- 데이터 수정
    ```sql
    UPDATE subwayStation A
    SET A.lineName = '빨간색', A.stationName = '동판교'
    WHERE A.stationNo = '00001';
    -- 조건에 부합하는 해당 테이블의 (칼럼을 '해당칼럼값')으로 변경한다.
    COMMIT; -- 커밋
    ```

<BR>

## 3. ```DELETE```
- 테이블의 내의 행 삭제
- 한번의 ```DELETE```문 실행으로 여러개의 행 삭제 가능
- 조건에 부합하는 행을 삭제할 수 있으며, 수행 후 커밋 혹은 롤백이 가능하다.
- 하지만 [```TRUNCATE TABLE```](https://github.com/Jserim420/database/blob/main/SQL/DDL.md#4-%EA%B8%B0%ED%83%80)문은 테이블 전체를 삭제하며, 한 번 실행하면 롤백이 불가능하다.
- 데이터 삭제
    ```sql
    DELETE FROM subwayStation A
    WHERE A.stationNo = '00001';
    -- 조건에 부합하는 해당테이블의 행을 삭제한다.
    COMMIT;
    ```

<BR>

## 4. ```SELECT```
- 테이블에서 데이터를 조회하는 데 사용
- 데이터 조회
    ```SQL
    SELECT A.stationNo, A.lineName, A.stationName
    -- 해당 칼럼을 조회한다.
    FROM subwayStation A
    -- 해당 테이블의
    WHERE stationName = '동판교' ;
    -- 역이름이 동판교인(조건)
    ```

- ```SELECT``` 문의 조회 순서
    
    ```FROM```절 > ```WHERE```절 > ```GROUP BY```절 > ```HAVING```절 > ```SELECT```절 > ```ORDER BY```절

    1. ```FROM``` (조회 테이블을 참조한다.)
    2. ```WHERE``` (조회 대상 행을 조회한다.)
    3. ```GROUP BY``` (대상 행을 그룹화한다.)
    4. ```HAVING``` (그룹화한 값에서 조건에 맞는 것을 출력한다.)
    5. ```SELECT``` (```SELECT```절에 기재한 칼럼이나 식을 계산한다.)
    6. ```ORDER BY``` (출력되는 결과집합을 정렬한다.)

<BR>

## 5. 기타

1. ```DISTINCT```
    - SQL문의 결과집합이 중복된 행이 존재하는 상황에서 SELECT절 맨 앞에 DISTINCT를 사용하면 중복된 행이 제거되어 유일한 값을 가진 행만 출력
        ```SQL
        SELECT DISTINCT A.gender
        FROM koPopulation A
        ```
        > 결과
        ```
        gender  |
        ---------
        F       |
        M       |
        ```       
    - 2개의 칼럼 출력 : 두 칼럼의 중복을 제거
        ```sql
        SELECT DISTINT A.gener, A.livePlace
        FROM koPopulation A
        ```
        > 결과 
        ```
        gender  | livePlace |
        --------|-----------|
        F       | 001       |
        M       | 003       |
        F       | 003       |
        F       | 002       |
        ···
        ```

2. ```SELECT *```
    - FROM절 내 테이블이 가지고 있는 모든 칼럼 출력
        ```SQL
        SELECT * FROM koPopulation A
        ```

3. ```AS``` (앨리어스)
    - 테이블 및 칼럼에 앨리어스를 지정할 수 있다.
        ```sql
        SELECT A.gender AS 성별, A.livePlaceName AS 거주지명, A.clientNo AS 회원번호
        FROM koPopulation A
        WHERE livePlaceName = '서울';
        ```
        > 결과
        ```
        성별    | 거주지명  | 회원번호
        F       | 서울      | 0001
        F       | 서울      | 0002
        M       | 서울      | 0007
        F       | 서울      | 1230
        M       | 서울      | 0025
        ···
        ```

4. ```DUAL```
    - 오라클 DB의 기본적인 테이블 DUAL을 이용한 다양한 연산 기능
    - 칼럼 DUMMY, 칼럼값 'X'
        ```SQL
        SELECT ((1+9)*5)/2 AS 연산결과
        FROM DUAL;
        ```