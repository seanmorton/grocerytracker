INSERT INTO consists (list_id, food_id, quantity)
VALUES ((SELECT list_id
         FROM shopping_lists
	 WHERE (user_id = 2) AND (name = "Party List")),
	 6,
	 5);
