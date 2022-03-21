create sequence mc_seq
start with 1
increment by 1
nomaxvalue
nominvalue;

create table my_course(
        mc_id number(20) primary key,
        u_id varchar2(40),
        contentid varchar2(50),
        mc_regdate date default sysdate,
        mc_like number(38) default 0,
        mc_title varchar2(50) not null,
        mc_description
        foreign key(u_id) references users(u_id),
        foreign key(contentid) references tour_list(contentid)
        );

-------
mc_description -> 타입.?