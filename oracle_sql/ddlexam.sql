DROP TABLE COMPANY_TBL;
DROP TABLE EXPERT_TBL;


CREATE TABLE EXPERT_TBL(
    MEMBER_CODE  number PRIMARY KEY, -- �⺻Ű					-- ȸ�������ڵ�
    MEMBER_ID    varchar2(20), -- �ߺ�����			-- ȸ�� ���̵�
    MEMBER_PWD   varchar2(20)NOT NULL,    -- NULL �� ������	-- ȸ�� ��й�ȣ
    MEMBER_NAME  varchar2(10)NOT NULL, -- NULL�� ��� ����	-- ȸ�� �̸�
    MEMBER_ADDR  varchar2(50)NOT NULL, -- NULL�� ������	-- ȸ�� ������
    GENDER       char(3) CHECK (GENDER IN ('��', '��')), -- '��' Ȥ�� '��'�θ� �Է� ����	-- ����
    PHONE        char(13)   DEFAULT '010-0000-0000',                             --��ȭ��ȣ
    UNIQUE(MEMBER_ID)
    
);
INSERT INTO EXPERT_TBL 
VALUES(1,'user01','1234','����1','�����','��','010-1234-1234');
INSERT INTO EXPERT_TBL 
VALUES(2,'user02','1234','����2','�����','��',DEFAULT);
INSERT INTO EXPERT_TBL (MEMBER_CODE,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_ADDR,GENDER)
VALUES(3,'user03','1234','����3','�����','��');
INSERT INTO EXPERT_TBL 
VALUES(4,'user05','1234','����4','�����','��','010-1234-1237');

CREATE TABLE COMPANY_TBL(
    MEMBER_CODE number REFERENCES EXPERT_TBL ON DELETE CASCADE, -- �ܷ�Ű(EXPERT_TBL�� �⺻Ű ����)	-- ȸ�������ڵ�
    SKILL varchar2(50)					            -- ȸ�� �ɷ�
);



INSERT INTO COMPANY_TBL
VALUES(1,'����');
INSERT INTO COMPANY_TBL
VALUES(2,'��');
INSERT INTO COMPANY_TBL
VALUES(3,'��');

SELECT * FROM EXPERT_TBL;
SELECT * FROM COMPANY_TBL;
DELETE FROM COMPANY_TBL WHERE MEMBER_CODE=2;