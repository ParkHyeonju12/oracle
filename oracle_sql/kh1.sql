SELECT * FROM EMPLOYEE;
--전 직원의 이름, 부서명, 직급명, 급여 출력
SELECT * FROM JOB;
SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;
SELECT * FROM LOCATION;
SELECT * FROM NATIONAL;
SELECT * FROM SAL_GRADE;
--1)JOIN
SELECT EMP_NAME, DEPT_TITLE, JOB_NAME, SALARY
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_CODE  = DEPT_ID)
LEFT JOIN JOB USING (JOB_CODE);
--2)SUBQUERY
SELECT 
    EMP_NAME, 
    (SELECT DEPT_TITLE FROM DEPARTMENT WHERE DEPT_ID=E.DEPT_CODE)AS DEPT_TITLE, 
    (SELECT JOB_NAME FROM JOB J WHERE J.JOB_CODE=E.JOB_CODE)AS JOB_NAME, 
    SALARY
FROM EMPLOYEE E;    

----
--SUBQUERY로 테이블을 생성하는 경우는 컬럼이름,데이터타입,값 까지는 복사가 됨,
--대신 제약조건은  NOT NULL만 복사가능
CREATE TABLE EMP_COPY
AS--AS를 넣어주면 알 SELECT문을 EMP_COPY에 넣어줌/ AS 핵심!!!
SELECT EMP_NAME, DEPT_TITLE, JOB_NAME, SALARY
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_CODE  = DEPT_ID)
LEFT JOIN JOB USING (JOB_CODE);

SELECT * FROM EMP_COPY;

CREATE TABLE EMP_COPY2
AS
SELECT EMP_NAME, DEPT_CODE, JOB_CODE, SALARY
FROM EMPLOYEE WHERE 1=0;--FALSE를 만들어서 다 안나오게
SELECT * FROM EMP_COPY2;

CREATE TABLE EMP_COPY3
AS
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE WHERE 1=0;

CREATE TABLE EMP_COPY4
AS
SELECT EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE WHERE 1=0;

INSERT ALL
INTO EMP_COPY3 VALUES(EMP_NAME, DEPT_CODE, SALARY)
INTO EMP_COPY4 VALUES(EMP_NAME, JOB_CODE, SALARY)
SELECT EMP_NAME, DEPT_CODE, JOB_CODE, SALARY FROM EMPLOYEE;
SELECT * FROM EMP_COPY3;
SELECT * FROM EMP_COPY4;

--ALTER : 데이터베이스 객체 정보를 수정
CREATE TABLE DEPT_COPY
AS
SELECT * FROM DEPARTMENT;
SELECT * FROM DEPT_COPY;
--테이블 컬럼을 추가
ALTER TABLE DEPT_COPY
ADD (KNAME VARCHAR2(20));

ALTER TABLE DEPT_COPY
ADD (HNAME VARCHAR2(20) DEFAULT 'HI');
--테이블 컬럼 자료형 변경
DESC DEPT_COPY;
ALTER TABLE DEPT_COPY
MODIFY DEPT_TITLE VARCHAR2(50);
--제약조건 확인
SELECT 
    UC.CONSTRAINT_NAME,
    UC.CONSTRAINT_TYPE,
    UCC.COLUMN_NAME,
    UC.SEARCH_CONDITION
FROM USER_CONSTRAINTS UC
JOIN USER_CONS_COLUMNS UCC
ON (UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME)
WHERE UC.TABLE_NAME='DEPT_COPY';--'DEPT_COPY'은 소문자로 적어놨어도 여기서는 무조건 대문자로 적어줘야함

--제약조건 추가
SELECT * FROM DEPT_COPY;
ALTER TABLE DEPT_COPY
ADD CONSTRAINT DCOPY_ID_PK PRIMARY KEY(DEPT_ID); --제약조건 추가란

ALTER TABLE DEPT_COPY
ADD CONSTRAINT DCOPY_TITLE_UNQ UNIQUE(DEPT_TITLE);--UNIQUE추가
--NOT NULL 제약조건은 추가시 ADD가 아니라 MODIFY
ALTER TABLE DEPT_COPY
MODIFY HNAME CONSTRAINT DCOPY_HNAME_NN NOT NULL;

--제약조건 제거
ALTER TABLE DEPT_COPY
DROP CONSTRAINT DCOPY_ID_PK;

ALTER TABLE DEPT_COPY
DROP CONSTRAINT DCOPY_TITLE_UNQ;

ALTER TABLE DEPT_COPY
MODIFY HNAME NULL; --위와는 스타일이 다름
-------
--한번에 추가하기
ALTER TABLE DEPT_COPY
ADD CONSTRAINT DCOPY_ID_PK PRIMARY KEY(DEPT_ID)
ADD CONSTRAINT DCOPY_TITLE_UNQ UNIQUE(DEPT_TITLE)
MODIFY HNAME CONSTRAINT DCOPY_HNAME_NN NOT NULL;

--한번에 제거하기
ALTER TABLE DEPT_COPY
DROP CONSTRAINT DCOPY_ID_PK
DROP CONSTRAINT DCOPY_TITLE_UNQ
MODIFY HNAME NULL;

--컬럼삭제
ALTER TABLE DEPT_COPY
DROP COLUMN KNAME;
SELECT * FROM DEPT_COPY;

--컬럼이름수정, 제약조건이름수정, 테이블이름 수정
--HNAME -> KNAME
ALTER TABLE DEPT_COPY
RENAME COLUMN HNAME TO KHNAME;
DESC DEPT_COPY;
-- SYS_C007056 -> DEPT_ID_NN//제약조건이름 변경
ALTER TABLE DEPT_COPY
RENAME CONSTRAINT SYS_C007081 TO DEPT_ID_NN;--/제약조건은 COLUMN대신 CONSTRAINT사용
-- DEPT_COPY -> ALTER_TEST//테이블이름변경
ALTER TABLE DEPT_COPY
RENAME TO ALTER_TEST;

SELECT * FROM ALTER_TEST;

-- TRUNCATE : 테이블 전체 행 삭제
--DELETE에서 WHERE을 사용하지 않은것과 차이점
--1) TRUNCATE가 수행속도가 빠름
--2) 상황에따라서 DELECT는 데이터복구가 가능, TRUNCATE 데이터복구 불가능
TRUNCATE TABLE ALTER_TEST;

--DROP : 데이터베이스 객체 삭제//복구 불가능
DROP TABLE ALTER_TEST;

--실습1
DROP TABLE RUNNINGMAN;
CREATE TABLE RUNNINGMAN(
   NO    NUMBER PRIMARY KEY,
   ID    VARCHAR2(20)   UNIQUE,
   PASS  VARCHAR2(20) NOT NULL,
   NAME  VARCHAR2(20) NOT NULL,
   NICKNAME VARCHAR2(20) UNIQUE,
   GENDER  CHAR(1)CHECK (GENDER IN ('M', 'F')),
   TEL   VARCHAR2(20) DEFAULT '010-0000-0000',
   ADDRESS  VARCHAR2(90)
);
INSERT INTO RUNNINGMAN 
VALUES(1,'muhan','1234','유재석','못생긴형','M','010-4958-2333','압구정');
INSERT INTO RUNNINGMAN 
VALUES(2,'bignose','4444','지석진','지는해','M',DEFAULT,'서울');
INSERT INTO RUNNINGMAN 
VALUES(3,'tiger','6658','김종국','안꼬','M','010-6674-8986','안양');
INSERT INTO RUNNINGMAN 
VALUES(4,'haha','5356','하하','신분세탁','M','010-8997-1122','서래마을');
INSERT INTO RUNNINGMAN 
VALUES(5,'ace','5555','송지효','천성임','F',DEFAULT,'서울시');
INSERT INTO RUNNINGMAN 
VALUES(6,'girrafe','6658','이광수','중기친구','M','010-2378-9991','남양주');
INSERT INTO RUNNINGMAN 
VALUES(7,'ssapssap','5356','양세찬','김종국팬','M','010-1215-7777','동두천');
INSERT INTO RUNNINGMAN 
VALUES(8,'doli','5555','전소민','전두릅','F',DEFAULT,'일산');

UPDATE RUNNINGMAN SET PASS = '9999' WHERE NICKNAME='중기친구';

UPDATE RUNNINGMAN SET TEL = '없음' WHERE NO IN(2,5,8);

DELETE FROM RUNNINGMAN WHERE NAME='유재석';

SELECT * FROM RUNNINGMAN;
DESC RUNNINGMAN;




