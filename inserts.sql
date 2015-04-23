INSERT INTO users (user_name, password, name)
VALUES ("tommyLovesPuppies", "BegginStrips123", "Tom Meyer"),
       ("AnhaiDoan", "anhai564", "Anhai Doan"),
       ("dannywang0911", "dwang254", "Danni Wang"),
       ("fishball1121", "liu487", "Yuting Liu"),
       ("SeanMorton", "smmorton", "Sean Morton"),
       ("IanWeiland", "iweiland", "Ian Weiland");

<<<<<<< HEAD
INSERT INTO foods (name, category, description)
VALUES ("Anhai Farms Golden Apples", "Produce", "1 bushell of the finest golden delicious apples"),
       ("Chex Mix", "Snack", "With a variety of delicious tastes and textures"),
       ("Goldfish", "Snack", "The crackers are all natural and are free of artificial preservatives"),
       ("Cut Green Beans", "Vegetable", "Serve the family a delicious meal with a healthy vegetable side"),
       ("Sweet Peas", "Vegetable", "Can be used in salads, pot pies, casseroles and much more"),
       ("Bud Light Beer", "Beverage", "Clean, crisp, smooth taste"),
       ("Minute Maid Orange Juice", "Beverage", "6 bottles filled with 100% orange juice, no added sugar"),
       ("Sunny Meadow Grade A Eggs", "Diary", "To prevent illness From bacteria, keep eggs refrigerated"),
       ("Great Value 2% Milk", "Diary", "Reduced fat milk, Vitamin A palmitate, Vitamin D3"),
       ("Reese's Kit Kat", "Snack", "Classic crisp wafers are wrapped in a delicious milk chocolate");
=======
INSERT INTO shopping_lists (user_id,name)
VALUES ((SELECT user_id FROM users WHERE name='Tom Meyer'), 'Toms Groceries');
>>>>>>> 676232d65173d72d51f6b7e3990f806b0a39569d

INSERT INTO stores (name, location)
VALUES ("Target", "Hildale Mall, Madison, WI"),
       ("Walgreens", "State Steet, Madison, WI"),
       ("Walmart", "Watts Road, Madison, WI");

INSERT INTO available (food_id, store_id, price, quantity)
VALUES (1, 1, 2.99, 50),
       (1, 2, 2.89, 20),
       (2, 1, 3.50, 15),
       (2, 2, 3.62, 10),
       (3, 2, 4.25, 20),
       (3, 3, 4.19, 45),
       (4, 1, 6.19, 25),
       (4, 3, 6.80, 32),
       (5, 3, 5.32, 38),
       (6, 1, 19.99, 10),
       (6, 2, 18.85, 12),
       (6, 3, 20.09, 20),
       (7, 1, 7.50, 40),
       (7, 2, 7.65, 30),
       (7, 3, 7.45, 60),
       (8, 1, 4.20, 16),
       (8, 3, 4.19, 24),
       (9, 1, 5.32, 15),
       (9, 2, 5.49, 10),
       (9, 3, 5.38, 25),
       (10, 1, 6.10, 30),
       (10, 2, 6.15, 12),
       (10, 3, 5.98, 28);

INSERT INTO shopping_lists (user_id, name)
VALUES (1, "Every Week List"),
       (2, "Party List"),
       (1, "Party List"),
       (3, "Diet List"),
       (4, "Health List"),
       (4, "Others"),
       (5, "Diet List"),
       (6, "Health List"),
       (6, "Every Month List");



<<<<<<< HEAD
=======
INSERT INTO available (food_id,store_id,price,quantity)
VALUES ('food_id','store_id','price','quantity');
>>>>>>> 676232d65173d72d51f6b7e3990f806b0a39569d
