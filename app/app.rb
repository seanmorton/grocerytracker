require 'sinatra'
require 'haml'

class GroceryTracker < Sinatra::Base
  get '/' do
    "<h2>#{`fortune`}</h2>"
  end

  get '/all_users' do
    @all_users = all_users
    haml :all_users
  end
end
