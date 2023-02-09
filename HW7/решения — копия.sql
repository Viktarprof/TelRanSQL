Ссылка на лекцию https://western-appeal-39b.notion.site/GenTech-Feb-2-2023-a74ddaf68855443e9f4e6737a4a0cbf6 


create database DITOK;
use ditok;


create table users(
		user_id int (10) auto_increment primary key,
                username varchar (100) NOT NULL,
		email varchar (50) NOT NULL,
                datetimes datetime NOT NULL,
                password_hash varchar (120) not null,
                is_bloked bool
);
-- drop table users;



create table Video(
		video_id int (10) auto_increment primary key,
                title varchar (100) NOT NULL,
		descr varchar (50) NOT NULL,
                datetimes datetime NOT NULL,
                duration_ses int (10) NOT NULL,
                user_id int (10) NOT NULL,
                FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE ON UPDATE CASCADE
);
-- drop table  Video;


          
create table reactions(
		reaction_id int (10) auto_increment primary key,
                video_id int (10) NOT NULL,
                user_id int (10) NOT NULL,
		datetimes datetime NOT NULL,
		type char (2) NOT NULL,
                FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE ON UPDATE CASCADE,
                FOREIGN KEY (video_id) REFERENCES Video (video_id) ON DELETE CASCADE ON UPDATE CASCADE
);
-- drop table  reactions;  




create table comments(
		comment_id int (10) auto_increment primary key,
                video_id int (10) NOT NULL,
                user_id int (10) NOT NULL,
		datetimes datetime NOT NULL,
		text varchar (120) NOT NULL,
                FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE ON UPDATE CASCADE,
                FOREIGN KEY (video_id) REFERENCES Video (video_id) ON DELETE CASCADE ON UPDATE CASCADE
);
-- drop table comments;  