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
    
-- 사원 정보(EMP)에서 
	-- 급여가 2000이상이면 보너스 1000
    -- 급여가 1000이상이면 보너스 500
    -- 급여가 1000미만이면 보너스 0
SELECT ENAME, SAL,
	CASE
		WHEN SAL >= 2000 THEN 1000
        ELSE (CASE
				WHEN SAL >= 1000 THEN 500
                ELSE 0
                END)
		END AS BONUS
FROM EMP;

-- 선수테이블(PLAYER)에서 K08소솔선수의 이름과 포지션을 출력하는데,
-- 포지션이 없는 경우 '없음'으로 표시
SELECT PLAYER_NAME, POSITION, ISNULL (POSITION, '없음')
FROM PLAYER
WHERE TEAM_ID= 'K08';

-- 위 내용 case문장 활용
SELECT PLAYER_NAME, POSITION,
	CASE 
		WHEN POSITION IS NULL THEN '없음'
        ELSE POSITION
		END
FROM PLAYER
WHERE TEAM_ID = 'K08';

-- ★사원정보(EMP)에서 연봉 계산 법 ( NULL 을 숫자로 만들어 계산할 수 있게 만들기), COMM = 보너스
SELECT ENAME, SAL, COMM,
(SAL*12) + COMM AS '보너스포함 연볼',
(SAL*12) + INNULL(COMM, 0) AS '보너스 없는 연봉'
FROM EMP;
    
        
        
