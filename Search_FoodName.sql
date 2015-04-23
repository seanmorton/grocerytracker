SELECT DISTINCT F.name, F.category, A.price, S.name
FROM foods F, available A, stores S
WHERE (F.name = "FoodNameInput") AND (A.quantity > 0);
#foodName is input