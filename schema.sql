CREATE TABLE users (
  user_id     INTEGER NOT NULL AUTO_INCREMENT,
  user_name   VARCHAR(20) NOT NULL,
  name        VARCHAR(40) NOT NULL,
  PRIMARY_KEY ( user_id )
);

CREATE TABLE shopping_lists (
  list_id     INTEGER NOT NULL AUTO_INCREMENT,
  user_id     INTEGER NOT NULL,
  name        VARCHAR(20),
  PRIMARY_KEY ( list_id )
);

CREATE TABLE categories (
  category_id INTEGER NOT NULL AUTO_INCREMENT,
  name        VARCHAR(20) NOT NULL,
  PRIMARY_KEY ( category_id )
);

CREATE TABLE foods (
  food_id INTEGER NOT NULL AUTO_INCREMENT,
  category_id INTEGER NOT NULL,
  name VARCHAR(40) NOT NULL,
  description VARCHAR(60),
  PRIMARY_KEY ( food_id )
);

CREATE TABLE stores (
  store_id INTEGER NOT NULL AUTO_INCREMENT,
  name VARCHAR(20) NOT NULL,
  location VARCHAR(20),
  PRIMARY_KEY ( store_id )
);
