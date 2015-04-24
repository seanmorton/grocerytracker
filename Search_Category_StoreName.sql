CREATE VIEW search_result AS
SELECT DISTINCT F.food_id, F.name AS food_name, F.category, A.price, S.store_id, S.name AS store_name
FROM foods F, available A, stores S
WHERE (F.category = "Produce") AND (S.name = "Target") 
	AND (A.quantity > 0 ) AND (F.food_id = A.food_id) 
	AND (S.store_id = A.store_id);

SELECT food_name, category, price, store_name
FROM search_result;

DROP VIEW search_result;