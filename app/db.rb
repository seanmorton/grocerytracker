require 'mysql2'

DBCONN = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "password", :database => 'grocery_tracker')
DBCONN.query_options.merge!(:symbolize_keys => true)



def get_user_id(username, password)
  tuple = DBCONN.query("SELECT user_id FROM users WHERE user_name = '#{username}' AND password = '#{password}'").first
  tuple.nil? ? nil : tuple[:user_id]
end

def new_user(username, password, name)
  DBCONN.query("INSERT INTO users (user_name, password, name) VALUES ('#{username}', '#{password}', '#{name}')")
  tuple = DBCONN.query("SELECT user_id FROM users WHERE user_name = '#{username}' AND password = '#{password}'").first
  tuple[:user_id]
end

def all_foods
  DBCONN.query("SELECT * FROM foods")
end

def get_food(food_id)
  DBCONN.query("SELECT * FROM foods WHERE food_id = #{food_id}").first
end

def new_food(name, category, description)
  DBCONN.query("INSERT INTO foods (name, category, description) VALUES ('#{name}', '#{category}', '#{description}')")
end

def edit_food(food_id, name, category, description)
  food = DBCONN.query("SELECT * FROM foods WHERE food_id = #{food_id}").first
  DBCONN.query("UPDATE foods SET name ='#{name || food[:name] }', category = '#{category || food[:category] }', description = '#{description || food[:description]}' WHERE food_id = #{food_id}")
end

def delete_food(food_id)
  DBCONN.query("DELETE FROM foods WHERE food_id = #{food_id}")
end
