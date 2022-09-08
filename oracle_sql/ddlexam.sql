DROP TABLE COMPANY_TBL;
DROP TABLE EXPERT_TBL;


CREATE TABLE EXPERT_TBL(
    MEMBER_CODE  number PRIMARY KEY, -- 기본키					-- 회원전용코드
    MEMBER_ID    varchar2(20), -- 중복금지			-- 회원 아이디
    MEMBER_PWD   varchar2(20)NOT NULL,    -- NULL 값 허용금지	-- 회원 비밀번호
    MEMBER_NAME  varchar2(10)NOT NULL, -- NULL값 허용 금지	-- 회원 이름
    MEMBER_ADDR  varchar2(50)NOT NULL, -- NULL값 허용금지	-- 회원 거주지
    GENDER       char(3) CHECK (GENDER IN ('남', '여')), -- '남' 혹은 '여'로만 입력 가능	-- 성별
    PHONE        char(13)   DEFAULT '010-0000-0000',                             --전화번호
    UNIQUE(MEMBER_ID)
    
);
INSERT INTO EXPERT_TBL 
VALUES(1,'user01','1234','유저1','서울시','남','010-1234-1234');
INSERT INTO EXPERT_TBL 
VALUES(2,'user02','1234','유저2','서울시','여',DEFAULT);
INSERT INTO EXPERT_TBL (MEMBER_CODE,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_ADDR,GENDER)
VALUES(3,'user03','1234','유저3','서울시','남');
INSERT INTO EXPERT_TBL 
VALUES(4,'user05','1234','유저4','서울시','여','010-1234-1237');

CREATE TABLE COMPANY_TBL(
    MEMBER_CODE number REFERENCES EXPERT_TBL ON DELETE CASCADE, -- 외래키(EXPERT_TBL의 기본키 참조)	-- 회원전용코드
    SKILL varchar2(50)					            -- 회원 능력
);



INSERT INTO COMPANY_TBL
VALUES(1,'고무고무');
INSERT INTO COMPANY_TBL
VALUES(2,'불');
INSERT INTO COMPANY_TBL
VALUES(3,'물');

SELECT * FROM EXPERT_TBL;
SELECT * FROM COMPANY_TBL;
DELETE FROM COMPANY_TBL WHERE MEMBER_CODE=2;