-- Описание занятия: В рамках БД 'chat' с помощью SQL напишите запрос, который вывеадет информацию о -- чатах  (КТО С КЕМ ОБЩАЕТСЯ), отсортированных по дате посл/сообщения
-- =========================================== 

select 
	messages.message_id,
	messages.created_at,
	users1.fullname as author,
	users2.fullname as recipient,
	users1.country as from_author,
	users2.country as to_recipient
from messages
left join users users1 on messages.author_id = users1.user_id
left join users users2 on messages.recipient_id = users2.user_id

order by messages.message_id desc;