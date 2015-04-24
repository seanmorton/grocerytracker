INSERT INTO purchase (user_id, food_id, store_id, quantity, price, expiration_data)
VALUES (2,
	(SELECT food_id, store_id
         FROM search_result
	 WHERE food_id = 1),
	5,
        (SELECT price * 5
	 FROM search_result
	 WHERE food_id = 1),
	 2015-5-10);


