delete from comment;


delete from post;
insert into post (member_id, title, content, like_count, created, updated, deleted)
values
    (1, 'title1', 'content1', 0, now(), null, null),
    (1, 'title2', 'content2', 0, now(), null, null),
    (2, 'title3', 'content3', 2, now(), null, null);


delete from member;
insert into member (name, email, password, created, updated, deleted)
values ( '김상헌', 'sh@gmail.com', 'pw', now(), null, null),
       ( '정진영', 'jin@gmail.com', 'pass', now(), null, null);

commit;

