drop table comment;
drop table post;
drop table member;


CREATE  TABLE member
(
    id identity not null primary key,
    email varchar2 not null,
    password varchar2 not null,
    name varchar2 not null,
    created timestamp not null default current_timestamp,
    updated timestamp ,
    deleted timestamp
);


CREATE  TABLE post
(
    id identity not null primary key,
--      member_id long not null,
    member_id long,
    title varchar2 not null,
    content varchar2 not null,
    like_count int not null default 0,
    created timestamp not null default current_timestamp,
    updated timestamp ,
    deleted timestamp
);


CREATE  TABLE comment
(
    id identity not null primary key,
    parent_id long not null,
    post_id long not null,
    member_id long not null,
    content varchar2 not null,
    created timestamp not null default current_timestamp,
    updated timestamp ,
    deleted timestamp
);


commit;

