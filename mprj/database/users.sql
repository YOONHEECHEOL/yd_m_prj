CREATE TABLE users(
        u_id varchar2(40) primary key,
        u_pwd varchar2(20) not null,
        u_name varchar2(40) not null,
        u_author varchar2(10) default 'user'
        );