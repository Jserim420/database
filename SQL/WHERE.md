# WHERE절
- 테이블에 존재하는 모든 데이터를 조회하는 경우도 있지만, 대부분의 경우에는 필요한 데이터만을 조회, 추출하게 된다.
- 이 경우 ```WHERE```절을 이용하여 추출되는 행을 제한한다.
```SQL
SELECT B.clientNo, B.clientName, B.clientAdd
FROM bankClient B
WHERE clientAdd LIKE '%경기도%';
```
은행고객(bankClient) 테이블에서 고객의 주소(clientAdd) 칼럼의 값이 '경기도'라는 단어를 포함하는 행을 출력

- ```SELECT```문 사용 시 사용자들은 원하는 자료만 검색하기 위해 ```WHERE```절을 이용하여 출력 데이터의 행을 제한한다.
<BR><BR><BR>

# 연산자
- ```WHERE```절에서 대상 칼럼과 입력값을 비교하는 데 사용한다.

## 1. **비교연산자** : 숫자 값 혹은 문자 값의 크기를 비교하는데 사용

|연산자|연산자의 의미|
|---|-----|
|=|~와 같다.|
|>|~보다 크다.|
|>=|~보다 크거나 같다.|
|<| ~보다 작다.
|<=|~보다 작거나 같다.

<BR>

## 2. **SQL 연산자** : SQL문에서 사용하도록 기본적으로 예약되어 있는 연산자

|연산자|연산자의 의미|
|---|-----|
|BETWEEN A AND B|A와 B 사이에 있으면 된다.|
|IN (리스트)|리스트에 있는 값 중 하나라도 있으면 된다.|
|LIKE '비교문자열'|비교문자열의 형태와 일치하면 된다. (와일드카드 사용)|
|IS NULL|값이 NULL이면 된다.
|IS NOT NULL| 값이 NULL이 아니면 된다.

- <U>(1) ```LIKE``` 연산</U>
    - ```LIKE``` 연산자 사용 시 ***퍼센트(%)*** 라는 와일드카드를 사용해 행을 조회한다.


        ```SQL
        SELECT B.clientNo, B.clientName, B.clientAdd
        FROM bankClient B
        WHERE clientName LIKE '김%';
        ```
        - 고객 이름(clienName) 칼럼의 값이 '김'으로 시작하는 행을 출력
        - 첫 시작이 '김'이라면 뒤에는 어떤 문자가 오든지 상관없이 조회가 가능하다. (아무런 문자가 오지 않아도 추출)

    <BR>

    - ```LIKE``` 연산자 사용 시 ***언더바(_)*** 와일드카드를 사용해 행을 조회한다.
        ```SQL
        SELECT B.clientNo, B.clientName, B.clientAdd
        FROM bankClient B
        WHERE clientName LIKE '김_';
        ```
        - 고객 이름(clienName) 칼럼의 값이 '김'으로 시작하고 뒤에 1개의 문자만 존재하는 행을 출력
        - **'김'으로 시작하면서 뒤에 문자가 단 1개만 존재하면 추출**

    <BR>

    - 퍼센트(%)와 언더바(_) 함께 사용
        ```SQL
        SELECT B.clientNo, B.clientName, B.clientAdd
        FROM bankClient B
        WHERE clientName LIKE '김_%';
        ```
        - 고객 이름(clienName) 칼럼의 값이 '김'으로 시작하고 뒤에 1개의 문자만 존재하며, 그 뒤에는 어떠한 문자가 오든지 상관없이 행을 출력
        - **'김'으로 시작하면서 뒤에 문자가 1개 이상만 되면 추출**
    
<BR>

- <U>(2) ```IS NULL``` 연산</U>
    - 칼럼이 ```NULL```인 행을 조회하는 SQL문
    - 특정 칼럼의 값이 ```NULL```인 데이터를 추출할 경우 ```IS NULL``` 연산자를 사용
        ```SQL
        SELECT B.clientNo, B.clientName, B.clientAdd
        FROM bankClient B
        WHERE clientAdd IS NULL;
        ```
        - 고객의 주소(clientAdd) 칼럼의 값이 ```NULL```인 행을 출력
    - NULL 비교 시 "=" 연산자를 사용하면 데이터가 1건도 나오지 않는 공집합이 리턴

- <U>(3) ```IS NOT NULL``` 연산</U>
    - 칼럼이 ```NOT NULL```인 행을 조회하는 SQL문
         ```SQL
        SELECT B.clientNo, B.clientName, B.clientAdd
        FROM bankClient B
        WHERE clientAdd IS NOT NULL NULL;
        ```
        - 고객의 주소(clientAdd) 칼럼의 값이 ```NOT NULL```인 행을 출력

<BR>

## 3. **논리연산자** : 비교 연산자 혹은 SQL 연산자로 이루어진 여러 개의 조건들을 논리적으로 조합하기 위해 사용하는 연산자
|연산자|연산자의 의미|
|---|-----|
|AND| 앞 조건과 뒤 조건이 모두 참이어야 한다.
|OR| 앞 조건과 뒤 조건 중 하나라도 참이어야 한다.
|NOT| 조건이 거짓이면 된다.

- 경기도에 존재하는 은행 중 국민은행, 신한은행 매장을 찾는다.
- 하남시에 존재하는 매장은 집합에서 제외한다.
```SQL
SELECT B.bankName AS 은행명, B.branchName AS 지점이름, B.branchAdd AS 지점주소
FROM bankBranch B
WHERE B.branchAdd LIKE '경기도%'
AND
(
    B.bankName LIKE '%국민은행%',
    B.bankName LIKE '%신한은행%'
)
AND NOT B.branchAdd LIKE '%하남시%'
```

> 결과 (출력된 지점이름과 지점주소는 실제가 아님)
```
은행명   | 지점이름     | 지점주소          |
--------------------------------------------
국민은행 | 서현점       | 경기도 성남시 ··· |
국민은행 | 분당점       | 경기도 성남시 ··· |
신한은행 | 야탑점       | 경기도 성남시 ··· |
국민은행 | 야탑점       | 경기도 성남시 ··· |
신한은행 | 용인시청점   | 경기도 용인시 ··· |
신한은행 | 수지구청점   | 경기도 용인시 ··· |
신한은행 | 일산시청점   | 경기도 일산시 ··· |
국민은행 | 수지점       | 경기도 용인시 ··· |
···
```

<BR>

## 4. **부정연산자**
- 비교 연산자의 부정표현은 부정 비교 연산자로, SQL 연산자의 부정표현은 부정 SQL 연산자로 가능

- (1) 부정 비교 연산자
    |연산자|연산자의 의미|
    |---|-----|
    |!=, <>, ^=|같지 않다.|
    |NOT 칼럼명 =|~칼럼의 값이 ~와 같지 않다.|
    |NOT 칼럼명 >|~칼럼의 값이 ~보다 크지 않다.
    |NOT 칼럼명 <|~칼럼의 값이 ~와 작지 않다.

- (2) 부정 SQL 연산자
    |연산자|연산자의 의미|
    |---|-----|
    |NOT BETWEEN A AND B| A와 B의 값 사이에 있지 않다.
    |NOT IN(LIST)| LIST를 포함하지 않는다.
    |IS NOT NULL| NULL 값이 아니다.
    