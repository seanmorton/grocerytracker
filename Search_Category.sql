SELECT DISTINCT F.name, F.category, F.price, S.name
FROM foods F, available A, stores S
WHERE (F.category = "CategoryInput") AND (A.quantity > 0 );
#CategoryInput is the input