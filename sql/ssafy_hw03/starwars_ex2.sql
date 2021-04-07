-- 
-- Copyright 2021 KTH <kth@jaen.kr>
-- modified by Joylish <yeonzzu2@gmail.com>
--

-- Modified part
-- Modified START

-- 1. 전 스타워즈 시리즈의 상영년도, 에피소드이름, 배역, 출연배우 이름
SELECT  OPENYEAR, EPISODENAME, CHARACTERNAME, REALNAME 
FROM STARWARS S INNER JOIN (
	SELECT EPISODEID, CHARACTERNAME, REALNAME
    FROM CASTING CA INNER JOIN CHARACTERS CH 
    ON CH.CHARACTERID = CA.CHARACTERID
) T
ON S.EPISODEID = T.EPISODEID;

-- 2. 에피소드 4에 출연한 배우는 모두 몇 명인지 구하는 쿼리
SELECT COUNT(*) 출연자수
FROM CASTING
WHERE EPISODEID = 4;

-- 3. 각 배우 별 출연횟수를 조회하는 쿼리
SELECT REALNAME, COUNT(*) 출연횟수
FROM CASTING
GROUP BY REALNAME;
 
-- 4. 에피소드별 이름과 출연자 수
SELECT EPISODENAME 에피소드이름, COUNT(*) 출연자수
FROM STARWARS S INNER JOIN CASTING C
ON S.EPISODEID = C.EPISODEID 
GROUP BY S.EPISODEID;

-- 5. 출연자수가 10명 이상인 에피소드의 이름과 출연자수
SELECT EPISODENAME 에피소드이름, COUNT(*) 출연자수
FROM STARWARS S INNER JOIN CASTING C
ON S.EPISODEID = C.EPISODEID
GROUP BY EPISODENAME
HAVING COUNT(*) >= 10;


-- 6.제국의 역습에 등장하는 배우 이름
SELECT REALNAME
FROM CASTING CA INNER JOIN CHARACTERS CH 
ON CH.CHARACTERID = CA.CHARACTERID
WHERE EPISODEID = (
			SELECT EPISODEID 
            FROM STARWARS 
            WHERE EPISODENAME 
            LIKE '제국의 역습%'
            );

-- 7. '아미달라 여왕'이 등장했던 에피소드 id, 에피소드 이름과 상영연도
SELECT EPISODEID, EPISODENAME, OPENYEAR
FROM STARWARS
WHERE EPISODEID IN (
		SELECT EPISODEID 
        FROM CHARACTERS CH JOIN CASTING CA 
        ON CH.CHARACTERID = CA.CHARACTERID 
        WHERE CHARACTERNAME = '아미달라 여왕'
        );

-- 8. 해리슨 포드가 등장했던 에피소드의 id와 에피소드 이름
SELECT EPISODEID, EPISODENAME
FROM STARWARS
WHERE EPISODEID IN (
						SELECT EPISODEID 
                FROM CASTING 
                WHERE REALNAME = '해리슨 포드'
                );

-- 9. 각 에피소드의 id와 출연한 인원 수
SELECT EPISODEID 에피소드ID, COUNT(*) 출연인원수
FROM CASTING C
GROUP BY EPISODEID;

-- 10. 모든 에피소드 출연한 인원 수 중 가장 많은 인원수는
SELECT DISTINCT COUNT(*) 최대출연인원수
FROM CASTING
GROUP BY EPISODEID
HAVING COUNT(*) >= ALL(
								SELECT COUNT(*)
										FROM CASTING
										GROUP BY EPISODEID
										);


-- 11. 가장 많은 인원이 출연한 에피소드의 id와 인원 수
SELECT EPISODEID, COUNT(*) 인원수
FROM CASTING
GROUP BY EPISODEID
HAVING COUNT(*) >= ALL(
								SELECT COUNT(*)
                    FROM CASTING
                    GROUP BY EPISODEID
                    );

-- 12. 가장 많은 인원이 출연한 에피소드 id, 그 에피소드에 츌연한 배우명
SELECT EPISODEID, REALNAME
FROM CASTING C1
WHERE EPISODEID IN (
				SELECT C2.EPISODEID
				FROM CASTING C2
				GROUP BY C2.EPISODEID
				HAVING COUNT(*) >= ALL(
												SELECT COUNT(*)
														FROM CASTING
														GROUP BY EPISODEID
											)
);

-- 13. 모든 시리즈에 총 출연했던 횟수가 가장 많은 배우 TOP 5의 이름과 횟수를 조회
SELECT REALNAME, COUNT(*) 인원수
FROM CASTING
GROUP BY REALNAME
ORDER BY 인원수 DESC
LIMIT 5;


-- 14. 모든 시리즈에 총 출연했던 횟수가 가장 많은 배우 TOP 6-10의 이름과 횟수를 조회
SELECT REALNAME, COUNT(*) 인원수
FROM CASTING
GROUP BY REALNAME
ORDER BY 인원수 DESC
LIMIT 5,5;


-- 15. 캐릭터에 role값을 부여하여 update(롤의 이름을 활용한다.)
-- 1,4,13 제다이
-- 2,9 반란군
-- 5,12,18 시스
UPDATE CHARACTERS
SET ROLEID = 
	case
			when CHARACTERID IN (1,4,13) THEN (
																			SELECT ROLEID 
                                        	FROM ROLES
                                        	WHERE ROLENAME = '제다이'
                                      )
			when CHARACTERID IN (2,9) THEN (
																			SELECT ROLEID 
                                      	  FROM ROLES
                                        	WHERE ROLENAME = '반란군'
                                      )
			when CHARACTERID IN (5,12,18) THEN (
																			SELECT ROLEID 
                                        	FROM ROLES
                                        	WHERE ROLENAME = '시스'
                                      )
	END;

-- 따로 QUERY 시작
-- UPDATE CHARACTERS C1
-- SET
-- ROLEID = (
-- 	SELECT ROLEID 
--     FROM ROLES
--     WHERE ROLENAME = '제다이'
--     )
-- WHERE CHARACTERID IN (1,4,13);

-- UPDATE CHARACTERS C1
-- SET
-- ROLEID = (
-- 	SELECT ROLEID 
--     FROM ROLES
--     WHERE ROLENAME = '반란군'
--     )
-- WHERE CHARACTERID IN (2,9);

-- UPDATE CHARACTERS
-- SET
-- ROLEID = (
-- 	SELECT ROLEID 
--     FROM ROLES
--     WHERE ROLENAME = '시스'
--     )
-- WHERE CHARACTERID IN (5,12,18);

-- 따로 QUERY 끝


-- 16. 캐릭터와 마스터 연결하여  update
-- 아나킨 스카이워커 13 		오비완 케노비 4
-- 루크 스카이워커 1		오비완 케노비 4
-- 마스터 윈두 	20		요다 11
-- 듀크백작 	21			요다	11
-- 다스 베이더		5		다스 시디어스 12
-- 다스 몰		18		다스 시디어스 12
-- 오비완 캐노비 4			콰이곤 진 14
-- 콰이콘 진		14		듀크백작 21
UPDATE CHARACTERS
SET MASTERID = (
	CASE
		when CHARACTERID IN (13, 1) 
		THEN (
			SELECT CHARACTERID
					FROM (SELECT * FROM CHARACTERS) AS T -- 하위 쿼리를 임시 테이블로 만들어 참조
        	WHERE CHARACTERNAME = '오비완 케노비'
			)
		when CHARACTERID IN (20, 21) 
		THEN (
			SELECT CHARACTERID
					FROM (SELECT * FROM CHARACTERS) AS T -- 하위 쿼리를 임시 테이블로 만들어 참조
          WHERE CHARACTERNAME = '요다'
        )
		when CHARACTERID IN (5, 18) 
		THEN (
			SELECT CHARACTERID
						FROM (SELECT * FROM CHARACTERS) AS T -- 하위 쿼리를 임시 테이블로 만들어 참조
          	WHERE CHARACTERNAME = '다스 시디어스'
        )
		when CHARACTERID IN (4) 
		THEN (
			SELECT CHARACTERID
						FROM (SELECT * FROM CHARACTERS) AS T -- 하위 쿼리를 임시 테이블로 만들어 참조
            WHERE CHARACTERNAME = '콰이곤 진'
        )
		when CHARACTERID IN (14) 
		THEN (
			SELECT CHARACTERID
						FROM (SELECT * FROM CHARACTERS) AS T -- 하위 쿼리를 임시 테이블로 만들어 참조
            WHERE CHARACTERNAME = '듀크 백작'
        )
	END
  );


-- 따로 쿼리 (시작)

-- UPDATE CHARACTERS
-- SET MASTERID = (
-- 	SELECT CHARACTERID
--     -- 하위 쿼리를 임시 테이블로 만들어 참조하도록 한다
--     FROM (SELECT * FROM CHARACTERS) AS T
--     WHERE CHARACTERNAME = '오비완 케노비'
--     )
-- WHERE CHARACTERID IN (13, 1);

-- UPDATE CHARACTERS
-- SET
-- MASTERID = (
-- 	SELECT CHARACTERID
--     -- 하위 쿼리를 임시 테이블로 만들어 참조하도록 한다
--     FROM (SELECT * FROM CHARACTERS) AS T
--     WHERE CHARACTERNAME = '요다'
--     )
-- WHERE CHARACTERID IN (20, 21);

-- UPDATE CHARACTERS
-- SET
-- MASTERID = (
-- 	SELECT CHARACTERID
--     -- 하위 쿼리를 임시 테이블로 만들어 참조하도록 한다
--     FROM (SELECT * FROM CHARACTERS) AS T
--     WHERE CHARACTERNAME = '다스 시디어스'
--     )
-- WHERE CHARACTERID IN (5, 18);


-- UPDATE CHARACTERS
-- SET
-- MASTERID = (
-- 	SELECT CHARACTERID
--     -- 하위 쿼리를 임시 테이블로 만들어 참조하도록 한다
--     FROM (SELECT * FROM CHARACTERS) AS T
--     WHERE CHARACTERNAME = '콰이곤 진'
--     )
-- WHERE CHARACTERID IN (4);

-- UPDATE CHARACTERS
-- SET
-- MASTERID = (
-- 	SELECT CHARACTERID
--     -- 하위 쿼리를 임시 테이블로 만들어 참조하도록 한다
--     FROM (SELECT * FROM CHARACTERS) AS T
--     WHERE CHARACTERNAME = '듀크 백작'
--     )
-- WHERE CHARACTERID IN (14);

-- 따로 쿼리 (끝)


-- 17. 마스터 역할의 배역이름
SELECT DISTINCT C2.CHARACTERNAME
FROM CHARACTERS C1 JOIN CHARACTERS C2
ON C1.MASTERID = C2.CHARACTERID;


-- 18. 오비완 케노비의 제자는
SELECT DISTINCT *
FROM CHARACTERS
WHERE MASTERID IN (SELECT CHARACTERID
					          FROM CHARACTERS
                    WHERE CHARACTERNAME ='오비완 케노비');



-- 19. 오비완 케노비의 제자는 몇명 
-- 19-1 서브쿼리
SELECT DISTINCT COUNT(*)
FROM CHARACTERS
WHERE MASTERID IN (SELECT CHARACTERID
					          FROM CHARACTERS
                    WHERE CHARACTERNAME ='오비완 케노비');

-- 19-2 조인
select count(*) '제자 수'
from CHARACTERS a, CHARACTERS b
where b.CHARACTERNAME = '오비완 케노비' and b.CHARACTERID = a.MASTERID
group by a.MASTERID;

                    
-- 20. 모든 배역과 해당 배역의 마스터 역할배역의 이름을 함께 조회(단, 마스터가 없는 배역도 포함)
SELECT C1.CHARACTERNAME 배역, C2.CHARACTERNAME 마스터배역
FROM CHARACTERS C1 LEFT JOIN CHARACTERS C2
ON C1.MASTERID = C2.CHARACTERID;

-- 21. 에피소드 3의 에피소드 이름과 배역 ,출연배우 이름, 마스터 이름,이메일 
SELECT EPISODENAME, CHARACTERNAME, REALNAME, MASTERNAME, EMAIL
FROM 
( -- 에피소드3 관련 INLINE VIEW
	SELECT EPISODENAME, CHARACTERID, REALNAME
	FROM CASTING C INNER JOIN STARWARS S
	ON C.EPISODEID = S.EPISODEID
	WHERE C.EPISODEID = 3
) T1
LEFT JOIN 
( -- 출연배역, 마스터이름, 이메일 관련  INLINE VIEW
	SELECT C1.CHARACTERID, C1.CHARACTERNAME CHARACTERNAME, C2.CHARACTERNAME MASTERNAME, C1.EMAIL
	FROM CHARACTERS C1 LEFT JOIN CHARACTERS C2
	ON C1.MASTERID = C2.CHARACTERID
) T2
ON T1.CHARACTERID = T2.CHARACTERID;

-- 22. 에피소드 5와 에피소드 2에 모두 출연한 배우는
SELECT C1.REALNAME
FROM CASTING C1 JOIN CASTING C2
ON C1.REALNAME = C2.REALNAME
WHERE C1.EPISODEID = 2 AND C2.EPISODEID = 5;

-- 23. 다음 문장은 스타워즈 에피소드 2에 출연한 배우들의 극중 이름, 역할을 조회하는 쿼리이다.
-- SELECT c.charactername, b.realname, d.rolename
--    FROM starwars a, 
--         casting b, 
--         characters c, 
--         roles d
--   WHERE a.episodeid = b.episodeid
--     AND b.characterid = c.characterid
--     AND c.roleid = d.roleid
--     AND a.episodeid = 2;
-- 이 쿼리에는 한 가지 문제점이 있는데, 무엇을 말하는 것일까?

-- 답안 :: 
-- ROLE이 NULL인 캐릭터 관련 레코드가 나오지 않습니다.
SELECT C.CHARACTERNAME, B.REALNAME, D.ROLENAME
FROM STAWARS A
INNER JOIN CASTING B on A.EPISODEID = B.EPISODEID
INNER JOIN CHARACTERS C on B.CHARACTERID = C.CHARACTERID
LEFT JOIN ROLES D on C.ROLEID = D.ROLEID
WHERE A.EPISODEID = 2;

-- Modified END