create sequence recommend_seq
start with 1
increment by 1
nomaxvalue
nominvalue;

create table recommend(
        r_id number(20) primary key,
        r_content varchar2(500) not null,
        u_id varchar2(40),
        contentid varchar2(50),
        foreign key(u_id) references users(u_id),
        foreign key(contentid) references tour_list(contentid)
        );
        