require 'mysql2'

DBCONN = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "password", :database => 'grocery_tracker')
DBCONN.query_options.merge!(:symbolize_keys => true)

def all_users
  DBCONN.query("SELECT * FROM users")
end
