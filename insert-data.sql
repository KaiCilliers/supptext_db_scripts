INSERT INTO users (first_name, last_name, phone)
VALUES	('Joshua', 'Kitchens', '+27-555-047-919'), -- 1
		('Matthew', 'Corzine', '+27-555-244-550'), -- 2
        ('ALex', 'Raye', '+27-812-555-244'), -- 3
        ('Kai', 'Gallant', '+27-555-715-968'), -- 4
        ('Nadine', 'Franzoni', '+27-814-555-064'), -- 5
        ('Lara', 'Nappi', '+27-813-555-716'), -- 6
        ('Michael', 'Speck', '+27-605-552-820'), -- 7
        ('Angela', 'Robarge', '+27-714-555-727'), -- 8
        ('James', 'Augsper', '+27-555-180-530'), -- 9
        ('Wilhelm', 'Sarro', '+27-555-506-896'); -- 10

INSERT INTO rooms(private)
VALUES	(1), -- nadine 5, kai 4
		(1), -- lara 6, wilhelm 10
		(0), -- nadine 5, james 9, angela 8
        (1); -- joshua 1, kai 4

INSERT INTO participants
VALUES	(1, 5, 1, 1),
		(1, 4, 1, 0),
        (2, 6, 1, 1),
        (2, 10, 0, 0),
        (3, 5, 1, 1),
        (3, 9, 0, 0),
        (3, 8, 1, 0),
        (4, 1, 1, 1),
        (4, 4, 1, 0);
        
INSERT INTO messages(room_id, user_id, content)
VALUES	(1, 5, "hey kai!"),
		(3, 5, "ok listen up guys..."),
        (3, 5, "we are going to the wine and cheese festival"),
        (3, 5, "We leave at 9:30am on Sunday"),
        (3, 8, "Thanks nadine! Excited for the event"),
		(2, 6, "wilhelm"),
        (4, 1, "Eyo!"),
		(1, 4, "Hey nadine!!"),
        (3, 8, "I will bring some glasses"),
        (3, 9, "Ey! Wine for all!"),
        (4, 4, "hey moss!"),
        (4, 1, "i need a favour"),
        (2, 6, "Do you know [this person]"),
        (2, 6, "Cause I saw her at the mall just now"),
        (1, 5, "did you get milk from the shop?"),
        (4, 1, "it is a big favour..."),
        (1, 4, "I got eggs and bread"),
        (2, 10, "Yea"),
        (4, 4, "cool what is it?"),
        (1, 5, "OK good"),
        (1, 5, "Just also get milk please :*"),
        (3, 5, "Cool guys, excited to see you there"),
        (1, 5, "love you <3"),
        (2, 10, "I know her, she is nice"),
        (2, 6, "cool thanks!"),
        (4, 1, "I need you to come earlier to fetch me on Friday"),
        (4, 1, "mah granny needs me to cut her grass"),
        (3, 8, "ditto, thanks for arranging everything"),
        (3, 9, "yea thanks!"),
        (3, 5, "pleasure"),
        (4, 4, "lel ok cool"),
        (2, 10, "Awesome"),
        (1, 4, "Cool, love you <3"),
        (4, 1, "thanks buddy :D");