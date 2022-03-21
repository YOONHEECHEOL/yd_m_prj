create sequence notice_seq
start with 1
increment by 1
nomaxvalue
nominvalue;

CREATE TABLE notice(
        n_id number(20) primary key,
        n_title varchar2(100) not null,
        n_content varchar2(1000) not null,
        n_date date default sysdate,
        n_hit number(38) default 0
        );