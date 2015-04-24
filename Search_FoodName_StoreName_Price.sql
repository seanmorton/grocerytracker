CREATE VIEW search_result AS
SELECT DISTINCT F.food_id, F.name AS food_name, F.category, A.price, S.name AS store_name, S.store_id
FROM foods F, available A, stores S
WHERE (F.name = "Minute Maid Orange Juice") AND (S.name = "target") AND (A.price <= 200)
		AND (A.price >= 0 ) AND (A.quantity > 0) AND (F.food_id = A.food_id) AND (S.store_id = A.store_id);

SELECT food_name, category, price, store_name
FROM search_result;

DROP VIEW search_result;