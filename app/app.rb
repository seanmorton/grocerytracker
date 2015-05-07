require 'rubygems'
require 'sinatra'
require 'haml'

class GroceryTracker < Sinatra::Base

  enable :sessions

  before do
    pass if %w(login authenticate).include? request.path_info.split('/')[1]
    redirect to('/login') if session[:user_id].nil?
  end

  get '/' do
    'Hello!'
  end

  get '/login' do
    haml :login, :layout => nil
  end

  get '/logout' do
    session[:user_id] = nil
    redirect to('/login')
  end

  post '/login' do
    session[:user_id]  = get_user_id(params[:username], params[:password])
    redirect to('/all_users')
  end

  get '/all_users' do
    @all_users = all_users
    haml :all_users
  end


end
