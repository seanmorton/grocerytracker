DROP DATABASE grocery_tracker;
CREATE DATABASE grocery_tracker;
USE grocery_tracker;

CREATE TABLE users (
  user_id     INTEGER NOT NULL AUTO_INCREMENT,
  user_name   VARCHAR(20) NOT NULL,
  password    VARCHAR(20) NOT NULL,
  name        VARCHAR(40) NOT NULL,
  PRIMARY KEY ( user_id ),
  UNIQUE ( password )
);

CREATE TABLE shopping_lists (
  list_id     INTEGER NOT NULL AUTO_INCREMENT,
  user_id     INTEGER NOT NULL,
  name        VARCHAR(20),
  PRIMARY KEY ( list_id )
);

CREATE TABLE foods (
  food_id INTEGER NOT NULL AUTO_INCREMENT,
  name VARCHAR(40) NOT NULL,
  category VARCHAR(20) NOT NULL,
  description VARCHAR(60),
  PRIMARY KEY ( food_id )
);

CREATE TABLE stores (
  store_id INTEGER NOT NULL AUTO_INCREMENT,
  name VARCHAR(20) NOT NULL,
  location VARCHAR(20),
  PRIMARY KEY ( store_id )
);

CREATE TABLE consists(
	list_id	INTEGER NOT NULL,
	food_id INTEGER NOT NULL,
	quantity INTEGER NOT NULL
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
	PRIMARY KEY ( purchase_id )
);

CREATE TABLE available(
	food_id	INTEGER NOT NULL,
	store_id INTEGER NOT NULL,
	price DECIMAL(10,2) NOT NULL,
	quantity INTEGER NOT NULL
);


