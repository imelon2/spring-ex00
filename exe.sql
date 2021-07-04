-- 반올림 및 내림해 소수점 이하 한 자리까지 출력
SELECT ENAME, round(SAL / 12, 1) AS SAL_ROUND, truncate(SAL / 12, 1) AS SAL_TRUNC
FROM EMP;

-- 사원(EMP) 테이블의 입사일자에서 년,월,일 출력
SELECT ENAME, HIREDATE
,extract(YEAR FROM HIREDATE)
,extract(MONTH FROM HIREDATE)
,extract(DAY FROM HIREDATE)
FROM EMP;

SELECT ENAME, HIREDATE
,year(HIREDATE)
,MONTH(HIREDATE)
,DAY(HIREDATE)
FROM EMP;

-- 부서 정보에서 부서 위치를 미국의 동부, 중부, 서부로 구분
SELECT LOC AS '부서 정보',
	CASE LOC
		WHEN 'NEW YORK' THEN 'EAST'
        WHEN 'BOSTON' THEN 'EAST'
        WHEN 'CHICAGO' THEN 'CENTER'
        WHEN 'DALLAS' THEN 'CENTER'
        ELSE 'ECT'
	END
    FROM DEPT;
    
-- 사원 정보에서 급여가 
	-- 3000이상이면 HIGH등급, 
	-- 1000 이상이면 MID등급, 
	-- 1000미만이면 LOW등급으로 분류
SELECT ENAME,
	CASE 
    WHEN SAL >= 3000 THEN 'HIGH'
    WHEN SAL >= 1000 THEN 'MID'
    ELSE 'LOW'
    END
    FROM EMP;
    
    
        
        
