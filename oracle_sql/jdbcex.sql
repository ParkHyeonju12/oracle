drop table EXAM_BOARD;
drop sequence SEQ_BOARD_NO;

CREATE TABLE EXAM_MEMBER (
    MEMBER_NO       NUMBER  PRIMARY KEY,  --회원번호
    MEMBER_ID       VARCHAR2(20) UNIQUE NOT NULL, --아이디
    MEMBER_PW       VARCHAR2(30) NOT NULL, --비밀번호
    MEMBER_NAME     VARCHAR2(20) NOT NULL, --이름
    MEMBER_PHONE    CHAR(11) --전화번호
);
CREATE SEQUENCE SEQ_MEMBER_NO
START WITH 1
INCREMENT BY 1
MAXVALUE 100
NOCYCLE
NOCACHE;

INSERT INTO EXAM_MEMBER
VALUES(SEQ_MEMBER_NO.NEXTVAL, 'user01','pass01','유저1','01011111111');


CREATE TABLE EXAM_BOARD (
    BOARD_NO        NUMBER  PRIMARY KEY, --게시물번호
    BOARD_TITLE     VARCHAR2(100) NOT NULL,  --제목
    BOARD_CONTENT   VARCHAR2(2000)  NOT NULL, --내용
    BOARD_WRITER    NUMBER REFERENCES EXAM_MEMBER(MEMBER_NO) ON DELETE SET NULL,    --작성자
    READ_COUNT      NUMBER ,  --조회수
    WRITE_DATE      DATE  --작성일
);
CREATE SEQUENCE SEQ_BOARD_NO
START WITH 1
INCREMENT BY 1
MAXVALUE 100
NOCYCLE
NOCACHE;

SELECT * FROM EXAM_board join exam_member on (member_no = board_writer);

select member_id from exam_member where member_id=?;

select board_no, board_title, read_count, write_date, nvl(member_name, '탈퇴회원') as member_name
from exam_board
left join exam_member on (board_writer = member_no);

commit;