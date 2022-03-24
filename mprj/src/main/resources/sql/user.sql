-- contentTypeId 불러오기

-- contentTypeId 출력
select distinct content_type_id, content_type_name from service_type;
-- cat1 출력
select distinct cat1, cat1_name from service_type where content_type_id = 12;
-- cat2 출력
select distinct cat2, cat2_name from service_type where content_type_id = 12 and cat1 = 'A01';
-- cat3 출력
select distinct cat3, cat3_name from service_type where content_type_id = 12 and cat1 = 'A01' and cat2 = 'A0101';
