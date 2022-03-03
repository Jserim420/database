# DCL
- 특정 사용자의 권한을 제어할 수 있는 명령어
- 데이터베이스에 존재하는 데이터의 보호와 보안을 위해 유저의 권한을 관리하기 위해 사용
- **DDL문의 일종으로서 커밋 혹은 롤백이 필요없이 실행하는 순간 적용**
- ```GRANT``` : 권한 부여
- ```REVOKE``` : 권한 회수

<BR><BR>

## ```GRANT``` 
- 사용자에게 권한을 부여할 때 사용
```SQL
GRANT 권한 [ON 테이블명] TO 사용자명;
```

```SQL
GRANT CREATE SESSION TO SERIM; -- SERIM 사용자에게 접속권한 부여
GRANT CREATE TABLE TO SERIM; -- 사용자에게 테이블생성 권한 부여
GRANT SELECT ON TB_A TO SERIM; -- 사용자에게 TB_A 테이블의 조회 권한 부여
GRANT INSERT, DELETE, UPDATE ON TB_A TO SERIM; -- 사용자에게 테이블 DML 권한 부여
```

## ```REVOKE```
- 사용자의 권한을 회수할 때 사용
```SQL
REVOKE 권한 [ON 테이블명] FROM 사용자명;
```
 ```SQL
REVOKE SELECT ON TB_A FROM SERIM; -- 사용자에게 테이블 조회권한 회수
REVOKE INSERT, DELETE, UPDATE ON TB_A FROM SERIM; -- 사용자에게 테이블 DML 권한 회수
REVOKE CREATE TABLE FROM SERIM; -- 사용자에게 테이블 생성권한 회수
REVOKE CREATE SESSION FROM SERIM; -- 사용자에게 접속권한 회수
```

## ```ROLE```
- DBMS 사용자를 생성하면 기본적으로 많은 권한을 부여해야 한다.

- 많은 DBMS 에서는 DBMS 관리자가 사용자별로 권한을 관리해야 하는 부담과 복잡함을 줄이기 위해 다양한 권한을 그룹으로 묶어 관리할 수 있도록 사용용자와 권한 사이에서 중개 역할을 수행하는 ```ROLE```을 제공한다.

```SQL
CREATE ROLE CREATE_USER; -- CREATE_USER에 역할 생성
GRANT CREATE SEESION, CREATE TABLE TO CREATE_USER; -- 역할에 권한 부여
GRANT CREATE_USER TO SERIM; -- SERIM에 CREATE_USER 역할 부여
```

- 대표적인 ROLE (ROLE명 : 부여 권한)
    - ```CONNECT``` : CREATE SESSION
    - ```RESOURCE``` : CREATE CLUSTER, PROCEDURE, TYPE, SEQUENCE, TRIGGER, OPERATOR, TABLE, INDEXTYPE

<BR><BR>

## 사용자 계정 제거 와 재생성
```SQL
DROP USER SERIM CASCADE; -- 사용자와 함께 생성한 테이블도 같이 제거
CREATE USER SERIM IDENTIFIED BY 1234; -- 사용자 생성
GRANT CONNECT, RESOURCE TO SERIM; -- 사용자에게 권한 부여
```