INSERT INTO users (user_name,password,name)
VALUES ('tommyLovesPuppies','BegginStrips123','Tom Meyer');

INSERT INTO shopping_lists (user_id,name)
VALUES ((SELECT user_id FROM users WHERE name='Tom Meyer'),
'Toms Groceries');

INSERT INTO foods (name,category,description)
VALUES ('Anhai Farms Golden Apples','Produce','1 bushell of the finest golden delicious apples');

INSERT INTO stores (name,location)
VALUES ('Target','Hildale Mall Madison, WI');

INSERT INTO consists (list_id,food_id,quantity)
VALUES ('Must be whatever the list id is','Must be whatever the food id is','5');

INSERT INTO purchase (user_id,food_id,store_id,price,quantity,expiration_data)
VALUES ('userid','food_id','store_id','15.23','3','06/13/2015');

INSERT INTO available (food_id,store_id,price,quantity)
VALUES ('food_id','store_id','price','quantity');
