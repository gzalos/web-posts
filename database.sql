CREATE DATABASE admindb;


USE admindb;


create table admin(

username varchar(25) not null,

pass varchar(25) not null
);




insert into admin values
(

'admin',

'admin'
);

CREATE TABLE posts(

id int NOT NULL AUTO_INCREMENT,

post text,

timecreated DATETIME,

PRIMARY KEY (id)
);