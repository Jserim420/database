# DDL (데이터 정의어)

- 테이블/인덱스 등과 같은 데이터베이스 객체의 구조를 정의하는 데 사용하는 명령어
- 데이터 구조를 생성/변경/삭제하거나 이름을 바꾸는 데 사용하는 명령어

<br>

##  1. 데이터타입
 - CHAR(L) : 고정길이 문자열, 저장하고자 하는 데이터가 L값보다 작을경우 공백으로 채워짐
- VARCHAR2(L) : 가변길이 문자열, 저장하고자 하는 데이터의 값만큼만 저장, 공백도 문자로 취급
- NUMBER(L,D) : 정수 및 실수 저장, L값은 전체 자릿수, D값은 소수점 자리수
- DATE : 날짜와 시각정보 저장, 년월일시분초 저장

<br>

## 2. ```CREATE```
```sql
CREATE TABLE tableName();
-- tableName을 이름으로 하는 새로운 테이블 생성
``` 

```sql
CREATE TALBE subStationTK
(
    subStationNo char(6) not null,
    dateYM char(6) not null,
    beginTime char(4) not null,
    endTime char(4) not null,
    TKCode varchar2(6) not null,
    TKCount number(15) not null,
    constraint PK_substationTK primary key(substationNo, dateYM, beginTime, endTime, TKCode, TKCount)
 ); 
 ```
 - ```not null``` : 필수 값 속성, ```null ``` 입력을 금지한다.
 - ```constraint``` : 제약조건
 - ```primary key``` : ```null``` 입력이 불가능하며, 테이블에 저장된 행들 중 특정 행을 고유하게 식별하기 위해 생성된다.

<BR>

 ## 3. ```ALTER```
- ```ALTER```는 칼럼 및 제약조건을 추가/수정/제거하는 데 이용한다.

- 칼럼추가
    ```sql
    alter table subwayStation add (openYN char(1));
    -- 해당 테이블에 새로운 칼럼을 추가
    ```
- 칼럼 제거
    ```sql
    alter table subwayStation drop column openYN;
    -- 해당 테이블의 칼럼 값을 삭제
    ```
- 데이터형 및 제약조건 변경
    ```sql
    alter table subwayStation add (openYN char(1) null);
    alter table subwayStation modify (openYN number(1) default 0 not null novalidate);
    -- 해당 테이블의 칼럼 변경
    ```
    - ```null``` : ```null``` 값을 허용한다.
    - ```default``` : 데이터 입력 시 아무런 값도 넣지 않은 경우 default값으로 입력
    - ```novalidate``` : ```modify```하려는 속성의 값 중에서 ```null```인 칼럼이 있어도 ```not null``` 제약조건을 줄 수 있다. 하지만, 이후에 들어오는 데이터의 해당 속성값은 반드시 ```not null```이어야 한다.

- 칼럼명 변경
    ```sql
    alter table subwayStation rename column openYN to operYN;
    -- 해당 테이블의 칼럼의 이름을 변경한다.
    ```

- 외래키 생성
    ```sql
    alter table subStationTK add constraint FK_subStationTK1 foreign key (subStationNo) references subwayStation (stationNo);
    -- subStationTk 테이블에 참조 무결성 제약조건(FK)를 생성하고, subStationTK 테이블의 subStationNo 칼럼은 subwayStation 테이블의 stationNo를 참조하는 FK_subStationTK1가 된다.
    ```
    - ```constraint``` [FK명] ```foreign key```(FK가 될 컬럼명)
     ```references``` [PK가 위치하는 테이블] (PK컬럼명)

<br>

- 외래키 제거
    ```sql
    alter table subStationTK drop constraint FK_subStationTK1
    -- 해당 테이블의 외래키를 제거한다.
    ```

<br>

## 4. 기타 
- 테이블명 변경
    ```SQL
    rename subStationTK to subStationTK2;
    ```
- 테이블 내 데이터 제거
    ```sql
    truncate table subStationTK2;
    -- 데이블 객체는 그대로 두고 내부의 데이터만 영구적으로 제거
    ```
- 테이블 제거
    ```sql
    drop table subwayStation;
    drop table subStationTK2;
    ```
