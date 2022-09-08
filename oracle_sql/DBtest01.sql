--DB��������
--���̺����
--������� : ���,�̸�,����,�ּ�,��ȭ��ȣ,�ֹι�ȣ
--���: ������ȣ(SEQUENCE),��¥,���

CREATE TABLE EMP (
    EMP_ID   VARCHAR2(5) PRIMARY KEY,
    EMP_NAME   VARCHAR2(20) NOT NULL,
    GENDER  CHAR(1) CHECK(GENDER IN ('M','F')) ,
    ADDRESS  VARCHAR2(50) NOT NULL  ,
    PHONE   CHAR(13) UNIQUE NOT NULL ,
    EMP_NO   CHAR(14) UNIQUE 
);
CREATE SEQUENCE EMP_SEQ;
INSERT INTO EMP VALUES('E-'||EMP_SEQ.NEXTVAL, '���1','M','����','010-1111-1111','771122-1234567');
SELECT * FROM EMP;

CREATE TABLE ATTEND(
    ATTEND_DATE DATE,
    EMP_ID VARCHAR2(5) REFERENCES EMP--�ܷ�Ű REFERENCES
);
INSERT INTO ATTEND VALUES(SYSDATE, 'E-1');
SELECT * FROM ATTEND;

---------------------------------------------------------------------------
-----------------------------------------------------------------------------
--DB�ǽ�
/*
���� ���� ������� �� ��� ���� �����̴�.
1.  �����κ��� ��ȭ�� �޴´�.
2.  ���� �����̸� AŸ�� ��������� ����ϰ�, �����̸� BŸ�� ��������� ����Ѵ�. 
3.  �� ���� ��㿡 ���� ������ �Ϸù�ȣ�� �ο��Ѵ�.
4.  ��� ������ ���� ��û�̸� ��������� A/S �μ��� Fax�� �����Ѵ�.
5.  ��� ������ ��ǰ ��û�̸� ��ǰ ��Ͽ� �� �̸�, ��ȭ��ȣ, ��ǰ ������ ����Ѵ�.?
�� �䱸������ ó���� �� �ִ� ���̺��� �����ϼ���.
*/
--�� : �� �̸�, ��ȭ��ȣ, ����ȣ, ����
--������� : ��㳻��,�Ϸù�ȣ,����ȣ(�� �ܷ�Ű���),���Ÿ��(A,B)
--��ǰ :����Ϸù�ȣ(��������ܷ�Ű), ��ǰ ����




CREATE TABLE CUSTOMER_SERVICE (
    CUSTOM_ID  VARCHAR2(5) PRIMARY KEY,
    CUSTOM_NAME VARCHAR2(20) NOT NULL,
    CUSTOM_POHNE  CHAR(13) UNIQUE NOT NULL ,
    CUSTOM_GENDER_TYPE  CHAR(1) CHECK(CUSTOM_GENDER_TYPE IN ('A','B'))--����A,����B
    GOODS_NAME  VARCHAR2(20) NOT NULL,
    CUSTOM_CONTENTS  VARCHAR2(6) CHECK(CUSTOM_CONTENTS IN ('����','��ǰ'))
);
CREATE SEQUENCE CUSTOMER_SERVICE_SEQ;
INSERT INTO CUSTOMER_SERVICE VALUES('CS-'||CUSTOMER_SERVICE_SEQ.NEXTVAL,
                          'ȫ�浿','010-1111-1111','A','��ǳ��','����');
INSERT INTO CUSTOMER_SERVICE VALUES('CS-'||CUSTOMER_SERVICE_SEQ.NEXTVAL,
                          '�ӳ���','010-2222-2222','B','��ǳ��','��ǰ');                          
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
--�ǽ�2
/*
������ IT ���� �п��� ���� �����̴�. 
�������ʹ� IT ���� �п����� �پ��� ������ �����ϰ� �ִ�. 
�� ������ �ڵ�, ���� �� �� �����Ḧ ���� �ִ�. �������� 1�������� 6���� �� �Ⱓ�� �پ��ϴ�. 
�� ���翡 ���� �̸��� ��ȭ��ȣ�� �ʿ�� �ϸ� �� ����� ���� ���� ������ ������ �� �ִ�. 
�л����� ���� ���� ������ ������û �� �� �ִµ� ���� �л����� �̷��� �ϰ� �ִ�. 
�л� ���� �������� �� �л����� �̸��� ��ȭ��ȣ�� ����Ѵ�. ?
ERD �ۼ� �� ���̺� �������� �ۼ��ϼ���.
-----
���� : �����ڵ�,�����̸�,������,�Ⱓ
���� : �����ڵ� ,�̸�,��ȭ��ȣ
�л�: �л��ڵ�, �̸�,��ȭ��ȣ

*/
CREATE TABLE TEACHER (
    TEACHER_CODE  NUMBER PRIMARY KEY ,
    TEACHER_NAME  VARCHAR2(20) NOT NULL,
    TEACHER_PHONE  CHAR(13)  NOT NULL
);
CREATE SEQUENCE TEACHER_SEQ;
CREATE TABLE STUDENT (
    STUDENT_CODE  NUMBER PRIMARY KEY ,
    STUDENT_NAME  VARCHAR2(20) NOT NULL,
    STUDENT_PHONE  CHAR(13)  NOT NULL
);  
CREATE SEQUENCE STUDENT_SEQ;


CREATE TABLE CLASS_TBL (
    CLASS_CODE   NUMBER PRIMARY KEY ,
    CLASS_NAME   VARCHAR2(100)  NOT NULL,
    CLASS_PAY    NUMBER    NOT NULL,
    CLASS_TURM   NUMBER   NOT NULL,
    TEACHER_CODE   NUMBER REFERENCES TEACHER ON DELETE SET NULL
);
DROP TABLE CLASS_TBL;
CREATE SEQUENCE CLASS_SEQ;

CREATE TABLE ENROLMENT(
   CLASS_CODE   NUMBER REFERENCES CLASS_TBL ON DELETE CASCADE,
   STUDENT_CODE  NUMBER REFERENCES STUDENT ON DELETE CASCADE
);
INSERT INTO TEACHER
VALUES(TEACHER_SEQ.NEXTVAL, '����1', '010-1111-1111');
INSERT INTO TEACHER
VALUES(TEACHER_SEQ.NEXTVAL, '����2', '010-2222-2222');
INSERT INTO TEACHER
VALUES(TEACHER_SEQ.NEXTVAL, '����3', '010-3333-3333');
INSERT INTO TEACHER
VALUES(TEACHER_SEQ.NEXTVAL, '����4', '010-4444-4444');
INSERT INTO TEACHER
VALUES(TEACHER_SEQ.NEXTVAL, '����5', '010-5555-5555');
SELECT * FROM TEACHER;

INSERT INTO STUDENT
VALUES(STUDENT_SEQ.NEXTVAL, '�л�1', '010-9999-1111');
INSERT INTO STUDENT
VALUES(STUDENT_SEQ.NEXTVAL, '�л�2', '010-9999-2222');
INSERT INTO STUDENT
VALUES(STUDENT_SEQ.NEXTVAL, '�л�3', '010-9999-3333');
INSERT INTO STUDENT
VALUES(STUDENT_SEQ.NEXTVAL, '�л�4', '010-9999-4444');
INSERT INTO STUDENT
VALUES(STUDENT_SEQ.NEXTVAL, '�л�5', '010-9999-5555');
SELECT * FROM STUDENT;

DESC CLASS_TBL;
SELECT * FROM TEACHER;
INSERT INTO CLASS_TBL
VALUES(CLASS_SEQ.NEXTVAL,'�ڹ�',10000000,50,3);
INSERT INTO CLASS_TBL
VALUES(CLASS_SEQ.NEXTVAL,'����Ŭ',20000000,50,3);
SELECT * FROM CLASS_TBL;
DESC ENROLMENT;

INSERT INTO ENROLMENT
VALUES(3,4);
INSERT INTO ENROLMENT
VALUES(2,4);
INSERT INTO ENROLMENT
VALUES(3,3);
SELECT * FROM ENROLMENT;

--�л�
SELECT STUDENT_CODE FROM STUDENT WHERE STUDENT_NAME='�л�3';
SELECT * FROM ENROLMENT WHERE STUDENT_CODE=3;

SELECT CLASS_NAME, CLASS_PAY, CLASS_TERM, TEACHER_NAME, TEACHER_PHONE
FROM CLASS_TBL
JOIN TEACHER USING(TEACHER_CODE)
WHERE 
CLASS_CODE IN
    (SELECT * FROM ENROLMENT 
    WHERE STUDENT_CODE=
         (SELECT STUDENT_CODE FROM STUDENT 
         WHERE STUDENT_NAME='�л�3')
     );--���������߰�
     
--�������� 
SELECT TEACHER_CODE FROM TEACHER WHERE TEACHER_NAME='����3';
SELECT CLASS_CODE FROM CLASS_TBL WHERE TEACHER_CODE=3;

SELECT STUDENT_CODE FROM ENROLMENT WHERE CLASS_CODE IN (1,2);
SELECT * FROM STUDENT WHERE STUDENT_CODE = 4;

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
--�ǽ�3
/*
���� ���� ������� ���� ����, ���� ���� ������ �ش��Ѵ�.
1.  �������� �ִ� å���� �з���ȣ, �з���, ���ڸ�, ������, ���ǻ�, ���ǿ����� ���� �Ӽ����� ��ϵǾ� �ְ�, �������� ���� ������ ������ȣ�� �ο��ȴ�. (���� �������̶� ������ȣ�� �ٸ���.)
2.  ���� ������ ������¿� ���� ������� ���� 0�� ��� ���� ������ ������ �̴��� ������ �ǰ� ���� ���� ���� 1�̸� ���� ���� ������ ���� �����̴�. 
3.  ���������� ���� ������ ������ �����ϴ� ���� ����Ѵ�. ���� ���ǻ糪 ���� ������ ���� �����ϰ�, ���� ���� ����ϴ� �ϳ��� ����ó�� �Ҵ� �Ǿ� �ִ�. 
4.  ������ ���� ���� �� �ִ� ����� �л�, ����, �����̴�. �� ����� ������ �� �ִ� �������� ���� ����Ⱓ�� ������ ������ �л�, ����, ������ ���� �뿩������ �ٸ���. 
	(�л��� ��� �뿩�Ⱓ�� 7��, �뿩���� ���� ���� 1��)
	(������ ��� �뿩�Ⱓ�� 10��, �뿩���� ���� ���� 2��)
	(������ ��� �뿩 �Ⱓ�� 14��, �뿩���� ���� ���� 3��)
5.  �̴��� ������ ��� ������ �� �� �ְ�, ���� ������ ��� ������ �� �� �ִ� ���°� �ȴ�. ����� ������ �ݳ��Ǿ��� ��� ���� ������� �����ڿ��� �켱������ ����ȴ�.?
*/
--å : ������ȣ, �з���ȣ, �з���, ���ڸ�, ������, ���ǻ�, ���ǿ���,�������
--ȸ�� : ȸ����ȣ(PK), ȸ���̸�,ȸ���з�, �뿩���ɵ�����, �뿩�Ⱓ,

--���� : ȸ����ȣ(�ܷ�Ű,�����̸Ӹ�Ű/FK,PK)����ó,�뿩���ɵ�����(3��),�뿩�Ⱓ(14��)

--���� : �뿩��ȣ(PK),�뿩��,ȸ����ȣ,������ȣ,�ݳ�����
--���� : �����ȣ(PK), ȸ����ȣ, ������ȣ

CREATE TABLE RESERVATION (
	RESERVE_NO	NUMBER		NOT NULL,
	BOOK-CODE	NUMBER		NOT NULL,
	MEMBER_NO	NUMBER		NOT NULL
);
COMMENT ON COLUMN RESERVATION.BOOK-CODE IS 'å ������ ��ȣ';

COMMENT ON COLUMN RESERVATION.MEMBER_NO IS '�����ϴ� ����� �����ϱ� ���� �ڵ�';

CREATE TABLE BOOK (
	BOOK-CODE	NUMBER		NOT NULL,
	KIND_NO	NUMBER		NOT NULL,
	KIND_NAME	VARCHAR2(50)		NOT NULL,
	BOOK_WRITER	VARCHAR2(50)		NOT NULL,
	BOOK_NAME	VARCHAR2(100)		NOT NULL,
	BOOK_COMPANY	VARCHAR2(100)		NOT NULL,
	BOOK_DATE	CHAR(10)		NOT NULL,
	BOOK_STATUS	NUMBER		NOT NULL
);

COMMENT ON COLUMN BOOK.BOOK-CODE IS 'å ������ ��ȣ';

COMMENT ON COLUMN BOOK.KIND_NAME IS '�������� ī�װ� ����';

COMMENT ON COLUMN BOOK.BOOK_NAME IS 'å�̸�';

COMMENT ON COLUMN BOOK.BOOK_COMPANY IS 'å �ش� ���ǻ� �̸�';

COMMENT ON COLUMN BOOK.BOOK_DATE IS 'å ���� ����';

CREATE TABLE MEMBER (
	MEMBER_NO	NUMBER		NOT NULL,
	MEMBER_NAME	VARCHAR2(20)		NOT NULL,
	MEMBER_TYPE	CHAR(6)		NOT NULL,
	RENT_COUNT	NUMBER		NOT NULL,
	RENT_DATE	NUMBER		NOT NULL
);

COMMENT ON COLUMN MEMBER.MEMBER_NO IS '�����ϴ� ����� �����ϱ� ���� �ڵ�';

COMMENT ON COLUMN MEMBER.MEMBER_NAME IS '�����ϴ� ����� ���� �� �ź�';

COMMENT ON COLUMN MEMBER.MEMBER_TYPE IS '����/����/�л�';

COMMENT ON COLUMN MEMBER.RENT_COUNT IS '�л�->1��
����->2��
����->3��;

COMMENT ON COLUMN MEMBER.RENT_DATE IS '�л��� ���-> 7��
���� -> 10��
���� ->14��;

CREATE TABLE RENTAL (
	RENTAL_NO	NUMBER		NOT NULL,
	RENTAL_DATE	DATE		NOT NULL,
	RETURN_STATUS	NUMBER	DEFAULT 0	NOT NULL,
	BOOK-CODE	NUMBER		NOT NULL,
	MEMBER_NO	NUMBER		NOT NULL
);

COMMENT ON COLUMN RENTAL.RETURN_STATUS IS '0:�̹ݳ�
1:�ݳ��Ϸ�';

COMMENT ON COLUMN RENTAL.BOOK-CODE IS 'å ������ ��ȣ';

COMMENT ON COLUMN RENTAL.MEMBER_NO IS '�����ϴ� ����� �����ϱ� ���� �ڵ�';

CREATE TABLE EMPLOYEE (
	MEMBER_NO	NUMBER		NOT NULL,
	BUY_COMPANY	VARCHAR2(50)		NOT NULL
);

COMMENT ON COLUMN EMPLOYEE.MEMBER_NO IS '�����ϴ� ����� �����ϱ� ���� �ڵ�';

ALTER TABLE RESERVATION ADD CONSTRAINT PK_RESERVATION PRIMARY KEY (
	RESERVE_NO
);

ALTER TABLE BOOK ADD CONSTRAINT PK_BOOK PRIMARY KEY (
	BOOK-CODE
);

ALTER TABLE MEMBER ADD CONSTRAINT PK_MEMBER PRIMARY KEY (
	MEMBER_NO
);

ALTER TABLE RENTAL ADD CONSTRAINT PK_RENTAL PRIMARY KEY (
	RENTAL_NO
);

ALTER TABLE EMPLOYEE ADD CONSTRAINT PK_EMPLOYEE PRIMARY KEY (
	MEMBER_NO
);

ALTER TABLE EMPLOYEE ADD CONSTRAINT FK_MEMBER_TO_EMPLOYEE_1 FOREIGN KEY (
	MEMBER_NO
)
REFERENCES MEMBER (
	MEMBER_NO
);

