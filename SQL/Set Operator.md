# 집합 연산자 (SET OPERATOR)
- ```SELECT```문의 결과집합 간의 연산을 수행하는 연산자
- ```UNION```, ```UNION ALL```, ```MINUS```
- 여러개의 SQL문을 하나의 SQL문으로 만드는 연산자

<BR>

<BR>

## ```UNION```
- 여러 개 SQL문의 결과에 대한 합집합
- 중복된 행에 대해 중복을 제거한 유일한 값을 가진 행 출력
- 정렬 발생 가능하지만 정렬을 보장하기 위해 ```ORDER BY``` 문 사용
```SQL
SELECT 문

UNION

SELECT 문
```

<BR>

## ```UNION ALL```
- 여러 개 SQL문의 결과에 대한 합집합
- 중복된 행에 대해 중복을 제거하지 않고 그대로 출력
- 정렬 발생하지 않아 정렬을 보장하기 위해서는 ```ORDER BY``` 문 사용
```SQL
SELECT 문

UNION ALL

SELECT 문
```

<BR>

## ```INTERSECT```
- 여러 개의 SQL문에 대한 교집합 출력
- 중복된 행이 있다면 중복을 제거하고 1개의 행으로 출력
```SQL
SELECT 문

INTERSECT

SELECT 문
```

<BR>

## ```MINUS```
- 위의 SQL문의 결과집합에서 아래의 SQL문의 집합을 뺀 결과 출력
```SQL
SELECT 문

MINUS

SELECT 문
```