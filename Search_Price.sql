SELECT F.name, F.category, A.price, S.name
FROM foods F, available A, stores S
WHERE (p <= 100) AND ( p >= 0) AND (A.quantity > 0 );
#require for upperbound and lowerbound of the price range