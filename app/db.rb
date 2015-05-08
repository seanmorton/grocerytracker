require 'mysql2'

DBCONN = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "password", :database => 'grocery_tracker')
DBCONN.query_options.merge!(:symbolize_keys => true)



def get_user_id(username, password)
  tuple = DBCONN.query("SELECT user_id
                        FROM users
                        WHERE user_name = '#{username}'
                        AND password = '#{password}'").first

  tuple.nil? ? nil : tuple[:user_id]
end

def new_user(username, password, name)
  DBCONN.query("INSERT INTO users (user_name, password, name)
                VALUES ('#{username}', '#{password}', '#{name}')")

  tuple = DBCONN.query("SELECT user_id
                        FROM users
                        WHERE user_name = '#{username}'
                        AND password = '#{password}'").first

  tuple[:user_id]
end

def all_foods
  DBCONN.query("SELECT * FROM foods")
end

def get_food(food_id)
  DBCONN.query("SELECT * FROM foods WHERE food_id = #{food_id}").first
end

def new_food(name, category, description)
  DBCONN.query("INSERT INTO foods (name, category, description)
                VALUES ('#{name}', '#{category}', '#{description}')")

end

def edit_food(food_id, name, category, description)
  food = DBCONN.query("SELECT * FROM foods WHERE food_id = #{food_id}").first
  DBCONN.query("UPDATE foods
                SET name ='#{name || food[:name] }', category = '#{category || food[:category] }', description = '#{description || food[:description]}'
                WHERE food_id = #{food_id}")
end

def delete_food(food_id)
  DBCONN.query("DELETE FROM foods WHERE food_id = #{food_id}")
end

def all_stores
  DBCONN.query("SELECT * FROM stores")
end

def available(store_id)
  tuple = DBCONN.query("SELECT stores.name as store_name, stores.store_id as store_id, foods.food_id as food_id, foods.name as food_name, foods.category as food_category, foods.description as food_description,
                          available.quantity as quantity, available.price as price
                        FROM available, stores, foods
                        WHERE available.food_id = foods.food_id
                          AND available.store_id = stores.store_id
                          AND stores.store_id = #{store_id}
                          AND available.quantity > 0")

  tuple.each do |t|
    t[:price] = t[:price].to_f
  end
end

def add_to_available(store_id, food_id, price, quantity)
  DBCONN.query("INSERT INTO available (store_id, food_id, price, quantity)
                VALUES (#{store_id}, #{food_id}, #{price}, #{quantity})")
end

def update_available(store_id, food_id, quantity)
  DBCONN.query("UPDATE available
                SET quantity = quantity - #{quantity}
                WHERE store_id = #{store_id}
                  AND food_id = #{food_id}
                  AND quantity > 0")
end

def create_purchase(user_id, food_id, store_id, price, quantity)
  tuple = DBCONN.query("INSERT INTO purchases (user_id, food_id, store_id, price, quantity, expiration_date)
                        VALUES  (#{user_id}, #{food_id}, #{store_id}, #{price}, #{quantity}, '#{(Date.today + Random.rand(-15..30)).strftime('%Y-%m-%d')}')")

end

def delete_purchase(purchase_id)
  DBCONN.query("DELETE FROM purchases WHERE purchase_id = #{purchase_id}")
end

def get_purchases(user_id)
  tuple =  DBCONN.query("SELECT (purchases.quantity*purchases.price) as price_paid, foods.name as food_name, stores.name as store_name,
                          purchases.purchase_id as purchase_id, purchases.price as unit_price, purchases.quantity as quantity, purchases.purchase_date as purchase_date, purchases.expiration_date as expiration_date
                        FROM purchases, foods, stores
                        WHERE purchases.user_id = #{user_id}
                          AND purchases.food_id = foods.food_id
                          AND purchases.store_id = stores.store_id")

  tuple.each do |t|
    t[:price_paid] = t[:price_paid].to_f
    t[:unit_price] = t[:unit_price].to_f
    t[:total_paid] = t[:total_paid].to_f
  end

end

def get_purchases_total_paid(user_id)
  tuple = DBCONN.query("SELECT SUM(purchases.quantity*purchases.price) as total_paid
                        FROM purchases, foods, stores
                        WHERE purchases.user_id = #{user_id}
                          AND purchases.food_id = foods.food_id
                          AND purchases.store_id = stores.store_id")

  tuple.first[:total_paid] = tuple.first[:total_paid].to_f
end


def search(food_name, max_price)
  tuple = DBCONN.query("SELECT foods.name as food_name, available.price as food_price, available.quantity as food_quantity, stores.name as store_name, stores.store_id as store_id
                        FROM foods, available, stores
                        WHERE UPPER(foods.name) LIKE UPPER('%#{food_name}%')
                          AND available.price<= #{max_price}
                          AND foods.food_id = available.food_id
                          AND stores.store_id = available.store_id
                          AND available.quantity > 0
                        ORDER BY available.price ASC")

  tuple.each do |t|
    t[:food_price] = t[:food_price].to_f
  end

end
