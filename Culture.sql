--------------------------- 문화재 검색 + 상세 페이지 -----------------------
DROP TABLE CulturalDi CASCADE CONSTRAINTS; 
CREATE TABLE CulturalDi (
    ccbaAsno     VARCHAR2(500)   NULL,   -- 지정번호
    ccbaKdcd     NUMBER             NULL,   -- 종목코드
    ccbaCtcd      VARCHAR2(500)   NULL,   -- 시도코드
    longitude      VARCHAR2(500)   NULL,   -- 경도 ( 0일 경우 : 위치 값 없음 )
    latitude         VARCHAR2(500)   NULL,   -- 위도 ( 0일 경우 : 위치 값 없음 )
    ccmaName    VARCHAR2(500)   NULL,   -- 문화재종목
    ccbaMnm1    VARCHAR2(500)   NULL,   -- 문화재명(국문)
    gcodeName   VARCHAR2(500)   NULL,   -- 문화재분류
    bcodeName   VARCHAR2(500)   NULL,   -- 문화재분류2
    mcodeName  VARCHAR2(500)   NULL,   -- 문화재분류3
    scodeName   VARCHAR2(500)   NULL,   -- 문화재분류4
    ccbaCtcdNm  VARCHAR2(500)   NULL,   -- 시도명
    ccbaQuan      VARCHAR2(500)   NULL,   -- 수량
    ccbaAsdt       VARCHAR2(500)   NULL,   -- 지정(등록일)
    ccbaLcad       VARCHAR2(500)   NULL,   -- 소재지 상세
    ccceName     VARCHAR2(500)   NULL,   -- 시대
    ccbaAdmin    VARCHAR2(500)   NULL,   -- 관리자
    imageUrl       VARCHAR2(500)   NULL,   -- 메인노출이미지
    content        CLOB                   NULL  -- 내용
);

-- 데이터 삽입 후 데이터 확인
select * 
FROM CulturalDi;

select COUNT(*) 
FROM CulturalDi;

-- 문화재 이미지
DROP TABLE IMAGE CASCADE CONSTRAINTS; 
CREATE TABLE IMAGE (
	ccbaAsno	VARCHAR2(500)		NULL,   -- 지정번호
	ccbaKdcd	NUMBER		        NULL,   -- 종목코드
	ccbaCtcd	VARCHAR2(500)		NULL,   -- 시도코드
	sn          	NUMBER		        NULL,           
	imageNuri	VARCHAR2(500)		NULL,  
	imageUrl	VARCHAR2(500)		NULL,   
	ccimDesc	CLOB		                NULL
);
-- 데이터 삽입 후 데이터 확인
select * 
FROM IMAGE;

SELECT COUNT(*) 
FROM image;

-- 문화재 전체 검색
select * 
FROM CulturalDi;

-- 문화재 전체 갯수 검색
SELECT COUNT(*) 
FROM CulturalDi;

-- 입력 검색(ccbaMnm1-문화재명)
SELECT * 
FROM culturaldi 
WHERE ccbaMnm1 LIKE '%불상%';

-- 지정종목별 검색(ccmaName)
SELECT * 
FROM culturaldi 
WHERE ccmaName = '국보';

-- 시대별 검색(ccceName) 
SELECT * 
FROM culturaldi 
WHERE ccceName LIKE '%선사시대%';

-- 지역별 검색(ccbaCtcdNm)
SELECT * 
FROM culturaldi
WHERE ccbaCtcdNm = '수도권';

-- 동적쿼리
SELECT *
FROM culturaldi 
WHERE 1 = 1 
AND ccbaMnm1 LIKE '%숭례%'
AND ccmaName LIKE '국보'
AND ccceName LIKE '%조선%'
AND ccbaCtcdNm LIKE '수도권'
ORDER BY ccmaname ASC;

-- 오늘의 문화재 (메인페이지)
SELECT ccbaMnm1, imageUrl
FROM CulturalDi
WHERE ROWNUM <= 5;

-- 문화재 세부 페이지 정보 (ex '백자 철화매죽문 항아리'와 같이 문화재 이름이 같은 것이 있어 지정코드 추가)
select * 
FROM culturaldi 
where CCBAASNO = 01660000
AND ccbaMnm1 = '백자 철화매죽문 항아리';

-- 문화재 사진 이름 지정종목 추가(메인페이지 오늘의 문화재)
SELECT imageUrl, ccbaMnm1, ccmaName 
FROM culturaldi;

-- 문화재 코드로 이미지(문화재 상세페이지 이미지) 데이터 제대로 넣으면 수정!
SELECT imageurl, ccimdesc
FROM image
WHERE ccbaasno = '00010000'
and ccbakdcd = 11
and ccbactcd = '11';

UPDATE museum SET AREADR = '충청권' WHERE AREADR = '세종특별시';

--------------------------- 박물관 검색 페이지 -----------------------

DROP TABLE Museum CASCADE CONSTRAINTS; 
CREATE TABLE Museum (
	MuseumCd	NUMBER		NOT NULL,               -- 박물관 코드(시퀀스)
	fcltyNm	VARCHAR2(500)		NULL,               -- 시설명
    areadr VARCHAR2(500)        NULL,               -- 지역분류
	rdnmadr	VARCHAR2(500)		NULL,               -- 소재지도로명주소
	latitude	VARCHAR2(500)		NULL,           -- 위도
	longitude	VARCHAR2(500)		NULL,           -- 경도
	operPhoneNumber	VARCHAR2(500)		NULL,       -- 운영기관전화번호
	operInstitutionNm	VARCHAR2(500)		NULL,   -- 운영기관명
	homepageUrl	VARCHAR2(500)		NULL,           -- 운영홈페이지
	fcltyInfo	VARCHAR2(500)		NULL,           -- 편의시설정보
	weekdayOperOpenHhmm	VARCHAR2(500)		NULL,   -- 평일관람시작시간
	weekdayOperColseHhmm	VARCHAR2(500)		NULL,-- 평일관람종료시간
	holidayOperOpenHhmm	VARCHAR2(500)		NULL,   -- 공휴일관람시작시간
	holidayCloseOpenHhmm	VARCHAR2(500)		NULL,-- 공휴일 종료시간
	rstdeInfo	VARCHAR2(500)		NULL,           -- 휴관정보
	adultChrge	VARCHAR2(500)		NULL,           -- 어른관람료
	yngbgsChrge	VARCHAR2(500)		NULL,           -- 청소년 관람료
	childChrge	VARCHAR2(500)		NULL,           -- 어린이 관람료
	etcChrgeInfo	VARCHAR2(2000)		NULL,       -- 관람료기타정보
	fcltyIntrcn	VARCHAR2(2000)		NULL,           -- 박물관미술관소개
	trnsportInfo	VARCHAR2(2000)		NULL,       -- 교통안내정보
	phoneNumber	VARCHAR2(500)		NULL,           --관리기관 전화번호
	institutionNm	VARCHAR2(500)		NULL,       -- 관리기관명
	cnt	NUMBER		NULL                            -- 조회수
);

CREATE SEQUENCE MuseumCd; -- 시퀀스 생성

-- 삽입 후 데이터 확인
SELECT * 
FROM museum;

SELECT COUNT(*) 
FROM museum;

-- ▷ 박물관 검색페이지
-- 박물관 명칭 검색
SELECT *
FROM museum 
where fcltynm LIKE '%국립%'
ORDER BY cnt DESC;

-- 지역별 검색
select *
FROM museum 
where areadr LIKE '수도권'
ORDER BY cnt DESC;

-- 명칭, 지역별, 인기순 조회순 정렬(동적처리)
SELECT *
FROM museum 
WHERE 1 = 1 
AND fcltynm LIKE '%국립%'
AND areadr LIKE '수도권'
ORDER BY cnt DESC;

-- 인기 박물관(메인페이지)
SELECT ROWNUM, M.*
FROM (SELECT fcltyNm, areadr, weekdayOperOpenHhmm, 
weekdayOperColseHhmm, holidayOperOpenHhmm, holidayCloseOpenHhmm
FROM museum ORDER BY CNT DESC) M
WHERE ROWNUM <= 2;

SELECT ROWNUM AS RNUM, c.* 
FROM (SELECT * from  CulturalDi order by ccbaKdcd asc) c
where ROWNUM BETWEEN 1 and 16500;

-- 박물관 세부 페이지 정보
select * 
FROM Museum 
where museumcd = 1645; 

-- 박물관 조회수 변경
UPDATE museum m
  SET m.cnt = cnt + 1000
  WHERE m.museumcd = 1645;
  

UPDATE museum m
SET m.cnt = cnt + 500
 WHERE m.museumcd = 999; 
 
UPDATE museum m
  SET m.cnt = cnt - 20
  WHERE m.museumcd = 5;
  
SELECT * 
FROM museum;
 
select * from museum where fcltynm like '%국립%';
  
SELECT fcltyNm, areadr, weekdayOperOpenHhmm, weekdayOperColseHhmm, holidayOperOpenHhmm, holidayCloseOpenHhmm
FROM Museum;

--------------------------- 마이페이지 -------------------------------
DROP TABLE Member CASCADE CONSTRAINTS;
CREATE TABLE Member (
    UCode    NUMBER NOT NULL,                -- 회원코드
    UName    VARCHAR2(500)        NULL,       -- 이름
    UTel    VARCHAR2(500)        NULL,       -- 전화번호
    UEmail    VARCHAR2(500)        NULL,       -- 이메일
    Id    VARCHAR2(500)        NULL,           -- ID 
    UPw    VARCHAR2(500)        NULL,           -- PW
    gender    VARCHAR2(500)        NULL,       -- 성별
    MembershipClass    VARCHAR2(500)    NULL,    -- 등급
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N'))
);
select * FROM Member;
DROP SEQUENCE UCode;   -- 시퀀스 삭제
CREATE SEQUENCE UCode; -- 시퀀스 생성

-- 회원 추가
INSERT INTO Member VALUES(1, '정현주', '010-1111-1111', '111@naver.com', 'ID', 'PW', '여', '1', default);
INSERT INTO Member VALUES(2, '김경섭', '010-1234-1234', '123@naver.com', 'ID', 'PW', '남', '1', default);
INSERT INTO Member VALUES(3, '신무균', '010-1111-1111', '111@naver.com', 'ID', 'PW', '여', '1', default);
INSERT INTO Member VALUES(4, '김보성', '010-1234-1234', '123@naver.com', 'ID', 'PW', '남', '1', default);
INSERT INTO Member VALUES(5, '노유정', '010-1111-1111', '111@naver.com', 'ID', 'PW', '여', '1', default);
INSERT INTO Member VALUES(10, '관리자', '010-1111-1111', 'admin@naver.com', 'admin@naver.com', 'PW', '남', '1', default);
-- 테스트 계정 admin@naver.com 
--INSERT INTO Member VALUES(UCode.nextval, '정현주', '010-1111-1111', '111@naver.com', 'ID', 'PW', '여', '1', default);
--INSERT INTO Member VALUES(UCode.nextval, '김경섭', '010-1234-1234', '123@naver.com', 'ID', 'PW', '남', '1', default);
--INSERT INTO Member VALUES(UCode.nextval, '신무균', '010-1111-1111', '111@naver.com', 'ID', 'PW', '여', '1', default);
--INSERT INTO Member VALUES(UCode.nextval, '김보성', '010-1234-1234', '123@naver.com', 'ID', 'PW', '남', '1', default);
--INSERT INTO Member VALUES(UCode.nextval, '노유정', '010-1111-1111', '111@naver.com', 'ID', 'PW', '여', '1', default);

SELECT * FROM member;

-- 회원 정보 수정(이름, 전화번호, 이메일, PW, 성별 변경가능)
UPDATE MEMBER SET UName = '정현주',UTel = '010-1111-0000',UEmail = 'BH1111',UPw = 'PW',gender = '남' 
WHERE ucode = '1';

SELECT * FROM member;

-- 회원 삭제
DELETE FROM member WHERE ucode = '5'; -- 테스트 계정 삭제
SELECT * FROM member;

-- 멤버 조회(아이디, 비밀번호 조회)
SELECT * 
FROM MEMBER 
WHERE id = ID;

--------------------------- 즐겨찾기, 예약 ---------------------------

-- 예약 
DROP TABLE Reservation CASCADE CONSTRAINTS; 
CREATE TABLE Reservation (
	Bcode	NUMBER		NOT NULL,       -- 예약코드
	resDATE	DATE		NULL,           -- 예약날짜
	members	NUMBER		NULL,           -- 예약인원
	UCode	NUMBER		NOT NULL,       -- 회원코드
	MuseumCd	NUMBER		NOT NULL    -- 박물관코드
);
select * FROM Reservation;

DROP SEQUENCE Bcode; -- 시퀀스 삭제
CREATE SEQUENCE Bcode; -- 시퀀스 생성
INSERT INTO Reservation VALUES(Bcode.nextval, SYSDATE, 2, 1, 1645);
INSERT INTO Reservation VALUES(Bcode.nextval, SYSDATE, 2, 1, 100);

-- 즐겨찾기
DROP TABLE Bookmark CASCADE CONSTRAINTS; 
CREATE TABLE Bookmark (
	BNum	NUMBER		NOT NULL,       -- 즐겨찾기번호
	MuseumCd	NUMBER		NOT NULL,   -- 박물관 코드
	UCode	NUMBER		NOT NULL        -- 회원코드 
);

select * FROM Bookmark;

DROP SEQUENCE BNum; -- 시퀀스 삭제
CREATE SEQUENCE BNum; -- 시퀀스 생성

--박물관 예약완료
INSERT INTO Bookmark VALUES(BNum.nextval, 100, 1);
INSERT INTO Bookmark VALUES(BNum.nextval, 1645, 1);

-- 박물관 예약 리스트
SELECT R.* , m.fcltynm
FROM  Reservation R, museum m
WHERE r.museumcd = m.museumcd
and r.ucode = 1;

-- 박물관 예약내역 조회 (예약 상세페이지)
SELECT R.* , m.*
FROM  Reservation R, museum m
WHERE r.museumcd = m.museumcd
and r.ucode = 1
and m.museumcd = 1645;

-- 박물관 즐겨찾기 목록 1(즐겨찾기 한 박물관 이름)
SELECT fcltyNm M 
FROM Bookmark B, Museum M
WHERE B.MuseumCd = M.MuseumCd
and b.ucode = 1;

-- 박물관 즐겨찾기 목록 2(즐겨찾기 한 박물관 설명)
SELECT m.*
FROM Bookmark B, Museum M
WHERE B.MuseumCd = M.MuseumCd
and b.ucode = 1;

--------------------------------------------------------------------
--------------------------- 퀴즈 페이지 -----------------------------
--------------------------------------------------------------------경섭
-- OX퀴즈
DROP TABLE OXQuiz CASCADE CONSTRAINTS; 
CREATE TABLE  OXQuiz  (
	Qoxcode 	NUMBER		NULL,
	content 	CLOB		NULL,
	Qanswer 	NUMBER		NULL
);
select * FROM OXQuiz;

DROP TABLE Quiz CASCADE CONSTRAINTS; 
CREATE TABLE Quiz (
    Qcode    VARCHAR2(500)        NOT NULL,        -- 퀴즈 코드
    ccceName    VARCHAR2(500)       NULL,   -- 퀴즈 시대
    QName       VARCHAR2(500)       NULL,   -- 퀴즈 게시판 이름 
    ccbaMnm1    VARCHAR2(500)        NULL,  -- 퀴즈 이름
    imageUrl    VARCHAR2(500)        NULL,  -- 퀴즈 이미지
    ccmaName    VARCHAR2(500)        NULL,  -- 퀴즈 종목
    ccbaCtcdNm    VARCHAR2(500)        NULL,-- 퀴즈 주소
    cnt                  NUMBER                 NULL, -- 퀴즈를 맞춘 횟수
    content    CLOB        NULL             -- 퀴즈 설명
);
select * FROM Quiz;
SELECT COUNT(*) FROM quiz;

-- 전체 문제 보기 
SELECT *
FROM QUIZ;

-- 맞춘 횟수 업데이트
update Quiz 
set cnt = cnt + 1 
where Qcode = '1';

update Quiz 
set cnt = cnt + 1 
where Qcode = '01';

-- 문제 검색
SELECT Q.*
FROM QUIZ Q
WHERE Q.ccmaName LIKE '국보';

-- 맞춘 문제 보기
SELECT Q.Qcode, q.qname , B.resDATE 
FROM QUIZ Q, CUL_Book B
WHERE Q.QCODE = B.QCODE 
AND B.UCODE = 1 
AND B.ECODE = 1;

---- 틀린 문제 보기  --- 구현하기 힘든 시간이 남으면 구현함! 테이블이 따로 필요
--SELECT Q.Qcode, q.qname , B.resDATE 
--FROM QUIZ Q, CUL_Book B
--WHERE Q.QCODE = B.QCODE 
--AND B.UCODE = 0 
--AND B.ECODE = 0;

-- 퀴즈 힌트 보기
SELECT * FROM quiz 
WHERE QCODE = '83';

-- 퀴즈 풀기
SELECT *
FROM Quiz Q
WHERE Q.QCODE = '83';

-- 정답처리
SELECT * 
FROM quiz
WHERE ccbamnm1 = '경주 감산사 석조아미타여래입상';


--------------------------- 도감 페이지 ------------------------------
DROP TABLE CUL_Book CASCADE CONSTRAINTS; 
CREATE TABLE CUL_Book (
    Bcode    NUMBER        NOT NULL,       -- 도감코드
    Ecode   NUMBER      NOT NULL,       -- 정답코드 X->0 O->1  (NOTHING ->2)
    resDATE    DATE        NULL,           -- 획득날짜
    UCode    NUMBER        NOT NULL,       -- 회원코드
    Qcode    NUMBER        NOT NULL        -- 퀴즈 코드
);
select * FROM CUL_Book;

DROP SEQUENCE Bcode; -- 시퀀스 삭제
CREATE SEQUENCE Bcode; -- 시퀀스 생성
INSERT INTO CUL_Book VALUES(Bcode.nextval, 1, SYSDATE, 1, 83);
INSERT INTO CUL_Book VALUES(Bcode.nextval, 0, SYSDATE, 1, 1);
INSERT INTO CUL_Book VALUES(Bcode.nextval, 2, SYSDATE, 1, 17);

-- 지역별 검색
SELECT C.ccbaMnm1, C.ccbaAdmin, C.ccmaName, C.ccceName, C.imageUrl
FROM CulturalDi C, Quiz Q, CUL_Book B
WHERE Q.QCODE = B.QCODE 
AND C.ccbaMnm1= q.ccbamnm1
AND B.ECODE = 1
AND B.UCODE = 1
AND C.ccbaCtcdNm = '수도권';

-- 지정종목 검색
SELECT C.ccbaMnm1, C.ccbaAdmin, C.ccmaName, C.ccceName, C.imageUrl
FROM CulturalDi C, Quiz Q, CUL_Book B
WHERE Q.QCODE = B.QCODE 
AND C.ccbaMnm1= q.ccbamnm1
AND B.ECODE = 1
AND B.UCODE = 1
AND C.ccmaName = '국보';

-- 완성된 도감 불러오기
SELECT C.ccbaMnm1, C.ccbaAdmin, C.ccmaName, C.ccceName, C.imageUrl
FROM CulturalDi C, Quiz Q, CUL_Book B
WHERE Q.QCODE = B.QCODE 
AND C.ccbaMnm1= q.ccbamnm1
AND B.ECODE = 1
AND B.UCODE = 1;

-------------------------- 게시판 페이지 ----------------------------
DROP TABLE BBS CASCADE CONSTRAINTS;
DROP SEQUENCE BNum;
CREATE SEQUENCE BNum;

CREATE TABLE  BBS  (
    BNum         NUMBER              NOT NULL,       -- 글번호
    Title         VARCHAR2(500)      NULL,           -- 제목
    Content     CLOB              NULL,           -- 내용
    BDATE         DATE              NULL,           -- 글 작성날짜
    CID         NUMBER              NOT NULL,       -- 카테고리코드
    UCode         NUMBER              NOT NULL,       -- 게시글 작성자
    READCOUNT   NUMBER            NOT NULL,        -- 조회수
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')) -- 상태
);
SELECT * FROM bbs;

SELECT b.* FROM(
SELECT ROWNUM AS RNUM, b.*  FROM 
(SELECT b.*,m.id FROM bbs b
JOIN member m ON (b.ucode = m.ucode) 
where b.cid = 3 and b.status = 'Y' 
order by b.bnum asc 
    )b 
)b 
WHERE rnum BETWEEN 1 and 10;

SELECT * FROM member;

......

-- 댓글
DROP TABLE B_COMMENT CASCADE CONSTRAINTS;
DROP SEQUENCE CNum;
CREATE SEQUENCE CNum;

CREATE TABLE  B_COMMENT  (
    CNum     NUMBER        NOT NULL,       -- 댓글번호
    content     CLOB    NULL,       -- 댓글내용
    CDATE     DATE        NULL,           -- 글 작성날짜
    BNum     NUMBER        NOT NULL,       -- 글번호
    UCode     NUMBER        NOT NULL,        -- 게시글 작성자
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')) -- 상태
);

SELECT * FROM B_COMMENT;

-- 카테고리
DROP TABLE C_BBS CASCADE CONSTRAINTS; 
CREATE TABLE  C_BBS  (
    CID     NUMBER        NOT NULL,
    CName     VARCHAR2(200)        NULL
);

SELECT * FROM C_BBS;
INSERT INTO c_bbs VALUES (1, '자유게시판');
INSERT INTO c_bbs VALUES (2, '리뷰게시판');
INSERT INTO c_bbs VALUES (3, '문의게시판');

------------------------------------------------------------
--BEGIN
--    FOR N IN 1..30
--    LOOP
--        INSERT INTO bbs VALUES(
--        BNUM.nextval, 
--        '게시글 '||BNum.CURRVAL , 
--        '게시글 테스트입니다.'||BNum.CURRVAL, 
--        SYSDATE, 
--        3,
--        1,
--        0,
--        DEFAULT);
--    END LOOP;
--    
--    COMMIT;
--EXCEPTION
--    WHEN OTHERS THEN ROLLBACK;
--END;

--BEGIN
--    FOR N IN 1..10
--    LOOP
--        INSERT INTO B_COMMENT VALUES(CNUM.nextval, '안녕하세요.', sysdate, CNum.CURRVAL, 1, DEFAULT);
--        INSERT INTO B_COMMENT VALUES(CNUM.nextval, '안녕하세요.', sysdate, CNum.CURRVAL, 1, DEFAULT);
--        INSERT INTO B_COMMENT VALUES(CNUM.nextval, '안녕하세요.', sysdate, CNum.CURRVAL, 1, DEFAULT);
--    END LOOP;
--
--    COMMIT;
--EXCEPTION
--    WHEN OTHERS THEN ROLLBACK;
--END;

--SELECT * FROM b_comment;
--DELETE FROM b_comment WHERe status = 'Y';

COMMIT;