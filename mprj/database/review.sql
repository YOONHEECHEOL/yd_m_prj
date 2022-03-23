create sequence review_seq
start with 1
increment by 1
nomaxvalue
nominvalue;

create table review(
        re_id number(20) primary key,
        re_content varchar2(500) not null,
        re_date date default sysdate,
        u_id varchar2(40),
        contentid varchar2(50),
        foreign key(u_id) references users(u_id),
        foreign key(contentid) references tour_list(contentid)
        );