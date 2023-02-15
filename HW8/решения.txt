-- =============================================
-- Описание занятия: 
-- Задача (1) - в рамках БД "стриминг платформа"
   -- - вывести ТОП-1 юзеров по сумме донатов 
     --   (КТО БОЛЬШЕ ПОЖЕРТВОВАЛ ДОНАТОВ);
     -- - поля
		-- - имя_юзера
		-- - сумма донатов

SELECT max(amount) AS max_sum, users.fullname
FROM donations
LEFT JOIN users ON donations.donator_id=users.user_id
GROUP BY donations.donator_id
ORDER BY max_sum DESC
LIMIT 1;
-- LIMIT 3;


-- =============================================
-- ЗАДАЧА (2) - в рамках БД "стриминг платформа"
   -- - вывести ТОП-3 юзеров по сумме собранных донатов
-- - поля
   -- - имя_юзера
   -- - сумма_собранных_донатов
   
   
SELECT max(amount) AS max_sum, users.fullname
FROM donations
LEFT JOIN users ON donations.donator_id=users.user_id
GROUP BY donations.donator_id
ORDER BY max_sum DESC
LIMIT 3;


-- =============================================
select * from donations;



-- =============================================
-- ЗАДАЧА (3)
   --  - спроектировать и создать с помощью SQL БД для "онлайн чат"
        



create database if not exists Online_chat;
use Online_chat;



create table if not exists users(
		user_id int (10) auto_increment primary key,
		username varchar (255) NOT NULL,
		email varchar (50) NOT NULL,
		datetimes datetime NOT NULL default current_timestamp,
		password_hash varchar (120) not null,
		is_blocked bool default false
);
-- drop table users;



create table if not exists messages(
		messages_id int (10) auto_increment primary key,
		message_text text NOT NULL,
		datetimes datetime NOT NULL default current_timestamp,
		user_id int (10) NOT NULL,
		chats_id int (10) NOT NULL,
		FOREIGN KEY (user_id) REFERENCES users (user_id),
		FOREIGN KEY (chats_id) REFERENCES chats (chats_id)
);
-- drop table  messages;



          
create table if not exists chats(
		chats_id int (10) auto_increment primary key,
		messages_id int (10) NOT NULL,
		user_id int (10) NOT NULL,
        	count_users int (10) NOT NULL,
		datetimes datetime NOT NULL default current_timestamp,
        	online_user char(3) check (online_user in ('Yes', 'No')),
		FOREIGN KEY (user_id) REFERENCES users (user_id),
		FOREIGN KEY (messages_id) REFERENCES messages (messages_id) 
);
-- drop table  chats;  



create table reactions(
		reaction_id int (10) auto_increment primary key,
		user_id int (10) NOT NULL,
        	messages_id int (10) not null,
		datetimes datetime NOT NULL default current_timestamp,
		type char(7) check (type in('like','dislike')),
		FOREIGN KEY (user_id) REFERENCES users (user_id),
		FOREIGN KEY (messages_id) REFERENCES messages (messages_id) 
);
-- drop table  reactions; 






select * from users;
select * from  messages;
select * from  chats;
select * from reactions;
        
        

