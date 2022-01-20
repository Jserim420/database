# GROUP BY
- ```GROUP BY``` 절은 일반적으로 ```FROM```절 아래에 위치하며, ```GROUP BY``` 절에 기재한 칼럼을 기준으로 결과집합을 그룹화한다.

    ```SQL
    GROUP BY 칼럼명
    ```
- 해당 칼럼명을 기준으로 결과집합을 그룹화하여 출력한다.

<BR>
<bR>

# HAVING
- ```HAVING```절은 ```WHERE```절과 유사한 기능을 한다.
- ```WHERE```절은 테이블에서 추출할 행을 제한
- ```HAVING```절은 그룹핑한 결과집합에 대한 조건을 주어 추출할 집계 데이터를 제한
    ```SQL
    HAVING 표현식 
    ```

```SQL
SELECT A.popGender, A.popAge, SUB(A.popCount) AS "인구수합계"
FROM tbPopulation WHERE A.yearM = '202010'
GROUP BY A.popGender, A.popAge
HAVING SUM(A.popCount) < 1000000;
```
- 인구테이블에서 성별구분코드+연령구분코드 칼럼 조합별 인구수 칼럼의 합계를 구하는 쿼리문
- 인구수 합계가 100만 명 미만인 성별구분코드+연령구분코드 조합별 인구수합계를 구하는 쿼리문