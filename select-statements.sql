-- get all data from each table
SELECT * FROM users;
SELECT * FROM rooms;
SELECT * FROM participants;
SELECT * FROM messages;

-- list all groups with amount of participants
SELECT
	room_id,
	COUNT(*) as participant_amount
FROM participants
GROUP BY room_id;

-- list all groups user x is a part of
SELECT
	CONCAT(u.first_name, ' ', u.last_name) as user,
    p.room_id
FROM participants p
JOIN users u USING (user_id)
WHERE p.user_id = 4;

-- list all messages user x typed in group x
SELECT *
FROM messages
WHERE user_id = 5
	AND room_id = 1;

-- list all messages from room x and which user sent it
SELECT
    m.room_id,
    u.first_name,
    m.content
FROM messages m
JOIN users u USING (user_id)
WHERE m.room_id = 3
ORDER BY m.message_id;

-- list all users and amount of messages typed
SELECT
	u.first_name,
	COUNT(*) as message_count
FROM messages m
JOIN users u USING (user_id)
GROUP BY user_id;


