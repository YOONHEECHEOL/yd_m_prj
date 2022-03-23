create sequence visited_seq
start with 1
increment by 1
nomaxvalue
nominvalue;

create table visited(
        v_id number(20) primary key,
        u_id varchar2(40),
        contentid varchar2(50),
        foreign key(u_id) references users(u_id),
        foreign key(contentid) references tour_list(contentid)
        );