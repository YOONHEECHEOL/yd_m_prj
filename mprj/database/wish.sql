CREATE SEQUENCE wish_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE;

CREATE TABLE wish(
        w_id number(20) PRIMARY KEY,
        u_id varchar2(40),
        contentid varchar2(50),
        FOREIGN KEY(u_id) REFERENCES users(u_id),
        FOREIGN KEY(contentid) REFERENCES tour_list(contentid)
        );