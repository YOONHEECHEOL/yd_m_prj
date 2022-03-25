-- contentTypeId 불러오기

-- contentTypeId 출력
select distinct content_type_id, content_type_name from service_type;
-- cat1 출력
select distinct cat1, cat1_name from service_type where content_type_id = 12;
-- cat2 출력
select distinct cat2, cat2_name from service_type where content_type_id = 12 and cat1 = 'A01';
-- cat3 출력
select distinct cat3, cat3_name from service_type where content_type_id = 12 and cat1 = 'A01' and cat2 = 'A0101';


--

select * from tabs;

select * from users;

create SEQUENCE mc_seq
START WITH 1
INCREMENT by 1; 

create table my_course
(mc_id  number PRIMARY key,
 u_id   varchar2(80) not null,
 ts_id  varchar2(400) not null,
 mc_regdate date,
 mc_title   varchar2(100),
 mc_description varchar2(100),
 FOREIGN KEY(u_id) REFERENCES USERS(u_id) ON DELETE CASCADE
 );
 
 select * from my_course;
 
 insert into my_course
 values (MC_SEQ.nextval, 'admin@admin.com', 'cId127956 cId2766542 ', SYSDATE, 'test 코스입니다.', 'test목적으로 만든 코스입니다.');
 commit;

update my_course set ts_id = 'cId127956', mc_title = 'update Test 입니다', mc_description = 'update test를 실행함' where mc_id = 1;
