# TCL (트랜잭션 제어어)
- 논리적인 작업 단위를 묶어서 DML에 의해 조작된 결과를 작업 단위별로 적용 및 취소하는 명령어
- 데이터의 입력/수정/삭제 후 커밋 혹은 롤백을 하는데 사용하는 SQL문
- DML문의 입력, 수정, 삭제를 실행하면 DB에 곧바로 적용되지 않고 커밋(```COMMIT```) 명령을 실행해야 한다.
- 데이터를 변경한 후, 커밋 명령을 실행하지 않은 상태라면 롤백(```ROLLBACK```) 명령으로 데이터의 변경을 취소할 수 있다.

<BR>

## 1. 트랜잭션
- DB의 논리적 연산단위로, 1개의 트랜잭션에는 1개 이상의 SQL문이 포함
- 분할할 수 없는 최소의 단위로, 전부 적용하거나 전부 취소하는 ```ALL OR NOTHING```
    - 영화 예매 시스템 : 사용자가 극장, 영화관, 상영시간, 좌석을 모두 선태가고 최종 결제를 해야 영화예매가 완료. 전체의 과정을 하나의 트랜잭션이라고 하며, 중간에 취소한다면 이전에 작업한 내용까지 모두 취소되어 처음으로 돌아간다.
- 트랜잭션의 특징
    - 원자성 : 트랜잭션에서 정의된 연산들은 모두 성공적으로 끝나거나 모두 실패해야 한다. (ALL OR NOTHING)
    - 일관성 : 트랜잭션의 작업처리 결과가 항상 일관성이 있어야 한다.
    - 고립성 : 트랜잭션이 실행되는 도중 다른 트랜잭션의 영항을 받아서는 안된다.
    - 지속성 : 성공적으로 수행된 트랜잭션은 DB에 영구적으로 반영되어야 한다.

<BR><BR>

## 2. ```COMMIT```
- 커밋 이전
    - 변경된 데이터가 DB에 저장되지 않는다.
    - 최종 적용된 상태가 아니고 메모리에만 적용된 상태이므로 변경한 사용자만 볼 수 있을 뿐 다른 사용자들은 변경된 결과를 볼 수 없다.
    - 변경한 사용자는 ```SELECT```문으로 결과를 확인할 수 있지만, 다른 사용자는 결과를 확인할 수 없다.
    - 변경된 행은 락이 설정되므로 다른 사용자가 변경할 수 없다.

    ```SQL
    UPDATE subwayStation
    SET stationName = '판교'
    WHERE stationName = '판교역';

    COMMIT;
    ```

- 커밋 이후 
    - 데이터의 변경 내역이 DB에 완전히 반영되며, 이전 데이터는 영원히 잃어버린다.
    - 변경 사용자뿐만 아니라 모든 사용자가 ```SELECT```문으로 변경 결과를 확인 할 수 있다.
    - 관련된 행에 대한 락이 풀리고, 모든 사용자들이 행을 조작할 수 있다.

<BR><BR>

## 3. ```ROLLBACK```
- 테이블의 데이터를 변경한 후 커밋을 실행하기 전에는 변경사항을 취소할 수 있다. (```ROLLBACK```)
- 롤백을 하면 데이터의 변경 내용이 취소되어 이전 상태로 복구되며, 관련된 행에 대한 락이 해제되어 다른 사용자들이 데이터 변경을 할 수 있게 된다.

    ```SQL
    UPDATE subwayStation
    SET stationName = '판교역'
    WHERE stationName = '판교';

    ROLLBACK;
    ```
    위와 같이 실행하게 되면 데이터 수정 전의 데이터 상태로 돌아간다.

<BR><BR>

## 4. ```SAVEPOINT```
- 하나의 트랜잭션에서 여러개의 변경 사항이 발생할 수 있다.
- 커밋과 롤백으로 여러개의 변경된 내용을 취소하거나 최종 적용할 수 있으므로, 여러 개가 전부 커밋되거나 롤백되는 둘 중 하나의 상황이 발생한다.
- ```SAVEPOINT``` : 롤백 시 트랜잭션에 포함된 데이터 수정을 모두 취소하는 것이 아니라 현 시점에서 ```SAVEPOINT``` 지점까지의 데이터 변경만 취소한다.

```SQL
SAVEPOINT SVPT1; -- 첫번째 SAVEPOINT

UPDATE subwayStation    
SET stationName = '판교역'
WHERE stationName = '판교';

SAVEPOINT SVPT2; -- 두번째 SAVEPOINT

UPDATE subwayStation    
SET stationName = '양재'
WHERE stationName = '양재역';

SAVEPOINT SVPT3; -- 세번째 SAVEPOINT

UPDATE subwayStation    
SET stationName = '강남'
WHERE stationName = '강남역';
```
>세번째 SAVEPOINT까지 롤백
```
ROLLBACK TO SVPT3;
```
>결과확인
```SQL
SELECT T.stationNo, T.lineName, T.stationName
FROM subwayStation T
WHERE T.stationName IN ('판교역', '판교', '양재', '양재역', '강남', '강남역')
```
>결과
```
stationNo | lineName    | stationName  |
----------------------------------------
00001     | 신분당선     | 판교       |
00002     | 신분당선     | 양재       |
00003     | 신분당선     | 강남역     |
```
stationName이 '강남역'인 행을 '강남'으로 수정한 ```UPDATE```문이 롤백된다.

<BR>
<BR>

## 커밋/롤백과는 상관없이 트랜잭션 적용 처리가 일어나는 상황
- DDL문(```CREATE, ALTER, DROP, RENAME, TRUNCATE TABLE```)을 실행하면 그 실행 전과 실행 후 시점에 자동으로 커밋
- DML문(```UPDATE, INSERT, DELETE```)을 실행 후 커밋하지 않고 DDL문을 실행하면 DDL문 실행 전 DML문의 변경 사항이 자동으로 커밋
- DB 접속을 종료하면 자동으로 DML 변경사항 커밋
- 이상 동작으로 인한 DBMS 접속이 단절되었을 때는 데이터의 변경 사항이 자동으로 롤백