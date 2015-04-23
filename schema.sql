DROP DATABASE grocery_tracker;
CREATE DATABASE grocery_tracker;
USE grocery_tracker;

CREATE TABLE users (
  user_id     INTEGER NOT NULL AUTO_INCREMENT,
  user_name   VARCHAR(20) NOT NULL,
  password    VARCHAR(20) NOT NULL,
  name        VARCHAR(40) NOT NULL,
  PRIMARY KEY ( user_id ),
  UNIQUE ( user_name )
);

CREATE TABLE shopping_lists (
  list_id     INTEGER NOT NULL AUTO_INCREMENT,
  user_id     INTEGER NOT NULL,
  name        VARCHAR(20),
  PRIMARY KEY ( list_id ),
  FOREIGN KEY ( user_id ) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE foods (
  food_id INTEGER NOT NULL AUTO_INCREMENT,
  name VARCHAR(60) NOT NULL,
  category VARCHAR(20) NOT NULL,
  description VARCHAR(160),
  PRIMARY KEY ( food_id )
);

CREATE TABLE stores (
  store_id INTEGER NOT NULL AUTO_INCREMENT,
  name VARCHAR(20) NOT NULL,
<<<<<<< HEAD
  location VARCHAR(80),
=======
  location VARCHAR(60),
>>>>>>> 676232d65173d72d51f6b7e3990f806b0a39569d
  PRIMARY KEY ( store_id )
);

CREATE TABLE consists(
	list_id	INTEGER NOT NULL,
	food_id INTEGER NOT NULL,
	quantity INTEGER NOT NULL,
  FOREIGN KEY ( list_id ) REFERENCES shopping_lists(list_id) ON DELETE CASCADE
);

CREATE TABLE purchases(
	purchase_id INTEGER NOT NULL AUTO_INCREMENT,
	user_id INTEGER NOT NULL,
	food_id INTEGER NOT NULL,
	store_id INTEGER NOT NULL,
	price DECIMAL(10, 2) NOT NULL,
	quantity INTEGER NOT NULL,
	purchase_date TIMESTAMP NOT NULL DEFAULT NOW(),
	expiration_date DATE,
	PRIMARY KEY ( purchase_id ),
  FOREIGN KEY ( user_id ) REFERENCES users(user_id),
  FOREIGN KEY ( food_id ) REFERENCES foods(food_id),
  FOREIGN KEY ( store_id ) REFERENCES stores(store_id)
);

CREATE TABLE available(
	food_id	INTEGER NOT NULL,
	store_id INTEGER NOT NULL,
	price DECIMAL(10,2) NOT NULL,
	quantity INTEGER NOT NULL,
  FOREIGN KEY ( store_id ) REFERENCES stores(store_id)
);


