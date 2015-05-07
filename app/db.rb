require 'mysql2'

DBCONN = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "password", :database => 'grocery_tracker')
DBCONN.query_options.merge!(:symbolize_keys => true)

def all_users
  DBCONN.query("SELECT * FROM users")
end

def get_user_id(username, password)
  tuple = DBCONN.query("SELECT user_id FROM users WHERE user_name = '#{username}' AND password = '#{password}'").first
  tuple.nil? ? nil : tuple[:user_id]
end
