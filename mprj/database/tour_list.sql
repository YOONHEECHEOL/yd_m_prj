create sequence tourlist_seq
start with 1
increment by 1
nomaxvalue
nominvalue;

create table tour_list(
        contentid vcarchar2(50) primary key,
        contenttypeid varchar2(50),
        homepage varchar2(50),
        tel varchar2(50),
        title varchar2(50),
        firstimage varchar2(50),
        firstimage2 varchar2(50),
        aceacode varchar2(50),
        sinungucode varchar2(50),
        addr1 varchar2(50),
        mapx varchar2(50),
        mapy varchar2(50),
        overview varchar2(50)
        );


--------
tour_list 컬럼명 수정
타입 및 크기
오류 : ORA-00907
