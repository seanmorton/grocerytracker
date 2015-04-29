INSERT INTO purchases (user_id, food_id, store_id, quantity, price, expiration_date)
VALUES (2, 7, 1, 5,
        (SELECT price * 5
	 FROM search_result
	 WHERE (food_id = 7) AND (store_id = 1)),
	 "2015-5-10");


