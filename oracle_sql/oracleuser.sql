CREATE TABLE oracleuser (
    no  number primary key,
    name varchar2(30) not null,
    msg  varchar2(60) not null,
    writeday date
    
);
commit;