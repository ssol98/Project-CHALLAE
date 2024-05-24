CREATE TABLE MEMBER (
                        MEMBER_NUM       NUMBER(10)  PRIMARY KEY,
                        MEMBER_ID        VARCHAR2(20)    NOT NULL,
                        MEMBER_PASSWD    VARCHAR2(20)    NOT NULL,
                        MEMBER_NAME      VARCHAR2(20)    NOT NULL,
                        MEMBER_DIR       CHAR(1),
                        MEMBER_PHONE     VARCHAR2(20)    NOT NULL,
                        MEMBER_EMAIL     VARCHAR2(20)    NOT NULL,
                        MEMBER_REGDATE   DATE            DEFAULT SYSDATE,
                        MEMBER_PHOTO     VARCHAR2(20)    DEFAULT 'img/teamlogo.jpg',
                        CLUB_NUM         NUMBER(10)
);


INSERT INTO MEMBER (MEMBER_NUM, MEMBER_ID, MEMBER_PASSWD, MEMBER_NAME, MEMBER_DIR, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_REGDATE)
VALUES (1, 'admin', '1111', '관리자', 'N', '010-1111-1111', 'admin@gmail.com', SYSDATE);

SELECT *
FROM MEMBER;

DROP TABLE MEMBER;


CREATE TABLE FIELD (
                       FIELD_NUM	NUMBER(10)	PRIMARY KEY,
                       FIELD_NAME	VARCHAR2(20)	NOT NULL,
                       FIELD_OLDADDRESS	VARCHAR2(50)	NULL,
                       FIELD_NEWADDRESS	VARCHAR2(50)	NULL,
                       FIELD_PHONE	VARCHAR2(20)	NOT NULL,
                       FIELD_REGDATE	DATE  DEFAULT SYSDATE,
                       FIELD_SIZE	VARCHAR2(20)	NOT NULL,
                       FIELD_PHOTO	VARCHAR2(50) DEFAULT 'img/teamlogo.jpg',
                       FIELD_DAYPRICE	NUMBER	NULL,
                       FIELD_ENDPRICE	NUMBER	NULL,
                       FIELD_PAYDATE	DATE	NULL,
                       FIELD_OPENTIME	VARCHAR2(20)	NOT NULL,
                       FIELD_CLOSETIME	VARCHAR2(20)	NOT NULL,
                       FIELD_THUMBNAILS	VARCHAR2(50)	 DEFAULT 'img/teamlogo.jpg',
                       FIELD_DETAILADDRESS	VARCHAR2(50)	NULL
);

INSERT INTO FIELD (FIELD_NUM, FIELD_NAME, FIELD_OLDADDRESS, FIELD_NEWADDRESS, FIELD_PHONE, FIELD_SIZE,FIELD_PHOTO, FIELD_DAYPRICE, FIELD_ENDPRICE, FIELD_PAYDATE, FIELD_OPENTIME, FIELD_CLOSETIME,FIELD_DETAILADDRESS)
VALUES (1, 'Football Field', '123 Old St', '456 New Ave', '010-1234-5678', '100x50m','field1.jpg', 50000, 70000, TO_DATE('2024-05-17', 'YYYY-MM-DD'), '08:00', '20:00','Building 7');

DROP TABLE FIELD;

CREATE TABLE CLUB (
                      CLUB_NUM	NUMBER(10)	PRIMARY KEY,
                      CLUB_NAME	VARCHAR2(20)	NOT NULL,
                      CLUB_INFO	VARCHAR2(100)	NULL,
                      CLUB_MEMBERCOUNT	NUMBER(20)	NOT NULL,
                      CLUB_PHOTO	VARCHAR2(50) DEFAULT 'img/teamlogo.jpg' ,
                      CLUB_LEVEL	VARCHAR2(20)	NOT NULL,
                      CLUB_REGDATE	DATE DEFAULT SYSDATE,
                      CLUB_LOCATION	VARCHAR2(20) NOT NULL,
                      CLUB_PHONE	VARCHAR2(20)	NOT NULL
);

INSERT INTO CLUB (CLUB_NUM, CLUB_NAME, CLUB_INFO, CLUB_MEMBERCOUNT, CLUB_LEVEL, CLUB_LOCATION, CLUB_PHONE)
VALUES (1, 'Soccer Club', 'A community soccer club', 50, '하', 'Seoul', '010-1234-5678');

DROP TABLE CLUB;

CREATE TABLE RECORD_FC (
                           REC_NO	NUMBER(10)	PRIMARY KEY,
                           REC_FID	VARCHAR2(20)	NOT NULL,
                           REC_SCO	VARCHAR2(20)	NULL,
                           REC_DATE DATE	NULL,
                           CLUB_NUM	NUMBER(10)	NOT NULL
);

INSERT INTO RECORD_FC (REC_NO, REC_FID, REC_SCO, REC_DATE, CLUB_NUM)
VALUES (1, 'game123', '3-2', TO_DATE('2024-05-17', 'YYYY-MM-DD'), 1);

CREATE TABLE RESERVATION (
                             RES_NUM	NUMBER(10)	PRIMARY KEY,
                             RES_RESDATE	DATE	NOT NULL,
                             RES_PRICE	NUMBER(10)	NOT NULL,
                             RES_STARTTIME	VARCHAR2(20)	NOT NULL,
                             RES_ENDTIME	VARCHAR2(20)	NOT NULL,
                             MEMBER_NUM	NUMBER(10)	NOT NULL
);

INSERT INTO RESERVATION (RES_NUM, RES_RESDATE, RES_PRICE, RES_STARTTIME, RES_ENDTIME, MEMBER_NUM)
VALUES (1, TO_DATE('2024-06-01', 'YYYY-MM-DD'), 100000, '10:00', '12:00', 1);

CREATE TABLE RESLIST (
                         RESLIST_INFO	VARCHAR2(20)	NULL,
                         RES_NUM	NUMBER(10)	NOT NULL,
                         FIELD_NUM	NUMBER(10)	NOT NULL
);

INSERT INTO RESLIST (RESLIST_INFO, RES_NUM, FIELD_NUM)
VALUES ('Booking Info', 1, 1);

CREATE TABLE PAYMENT (
                         PAY_NUM	NUMBER(10)	PRIMARY KEY,
                         APP_PG	VARCHAR2(20)	NOT NULL,
                         PAY_DATE	DATE	NOT NULL,
                         PAY_PRICE	NUMBER(10)	NOT NULL,
                         PAY_BANK	VARCHAR2(20)	NULL,
                         RES_NUM	NUMBER(10)	NOT NULL
);

INSERT INTO PAYMENT (PAY_NUM, APP_PG, PAY_DATE, PAY_PRICE, PAY_BANK, RES_NUM)
VALUES (1, 'KakaoPay', TO_DATE('2024-05-17', 'YYYY-MM-DD'), 100000, 'KakaoBank', 1);

DROP TABLE PAYMENT;

CREATE TABLE MATCH (
                       MATCH_NUM	NUMBER(10)	PRIMARY KEY,
                       MATCH_DATE	VARCHAR2(20)	NOT NULL,
                       MATCH_INFO	VARCHAR2(200)	NULL,
                       MATCH_TIME	VARCHAR2(20)	NOT NULL,
                       CLUB_NUM	NUMBER(10)	NOT NULL,
                       FIELD_NUM	NUMBER(10)	NOT NULL
);

INSERT INTO MATCH (MATCH_NUM, MATCH_DATE, MATCH_INFO, MATCH_TIME, CLUB_NUM, FIELD_NUM)
VALUES (1, '2024-06-01', 'Friendly match between local teams', '15:00', 1, 1);


CREATE TABLE MATCHBOARD (
                            MB_NUM	NUMBER(10)	PRIMARY KEY,
                            MB_NAME	VARCHAR2(20)	NOT NULL,
                            MB_FILE	VARCHAR2(50)	NOT NULL,
                            CLUB_NUM	NUMBER(10)	NOT NULL
);

INSERT INTO MATCHBOARD (MB_NUM, MB_NAME, MB_FILE, CLUB_NUM)
VALUES (1, 'Match Schedule', 'schedule.pdf', 1);


CREATE TABLE COMMUNITY (
                           COMM_NUM	NUMBER(10)	PRIMARY KEY,
                           COMM_CONTENT	VARCHAR2(30)	NULL,
                           COMM_DATE	DATE	NULL,
                           CLUB_NUM	NUMBER(10)	NOT NULL
);
-- content에 들어가는 데이터를 위해 확장
alter table community modify(comm_content VARCHAR2(60));

commit;


-- INSERT INTO COMMUNITY (COMM_NUM, COMM_CONTENT, COMM_DATE, CLUB_NUM)
-- VALUES (1, 'First community post', TO_DATE('2024-05-17', 'YYYY-MM-DD'), 1);


CREATE TABLE BOARD (
                       BOARD_NUM	NUMBER(10)	PRIMARY KEY,
                       BOARD_NAME	VARCHAR2(30)	NOT NULL,
                       BOARD_INFO	VARCHAR2(500)	NULL
);

INSERT INTO BOARD ( BOARD_NUM, BOARD_NAME, BOARD_INFO)
VALUES (1, 'General Discussion', 'This board is for general discussion about various topics.');

CREATE TABLE ARTICLE (
                         ARTICLE_NUM	NUMBER(10)	PRIMARY KEY,
                         ARTICLE_TITLE	VARCHAR2(100)	NOT NULL,
                         ARTICLE_CONTENT	VARCHAR2(500)	NOT NULL,
                         ARTICLE_DATE	DATE DEFAULT SYSDATE,
                         ARTICLE_HITCOUNT	NUMBER(20)	DEFAULT 0,
                         MEMBER_NUM	NUMBER(10)	NOT NULL,
                         BOARD_NUM	NUMBER(10)	NOT NULL
);

INSERT INTO ARTICLE (ARTICLE_NUM, ARTICLE_TITLE, ARTICLE_CONTENT, ARTICLE_DATE, ARTICLE_HITCOUNT, MEMBER_NUM, BOARD_NUM)
VALUES (1, 'Welcome to the Board', 'This is the first article in the general discussion board.', SYSDATE, 0, 1, 1);


CREATE TABLE COMMENTS (
                          COMMENT_NUM	NUMBER(10)	PRIMARY KEY,
                          COMMENT_CONTENT	VARCHAR2(500)	NOT NULL,
                          COMMENT_DATE	DATE	DEFAULT SYSDATE,
                          MEMBER_NUM	NUMBER(10)	NOT NULL
);




























--          Other Key           -------------------------------------------------------------------------------------------------------------------
ALTER TABLE RECORD_FC
    ADD(
    CONSTRAINT REC_CLUB_NUM_FK FOREIGN KEY(CLUB_NUM) REFERENCES CLUB(CLUB_NUM)
);

ALTER TABLE COMMUNITY
    ADD(
    CONSTRAINT COMM_CLUB_NUM_FK FOREIGN KEY(CLUB_NUM) REFERENCES CLUB(CLUB_NUM)
);

ALTER TABLE MATCHBOARD
    ADD(
    CONSTRAINT MB_CLUB_NUM_FK FOREIGN KEY(CLUB_NUM) REFERENCES CLUB(CLUB_NUM)
);

ALTER TABLE MATCH
    ADD(
    CONSTRAINT MATCH_CLUB_NUM_FK FOREIGN KEY(CLUB_NUM) REFERENCES CLUB(CLUB_NUM),
    CONSTRAINT MATCH_FIELD_NUM_FK FOREIGN KEY(FIELD_NUM) REFERENCES FIELD(FIELD_NUM)
);

ALTER TABLE MEMBER
    ADD(
    CONSTRAINT MEMBER_CLUB_NUM_FK FOREIGN KEY(CLUB_NUM) REFERENCES CLUB(CLUB_NUM),
		-- 감독여부 CK
    CONSTRAINT MEMBER_DIR_CK CHECK (MEMBER_DIR IN ('Y', 'N'))
);

ALTER TABLE RESERVATION
    ADD(
    CONSTRAINT RES_MEMBER_NUM_FK FOREIGN KEY(MEMBER_NUM) REFERENCES MEMBER(MEMBER_NUM)
);

ALTER TABLE RESLIST
    ADD(
    CONSTRAINT RESLIST_RES_NUM_FK FOREIGN KEY(RES_NUM) REFERENCES RESERVATION(RES_NUM),
    CONSTRAINT RESLIST_FIELD_NUM_FK FOREIGN KEY(FIELD_NUM) REFERENCES FIELD(FIELD_NUM)
);

ALTER TABLE PAYMENT
    ADD(
    CONSTRAINT PAY_RES_NUM_FK FOREIGN KEY(RES_NUM) REFERENCES RESERVATION(RES_NUM)
);

ALTER TABLE ARTICLE
    ADD(
    CONSTRAINT ARTICLE_MEMBER_NUM_FK FOREIGN KEY(MEMBER_NUM) REFERENCES MEMBER(MEMBER_NUM),
    CONSTRAINT ARTICLE_BOARD_NUM_FK FOREIGN KEY(BOARD_NUM) REFERENCES BOARD(BOARD_NUM)
);

ALTER TABLE COMMENTS
    ADD(
    CONSTRAINT COMMENTS_MEMBER_NUM_FK FOREIGN KEY(MEMBER_NUM) REFERENCES MEMBER(MEMBER_NUM)
);
























--      시퀀스                    -------------------------------------------------------------------------
-- GRANT CREATE SEQUENCE
-- TO CHALLAE;

-- 클럽전적 REC_NO
CREATE SEQUENCE REC_SEQ
    START WITH 1
    INCREMENT BY 1;
--
SELECT REC_SEQ.nextval
from DUAL;
--
drop sequence REC_SEQ;


-- 커뮤니티 COMM_NUM
CREATE SEQUENCE COMM_SEQ
    START WITH 1
    INCREMENT BY 1;
--
SELECT COMM_SEQ.nextval
from DUAL;
--
drop sequence COMM_SEQ;


-- 전략판 MB_NUM
CREATE SEQUENCE MB_SEQ
    START WITH 1
    INCREMENT BY 1;
--
SELECT MB_SEQ.nextval
from DUAL;
--
drop sequence MB_SEQ;


-- 클럽 CLUB_NUM
CREATE SEQUENCE CLUB_SEQ
    START WITH 100
    INCREMENT BY 1;
--
SELECT CLUB_SEQ.nextval
from DUAL;
--
drop sequence CLUB_SEQ;


-- 매치 MATCH_NUM
CREATE SEQUENCE MATCH_SEQ
    START WITH 1
    INCREMENT BY 1;
--
SELECT MATCH_SEQ.nextval
from DUAL;
--
drop sequence MATCH_SEQ;


-- 구장 FIELD_NUM
CREATE SEQUENCE FIELD_SEQ
    START WITH 1
    INCREMENT BY 1;
--
SELECT FIELD_SEQ.nextval
from DUAL;
--
drop sequence FIELD_SEQ;


-- 회원 MEMBER_NUM
CREATE SEQUENCE MEMBER_SEQ
    START WITH 1000
    INCREMENT BY 1;
--
SELECT MEMBER_SEQ.nextval
from DUAL;
--
drop sequence MEMBER_SEQ;


-- 예약 RES_NUM
CREATE SEQUENCE RES_SEQ
    START WITH 1
    INCREMENT BY 1;
--
SELECT RES_SEQ.nextval
from DUAL;
--
drop sequence RES_SEQ;


-- 결제 PAY_NUM
CREATE SEQUENCE PAY_SEQ
    START WITH 1
    INCREMENT BY 1;
--
SELECT PAY_SEQ.nextval
from DUAL;
--
drop sequence PAY_SEQ;


-- 게시글 ARTICLE_NUM
CREATE SEQUENCE ARTICLE_SEQ
    START WITH 1
    INCREMENT BY 1;
--
SELECT ARTICLE_SEQ.nextval
from DUAL;
--
drop sequence ARTICLE_SEQ;


-- 게시판 BOARD_NUM
CREATE SEQUENCE BOARD_SEQ
    START WITH 1
    INCREMENT BY 1;
--
SELECT BOARD_SEQ.nextval
from DUAL;
--
drop sequence BOARD_SEQ;


-- 댓글 COMMENT_NUM
CREATE SEQUENCE COMMENT_SEQ
    START WITH 1
    INCREMENT BY 1;
--
SELECT COMMENT_SEQ.nextval
from DUAL;
--
drop sequence COMMENT_SEQ;
































--               더미데이터                 ---------------------------------------------------------------------------

-- FIELD 테이블에 더미 데이터 삽입
-- INSERT INTO FIELD (FIELD_NUM, FIELD_NAME, FIELD_OLDADDRESS, FIELD_NEWADDRESS, FIELD_PHONE, FIELD_SIZE, FIELD_PHOTO, FIELD_DAYPRICE, FIELD_ENDPRICE, FIELD_PAYDATE, FIELD_OPENTIME, FIELD_CLOSETIME, FIELD_DETAILADDRESS)
-- VALUES (FIELD_SEQ.nextval, '야구장', '789 Old Blvd', '101 New Plaza', '010-5678-1234', '120x60m', 'field2.jpg', 60000, 80000, TO_DATE('2024-05-18', 'YYYY-MM-DD'), '09:00', '21:00', '건물 8');

-- -- -- CLUB 테이블에 더미 데이터 삽입
-- INSERT INTO CLUB (CLUB_NUM, CLUB_NAME, CLUB_INFO, CLUB_MEMBERCOUNT, CLUB_LEVEL, CLUB_LOCATION, CLUB_PHONE)
-- VALUES (CLUB_SEQ.nextval, '야구 클럽', '커뮤니티 야구 클럽', 30, '중', '부산', '010-8765-4321');

-- 5월24일 생성한 더미데이터
INSERT INTO CLUB (CLUB_NUM, CLUB_NAME, CLUB_INFO, CLUB_MEMBERCOUNT, CLUB_LEVEL, CLUB_LOCATION, CLUB_PHONE)
VALUES (CLUB_SEQ.nextval, '2클럽', '2번째 만든 풋살클럽', 50, '중상', '중랑구 상봉동', '010-2222-2222');
INSERT INTO CLUB (CLUB_NUM, CLUB_NAME, CLUB_INFO, CLUB_MEMBERCOUNT, CLUB_LEVEL, CLUB_LOCATION, CLUB_PHONE)
VALUES (CLUB_SEQ.nextval, '3클럽', '3번째 만든 풋살클럽', 20, '상', '노원구 중계동', '010-3333-3333');



-- RECORD_FC 테이블에 더미 데이터 삽입
-- INSERT INTO RECORD_FC (REC_NUM, REC_FID, REC_SCO, REC_DATE, CLUB_NUM)
-- VALUES (REC_SEQ.nextval, 'game456', '승', TO_DATE('2024-05-18', 'YYYY-MM-DD'), 100);

-- RESERVATION 테이블에 더미 데이터 삽입
-- INSERT INTO RESERVATION (RES_NUM, RES_RESDATE, RES_PRICE, RES_STARTTIME, RES_ENDTIME, MEMBER_NUM)
-- VALUES (RES_SEQ.nextval, TO_DATE('2024-06-02', 'YYYY-MM-DD'), 120000, '11:00', '13:00', 1002);

-- -- RESLIST 테이블에 더미 데이터 삽입
-- INSERT INTO RESLIST (RESLIST_INFO, RES_NUM, FIELD_NUM)
-- VALUES ('예약 정보', RES_SEQ.currval, FIELD_SEQ.currval);

-- -- PAYMENT 테이블에 더미 데이터 삽입
-- INSERT INTO PAYMENT (PAY_NUM, APP_PG, PAY_DATE, PAY_PRICE, PAY_BANK, RES_NUM)
-- VALUES (PAY_SEQ.nextval, 'PayPal', TO_DATE('2024-05-18', 'YYYY-MM-DD'), 120000, 'HSBC', RES_SEQ.currval);

-- MATCH 테이블에 더미 데이터 삽입
-- INSERT INTO MATCH (MATCH_NUM, MATCH_DATE, MATCH_INFO, MATCH_TIME, CLUB_NUM, FIELD_NUM)
-- VALUES (MATCH_SEQ.nextval, '2024-06-02', '클럽 간의 토너먼트 경기', '16:00', 100, FIELD_SEQ.currval);

-- MATCHBOARD 테이블에 더미 데이터 삽입
-- INSERT INTO MATCHBOARD (MB_NUM, MB_NAME, MB_FILE, CLUB_NUM)
-- VALUES (MB_SEQ.nextval, '경기 일정', 'schedule.pdf', 100);

-- COMMUNITY 테이블에 더미 데이터 삽입
-- INSERT INTO COMMUNITY (COMM_NUM, COMM_CONTENT, COMM_DATE, CLUB_NUM)
-- VALUES (COMM_SEQ.nextval, '첫 커뮤니티 게시글', TO_DATE('2024-05-18', 'YYYY-MM-DD'), 100);



INSERT INTO COMMUNITY (COMM_NUM, COMM_CONTENT, COMM_DATE, CLUB_NUM)
VALUES (4, '101에서 보이는 첫번째 게시글', TO_DATE('2024-05-18', 'YYYY-MM-DD'), 101);

-- 24일 더미 생성
INSERT INTO COMMUNITY (COMM_NUM, COMM_CONTENT, COMM_DATE, CLUB_NUM)
VALUES (COMM_SEQ.nextval, '101번 클럽 커뮤 게시글', TO_DATE('2024-05-22', 'YYYY-MM-DD'), 101);

INSERT INTO COMMUNITY (COMM_NUM, COMM_CONTENT, COMM_DATE, CLUB_NUM)
VALUES (COMM_SEQ.nextval, '102번 클럽 커뮤 게시글', TO_DATE('2024-05-23', 'YYYY-MM-DD'), 102);

-- 2팀 멤버 더미 업데이트
UPDATE member
SET club_num = '101'
WHERE member_name = '김휘집' AND club_num IS NULL;

UPDATE member
SET club_num = '101'
WHERE member_name = '김혜성';

-- 감독생성
UPDATE member
SET member_dir = 'Y'
WHERE member_name = '김혜성' ;

-- 3팀 멤버 더미 업데이트
UPDATE member
SET club_num = '102'
WHERE member_name = '양현종';

UPDATE member
SET club_num = '102'
WHERE member_name = '김도영';

commit;


-- BOARD 테이블에 더미 데이터 삽입
-- INSERT INTO BOARD (BOARD_NUM, BOARD_NAME, BOARD_INFO)
-- VALUES (BOARD_SEQ.nextval, '일반 토론', '다양한 주제에 대한 일반 토론 게시판입니다.');

-- ARTICLE 테이블에 더미 데이터 삽입
-- INSERT INTO ARTICLE (ARTICLE_NUM, ARTICLE_TITLE, ARTICLE_CONTENT, ARTICLE_DATE, ARTICLE_HITCOUNT, MEMBER_NUM, BOARD_NUM)
-- VALUES (ARTICLE_SEQ.nextval, '게시판에 오신 것을 환영합니다', '일반 토론 게시판의 첫 번째 게시글입니다.', SYSDATE, 0, 1002, BOARD_SEQ.currval);

-- COMMENTS 테이블에 더미 데이터 삽입
-- INSERT INTO COMMENTS (COMMENT_NUM, COMMENT_CONTENT, COMMENT_DATE, MEMBER_NUM)
-- VALUES (COMMENT_SEQ.nextval, '첫 번째 댓글입니다.', SYSDATE, 1002);































-- MEMBER 테이블의 모든 데이터 선택
SELECT * FROM MEMBER;

-- FIELD 테이블의 모든 데이터 선택
SELECT * FROM FIELD;

-- CLUB 테이블의 모든 데이터 선택
SELECT * FROM CLUB;

-- RESERVATION 테이블의 모든 데이터 선택
SELECT * FROM RESERVATION;

-- RESLIST 테이블의 모든 데이터 선택
SELECT * FROM RESLIST;

-- PAYMENT 테이블의 모든 데이터 선택
SELECT * FROM PAYMENT;

-- MATCH 테이블의 모든 데이터 선택
SELECT * FROM MATCH;

-- MATCHBOARD 테이블의 모든 데이터 선택
SELECT * FROM MATCHBOARD;

-- COMMUNITY 테이블의 모든 데이터 선택
SELECT * FROM COMMUNITY;

-- BOARD 테이블의 모든 데이터 선택
SELECT * FROM BOARD;































--------메모--------
-- REC_NO 속성 이름 NUM 변경
ALTER TABLE RECORD_FC RENAME COLUMN REC_NO TO REC_NUM;

SELECT * FROM RECORD_FC;

-- 이메일, 전화번호 등 UK 추가
ALTER TABLE MEMBER ADD (
  CONSTRAINT MEMBER_EMAIL_UK UNIQUE(MEMBER_EMAIL),
  CONSTRAINT MEMBER_PHONE_UK UNIQUE(MEMBER_PHONE)
);

-- 회원 테이블 감독여부(MEMBER_DIR) 속성 디폴트 'N' 추가
ALTER TABLE MEMBER
    MODIFY MEMBER_DIR DEFAULT 'N';

-- 이미지 컬럼 추가
-- 멤버 테이블 등번호 컬럼 추가(등번호는 감독이 내팀에서 수정)

-- 전적 승패 CK
ALTER TABLE RECORD_FC ADD (
    CONSTRAINT REC_SCO_CK CHECK (REC_SCO IN ('승', '패'))
);

-- 1. 테이블 구조 수정: REC_SCO 컬럼의 데이터 타입을 CHAR(3)으로 변경
ALTER TABLE RECORD_FC
    MODIFY REC_SCO CHAR(3);

DELETE FROM RECORD_FC
WHERE REC_SCO = '3-2';

-- 매치 전략판사진 추가
ALTER TABLE MATCH
    ADD MATCH_PHOTO VARCHAR2(50);

-- 클럽 클럽장 추가
ALTER TABLE CLUB
    ADD CLUB_PRESIDENT VARCHAR2(20);







-- 클럽 더미데이터 업데이트
UPDATE CLUB
SET CLUB_NAME = '찰래',
    CLUB_INFO = '백수들 모임 클럽',
    CLUB_LOCATION = '노원구 공릉동',
    CLUB_PHONE = '011-1111-1111',
    CLUB_PRESIDENT = '백찰래'
WHERE CLUB_NUM = 100;




























-- 세션 정보 확인
SELECT
    SID,
    SERIAL#,
    USERNAME,
    STATUS,
    MACHINE,
    PROGRAM,
    LAST_CALL_ET
FROM
    V$SESSION
WHERE
    USERNAME IS NOT NULL;



SELECT
    *
FROM
    V$SESSION
WHERE
    USERNAME IS NOT NULL;


















select *
from club as of timestamp(systimestamp - interval '1440' minute)
where CLUB_NUM = 100;


