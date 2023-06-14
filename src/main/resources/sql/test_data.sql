delete from comment;


delete from post;
insert into post (member_id, title, content, like_count, created, updated, deleted)
values
    (1, 'title1', 'content1', 0, '2021-01-01 00:00:00', null, null),
    (1, 'title2', 'content2', 0, '2021-01-01 00:00:00', null, null);


delete from member;


commit;

