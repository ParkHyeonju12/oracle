CREATE TABLE PHOTO(
    PHOTO_NO        NUMBER          PRIMARY KEY,
    PHOTO_WRITER    VARCHAR(20)     REFERENCES MEMBER_TBL(MEMBER_ID) ON DELETE CASCADE,
    PHOTO_TITLE     VARCHAR(100)     NOT NULL,
    PHOTO_CONTENT   VARCHAR(1000)     NOT NULL,
    FILEPATH        VARCHAR(100)
    
);

CREATE SEQUENCE PHOTO_SEQ;
select * from photo;
select count(*) as cnt from photo;
delete from photo;
drop SEQUENCE photo_seq;
select * from member_tbl;
commit;

select * from(select rownum as rnum, p.*from(select * from photo order by 1 desc) p) where rnum between 1 and 5;