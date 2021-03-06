CREATE VIEW search_result AS
SELECT F.food_id, F.name AS food_name, F.category, A.price, S.name AS store_name, S.store_id
FROM foods F, available A, stores S
WHERE (A.price <= 10.00 ) AND ( A.price >= 0) AND (F.category = "Beverage") AND (A.quantity > 0 ) 
      AND (S.store_id = A.store_id) AND (F.food_id = A.food_id);
#require for upperbound and lowerbound of the price range

SELECT food_name, category, price, store_name
FROM search_result;

DROP VIEW search_result;
