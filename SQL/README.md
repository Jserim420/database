# SQL

- SQL 공부 기록용

## 1. SQL 개념
    1. 데이터 모델링의 이해
    2. SQL 기본
    3. SQL 활용
    4. SQL 최적화 기본 원리
    5. 기타

## 2. SQL 쿼리문 정리(ORACL SQL)
    1. DDL(데이터 정의어) : CREATE, ALTER, DROP, RENAME
    2. DML(데이터 조작어) : SELECT, INSERT, UPDATE, DELETE
    3. TCL(트랜잭션 제어어) : COMMIT, ROLLBACK
    4. WHERE(필터처리)와 연산자
        - LIKE
        - ROWNUM
    5. FUNCTION(함수) 
        - LOWER, UPPER, SUBSTR, LENTH, LTRIM, RTRIM, TRIM, ASCII
        - ABB, MOD, ROUND, TRUNC, SIGN, CHR, CEIL, FLOOR, EXP, LOG, LN, POWER, SIN, COS, TAN
        - SYSDATE, EXTRACT, TO_NUMBER
        - NVL, NULLIF, COALESCE
        - 집계 함수 : COUNT, SUM, AVG, MAX, MIN, STDDEV, VARIAN
        - 그룹 함수 : ROLLUP, CUBE, GROUPING, GROUPING SETS
        - 윈도우 함수
            - RANK, DENSE_RANK, ROW_NUMBER
            - SUM, MAX, MIN, AVG, COUNT
            - FIRST_VALUE, LAST_VALUE, LAG, LEAD
            - CUME_DIST, PERCENT_RANK, NTILE, RATIO_TO_REPORT
    6. GROUP BY, HAVING
    7. ORDER BY (정렬)
    8. JOIN
        - INNER JOIN, NATURAL JOIN, USING, ON
        - OUTTER JOIN : LEFT OUTER JOIN, RIGHT OUTER JOIN, FULL OUTER JOIN
        - CROSS JOIN
    9. 집합연산자
        - UNION, UNION ALL
        - INTERSECT
        - MINUS
    10. 계층형 질의
        - START WITH, CONNECT BY [NOCYCLE] [PRIOR] A AND B, ORDER SIBLINGS BY
        - LEVEL, CONNECT_BY_ISLEAF, CONNECT_BY_ISCYCLE, LPAD
        - CONNECT_BY_ROOT, SYS_CONNECT_BY_PATH
    11. 서브쿼리
        - EXISTS, NOT EXISTS
        - 뷰 : VIEW
