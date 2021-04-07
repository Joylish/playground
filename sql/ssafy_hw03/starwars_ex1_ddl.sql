-- 
-- Copyright 2021 KTH <kth@jaen.kr>
-- modified by Joylish <yeonzzu2@gmail.com>
--

drop database if exists starwarsdb;
create database starwarsdb;
use starwarsdb;

-- 1. 테이블 명 : STARWARS (영화 정보를 저장한다)
--         컬럼 : - EPISODEID : 에피소드 아이디로써, 숫자형 타입으로 기본 키가 된다.
--                - EPISODENAME : 에피소드에 따른 영화 제목이며, 가변 길이 문자형 타입(50 BYTE)이다.
--                - OPENYEAR : 개봉년도로써, 역시 숫자형 타입이다.
CREATE TABLE STARWARS (
     EPISODEID    INT primary key, 
     EPISODENAME  VARCHAR(50), 
     OPENYEAR     INT(5));
-- 2. 테이블 명 : CHARACTERS ( 등장인물 정보를 저장한다)
--         컬럼 : - CHARACTERID   : 등장인물 아이디로써, 숫자형 타입(5자리)으로 기본 키가 된다.
--                - CHARACTERNAME : 등장인물 명으로 가변 길이 문자형 타입(30 BYTE)이다.
--                - MASTERID      : 등장인물이 제다이일 경우 마스터 아이디 값을 가진다. 역시 숫자형(5자리)이다.
--                - ROLEID        : 등장인물의 역할 아이디로써, 숫자형(5자리) 타입이다.
--                - EMAIL          : 등장인물의 이메일 주소로 가변길이 문자형 타입(40 BYTE)이다.
CREATE TABLE CHARACTERS (
         CHARACTERID    INT(5) primary key, 
         CHARACTERNAME  VARCHAR(30), 
         MASTERID 		INT(5),
         ROLEID         INT(5),  -- references roles (roleid ) ,--  : 에러는 안나는데 외래키 지정되지 않음 
         EMAIL           VARCHAR(40));
-- 3. 테이블 명 : - CASTING ( 등장인물과 실제 배우의 정보를 저장한다)
--         컬럼 : - EPISODEID: 에피소드 아이디로써, 숫자형 타입(5자리)으로 기본 키가 된다.
--                - CHARACTERID: 등장인물 아이디로써, 숫자형 타입(5자리)이며 기본 키가 된다.
--                - REALNAME : 등장인물의 실제 이름으로, 가변길이 문자형 타입(30 BYTE)이다.
CREATE TABLE CASTING (
	       EPISODEID    INT(5)  , 
	       CHARACTERID  INT(5)  ,  
	       REALNAME     VARCHAR(30),
           CONSTRAINT CASTINGFK1 FOREIGN KEY ( EPISODEID ) REFERENCES STARWARS ( EPISODEID ),
           CONSTRAINT CASTINGFK2 FOREIGN KEY ( CHARACTERID ) REFERENCES CHARACTERS ( CHARACTERID )
           ) ; 
    
 
#DATA INSERT(ROLES TABLE만 직접 입력해보기)
-- 4. insert STARWARS--------------------------------
INSERT INTO STARWARS ( EPISODEID, EPISODENAME, OPENYEAR)
VALUES ( 4, '새로운 희망(A New Hope)', 1977);

INSERT INTO STARWARS ( EPISODEID, EPISODENAME, OPENYEAR)
VALUES ( 5, '제국의 역습(The Empire Strikes Back)', 1980);

INSERT INTO STARWARS ( EPISODEID, EPISODENAME, OPENYEAR)
VALUES ( 6, '제다이의 귀환(Return of the Jedi)', 1983);

INSERT INTO STARWARS ( EPISODEID, EPISODENAME, OPENYEAR)
VALUES ( 1, '보이지 않는 위험(The Phantom Menace)', 1999);

INSERT INTO STARWARS ( EPISODEID, EPISODENAME, OPENYEAR)
VALUES ( 2, '클론의 습격(Attack of the Clones)', 2002);

INSERT INTO STARWARS ( EPISODEID, EPISODENAME, OPENYEAR)
VALUES ( 3, '시스의 복수(Revenge of the Sith)', 2005);

-- 5. CHARACTERS ---------------------------------------
INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 1, '루크 스카이워커','luke@jedai.com');

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 2, '한 솔로', 'solo@alliance.com');

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 3, '레이아 공주', 'leia@alliance.com');

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 4, '오비완 케노비', 'Obi-Wan@jedai.com');

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 5, '다스 베이더', 'vader@sith.com');

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 6, '다스 베이더(목소리)', 'vader-voice@alliance.com');

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 7, 'C-3PO', 'c3po@alliance.com');

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 8, 'R2-D2', 'r2d2@alliance.com');

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 9, '츄바카', 'Chewbacca@alliance.com');

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 10, '랜도 칼리시안', 'Chewbacca@alliance.com');

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 11, '요다', 'yoda@jedai.com');

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 12, '다스 시디어스', NULL);

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 13, '아나킨 스카이워커', 'Anakin@jedai.com');

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 14, '콰이곤 진', NULL);

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 15, '아미달라 여왕', NULL);

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 16, '아나킨 어머니', NULL);

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 17, '자자빙크스(목소리)', 'jaja@jedai.com');

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 18, '다스 몰', NULL);

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 19, '장고 펫', NULL);

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 20, '마스터 윈두', 'windu@jedai.com');

INSERT INTO CHARACTERS ( CHARACTERID, CHARACTERNAME, EMAIL)
VALUES ( 21, '듀크 백작', 'dooku@jedai.com');


-- 6. CASTING--------------------------------
INSERT INTO CASTING VALUES ( 4, 1, '마크 해밀');
INSERT INTO CASTING VALUES ( 4, 2, '해리슨 포드');
INSERT INTO CASTING VALUES ( 4, 3, '캐리 피셔');
INSERT INTO CASTING VALUES ( 4, 4, '알렉 기네스');
INSERT INTO CASTING VALUES ( 4, 5, '데이비드 프로우즈');
INSERT INTO CASTING VALUES ( 4, 6, '제임스 얼 존스');
INSERT INTO CASTING VALUES ( 4, 7, '안소니 다니엘스');
INSERT INTO CASTING VALUES ( 4, 8, '케니 베이커');
INSERT INTO CASTING VALUES ( 4, 9, '피터 메이휴');
INSERT INTO CASTING VALUES ( 5, 1, '마크 해밀');
INSERT INTO CASTING VALUES ( 5, 2, '해리슨 포드');
INSERT INTO CASTING VALUES ( 5, 3, '캐리 피셔');
INSERT INTO CASTING VALUES ( 5, 4, '알렉 기네스');
INSERT INTO CASTING VALUES ( 5, 5, '데이비드 프로우즈');
INSERT INTO CASTING VALUES ( 5, 6, '제임스 얼 존스');
INSERT INTO CASTING VALUES ( 5, 7, '안소니 다니엘스');
INSERT INTO CASTING VALUES ( 5, 8, '케니 베이커');
INSERT INTO CASTING VALUES ( 5, 9, '피터 메이휴');
INSERT INTO CASTING VALUES ( 5, 10, '빌리 디 윌리엄스');
INSERT INTO CASTING VALUES ( 5, 11, '프랭크 오즈');
INSERT INTO CASTING VALUES ( 6, 1, '마크 해밀');
INSERT INTO CASTING VALUES ( 6, 2, '해리슨 포드');
INSERT INTO CASTING VALUES ( 6, 3, '캐리 피셔');
INSERT INTO CASTING VALUES ( 6, 4, '알렉 기네스');
INSERT INTO CASTING VALUES ( 6, 5, '데이비드 프로우즈');
INSERT INTO CASTING VALUES ( 6, 6, '제임스 얼 존스');
INSERT INTO CASTING VALUES ( 6, 7, '안소니 다니엘스');
INSERT INTO CASTING VALUES ( 6, 8, '케니 베이커');
INSERT INTO CASTING VALUES ( 6, 9, '피터 메이휴');
INSERT INTO CASTING VALUES ( 6, 10, '빌리 디 윌리엄스');
INSERT INTO CASTING VALUES ( 6, 11, '프랭크 오즈');
INSERT INTO CASTING VALUES ( 6, 12, '이언 맥디어미드');
INSERT INTO CASTING VALUES ( 1, 13, '제이크 로이드');
INSERT INTO CASTING VALUES ( 1, 4, '이완 맥그리거');
INSERT INTO CASTING VALUES ( 1, 14, '리암 니슨');
INSERT INTO CASTING VALUES ( 1, 15, '나탈리 포트만');
INSERT INTO CASTING VALUES ( 1, 11, '프랭크 오즈');
INSERT INTO CASTING VALUES ( 1, 16, '페닐라 어거스트');
INSERT INTO CASTING VALUES ( 1, 12, '이언 맥디어미드');
INSERT INTO CASTING VALUES ( 1, 7, '안소니 다니엘스');
INSERT INTO CASTING VALUES ( 1, 8, '케니 베이커');
INSERT INTO CASTING VALUES ( 1, 17, '아흐메드 베스트');
INSERT INTO CASTING VALUES ( 1, 18, '레이 파크');
INSERT INTO CASTING VALUES ( 2, 4, '이완 맥그리거');
INSERT INTO CASTING VALUES ( 2, 15, '나탈리 포트만');
INSERT INTO CASTING VALUES ( 2, 13, '헤이든 크리스텐슨');
INSERT INTO CASTING VALUES ( 2, 11, '프랭크 오즈');
INSERT INTO CASTING VALUES ( 2, 12, '이언 맥디어미드');
INSERT INTO CASTING VALUES ( 2, 16, '페닐라 어거스트');
INSERT INTO CASTING VALUES ( 2, 17, '아흐메드 베스트');
INSERT INTO CASTING VALUES ( 2, 7, '안소니 다니엘스');
INSERT INTO CASTING VALUES ( 2, 8, '케니 베이커');
INSERT INTO CASTING VALUES ( 2, 19, '테무엘라 모리슨');
INSERT INTO CASTING VALUES ( 2, 20, '사무엘 L. 잭슨');
INSERT INTO CASTING VALUES ( 2, 21, '크리스토퍼 리');
INSERT INTO CASTING VALUES ( 3, 4, '이완 맥그리거');
INSERT INTO CASTING VALUES ( 3, 15, '나탈리 포트만');
INSERT INTO CASTING VALUES ( 3, 13, '헤이든 크리스텐슨');
INSERT INTO CASTING VALUES ( 3, 11, '프랭크 오즈');
INSERT INTO CASTING VALUES ( 3, 12, '이언 맥디어미드');
INSERT INTO CASTING VALUES ( 3, 17, '아흐메드 베스트');
INSERT INTO CASTING VALUES ( 3, 7, '안소니 다니엘스');
INSERT INTO CASTING VALUES ( 3, 8, '케니 베이커');
INSERT INTO CASTING VALUES ( 3, 19, '테무엘라 모리슨'), ( 3, 20, '사무엘 L. 잭슨'),( 3, 21, '크리스토퍼 리');  
 

-- Modified PART
-- Modified START
  
-- 7. ROLES 테이블 생성 후 다음의 데이터를 저장해보자.
-- 테이블 명 : - ROLES (역할아이디와 이름을 저장한다.)
--     컬럼 : - ROLEID: 역할 아이디로써, 숫자형 타입(5자리)으로 기본 키가 된다.
--           - ROLENAME : 역할 이름으로, 가변길이 문자형 타입(30 BYTE)이다.  

-- ROLEID                ROLENAME                      
-- ------------------- ------------------------------ 
-- 1001                   제다이                         
-- 1002                   시스                           
-- 1003                   반란군

CREATE TABLE ROLES (
     ROLEID    INT PRIMARY KEY,
     ROLENAME  VARCHAR(50)
     );
INSERT INTO ROLES VALUES (1001, '제다이');
INSERT INTO ROLES VALUES (1002, '시스');
INSERT INTO ROLES VALUES (1003, '반란군');

SELECT * FROM ROLES; -- 확인

-- 8. ALTER TABLE 구문을 이용하여 CASTING 테이블의 PK를 지정하자.
-- 8. alter table pk
# pk
alter table CASTING add PRIMARY KEY(EPISODEID, CHARACTERID);

-- 9. alter table fk : characters table
-- 9. CHARACTERS 테이블에는 ROLEID 란 컬럼이 있는데, 이 값은 ROLES 테이블의 ROLEID 값을 참조한다. 
-- CHARACTERS 테이블을 변경하여 ROLEID 컬럼이 ROLES 테이블의 ROLEID 값을 참조하도록 참조 키를 생성해보자. 
#fk
alter table CHARACTERS add foreign key(ROLEID) references ROLES(ROLEID)
ON UPDATE CASCADE
ON DELETE CASCADE;

-- Modified END
