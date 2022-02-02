# 계층형 구조(Hierarchical)
- 루트 데이터 : 위에서 아래로 내려가는 하향식 방식을 기준으로 맨 상위에 있는 데이터
- 리프 데이터 : 맨 아래에 있는 데이터
- ```START WITH```, ```CONNECT BY```, ```ORDER SIBLINGS BY```

<BR>

<BR>

## ```START WITH```
- 계층 구조 전개의 시작 위치를 지정
- 루트 데이터 지정
```SQL
WHERE ···
START WITH 테이블 [의 앨리어스 명]. 칼럼명 = 칼럼 값
```

<BR>

## ```CONNECT BY [NOCYCLE] [PRIOR] A AND B```
- 다음에 전개될 자식 데이터를 지정
- ```PRIOR PK[자식] = FK[부모]``` : 부모 → 자식 방향의 순방향 전개
- ```PRIOR FK[부모] = PK[부모]``` : 자식 → 부모 방향의 역방향 전개
- ```NOCYCLE```을 추가하면 사이클이 발생한 이우의 데이터는 전개하지 않음
```SQL
START WITH ···
CONNECT BY PRIOR 테이블 [의 앨리어스 명]. 칼럼명 = 테이블 [의 앨리어스 명]. 칼럼명
```

<BR>

## ```ORDER SIBLINGS BY```
- 형제 노드(동일 계층) 사이에서 정렬 수행
```SQL
CONNECT BY ···
ORDER SIBLINGS BY 테이블 [의 앨리어스 명]. 칼럼명
```

<BR>

## 기타
- 계층형 SQL에서 제공하는 가상 칼럼
    - ```LEVEL ```
        - 루트 데이터면 1 (1부터 시작)
        - 하위 데이터가 있을 때마다 1씩 증가
    - ```CONNECT_BY_ISLEAF```
        - 전개 과정에서 해당 데이터가 리프 데이터면 1, 그렇지 않으면 0
    - ```CONNECT_BY_ISCYCLE```
        - 전개 과정에서 자식을 갖는데 해당 데이터가 조상으로서 존재하면 1, 그렇지 않으면 1
- ```LPAD``` 함수
    - ```LPAD``` 함수는 지정한 길이 만큼 왼쪽부터 특정문자로 채워준다.

```SQL
SELECT ···
, LEVEL 앨리어스 명
, LPAD(' ', 공백 수[정수]*(LEVEL-1)) || 칼럼명 [칼럼명 다음 출력하고자하는 결과물] AS "출력하고자 하는 앨리어스 명"
, CONNECT_BY_ISLEAF AS 앨리어스 명
, CONNECT_BY_ISCYCLE AS
```
- 위의 코드는 계층 레벨에 따라 왼쪽에 공백이 붙도록 함

<BR>

- ```CONNECT_BY_ROOT```
    - 현재 행의 최상위 노드(```SELECT```문 집합 내에서) 를 구한다. 

- ```SYS_CONNECT_BY_PATH```
    - 계층형의 경로를 간편하게 출력

```SQL
SELECT ···
, CONNECT_BY_ROOT 칼럼명 [AS "출력하고자 하는 앨리어스 명"]
, SYS_CONNECT_BY_PATH(칼럼명 [칼럼명 다음 출력하고자하는 결과물], '구분자') AS 출력하고자 하는 앨리어스 명
```