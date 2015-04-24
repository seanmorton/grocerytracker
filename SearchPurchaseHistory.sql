SELECT user_name, purchase_date, foods.name AS food_name, stores.name AS store_name, available.price AS unit_price,
       purchases.quantity AS quantity, purchases.price AS total_price
FROM users, foods, stores, purchases, available
WHERE (user_id = 2) AND
      (users.user_id = purchases.user_id) AND (foods.food_id = purchases.food_id) AND (stores.store_id = purchases.store_id) AND
      (foods.food_id = available.food_id) AND (stores.store_id = available.store_id);
