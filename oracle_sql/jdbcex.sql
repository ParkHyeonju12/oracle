drop table EXAM_BOARD;
drop sequence SEQ_BOARD_NO;

CREATE TABLE EXAM_MEMBER (
    MEMBER_NO       NUMBER  PRIMARY KEY,  --ȸ����ȣ
    MEMBER_ID       VARCHAR2(20) UNIQUE NOT NULL, --���̵�
    MEMBER_PW       VARCHAR2(30) NOT NULL, --��й�ȣ
    MEMBER_NAME     VARCHAR2(20) NOT NULL, --�̸�
    MEMBER_PHONE    CHAR(11) --��ȭ��ȣ
);
CREATE SEQUENCE SEQ_MEMBER_NO
START WITH 1
INCREMENT BY 1
MAXVALUE 100
NOCYCLE
NOCACHE;

INSERT INTO EXAM_MEMBER
VALUES(SEQ_MEMBER_NO.NEXTVAL, 'user01','pass01','����1','01011111111');


CREATE TABLE EXAM_BOARD (
    BOARD_NO        NUMBER  PRIMARY KEY, --�Խù���ȣ
    BOARD_TITLE     VARCHAR2(100) NOT NULL,  --����
    BOARD_CONTENT   VARCHAR2(2000)  NOT NULL, --����
    BOARD_WRITER    NUMBER REFERENCES EXAM_MEMBER(MEMBER_NO) ON DELETE SET NULL,    --�ۼ���
    READ_COUNT      NUMBER ,  --��ȸ��
    WRITE_DATE      DATE  --�ۼ���
);
CREATE SEQUENCE SEQ_BOARD_NO
START WITH 1
INCREMENT BY 1
MAXVALUE 100
NOCYCLE
NOCACHE;

SELECT * FROM EXAM_board join exam_member on (member_no = board_writer);

select member_id from exam_member where member_id=?;

select board_no, board_title, read_count, write_date, nvl(member_name, 'Ż��ȸ��') as member_name
from exam_board
left join exam_member on (board_writer = member_no);

commit;