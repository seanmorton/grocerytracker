require 'rubygems'
require 'sinatra'
require 'haml'

class GroceryTracker < Sinatra::Base

  enable :sessions

  before do
    pass if %w(login authenticate register).include? request.path_info.split('/')[1]
    redirect to('/login') if session[:user_id].nil?
  end

  get '/' do
    `fortune`
  end

  get '/login' do
    haml :login, :layout => nil
  end

  get '/logout' do
    session[:user_id] = nil
    redirect to('/pantry')
  end

  post '/login' do
    session[:user_id]  = get_user_id(params[:username], params[:password])
    redirect to('/pantry')
  end

  get '/register' do
    haml :register, :layout => nil
  end

  post '/register' do
    session[:user_id] = new_user(params[:username], params[:password], params[:name])
    redirect to('/pantry')
  end

  get '/pantry' do
    haml :pantry
  end

  get '/all_foods' do
    @all_foods = all_foods
    haml :all_foods
  end

  get '/new_food' do
    haml :new_food
  end

  post '/new_food' do
    new_food(params[:name], params[:category], params[:description])
    redirect to('/all_foods')
  end

  get '/edit_food' do
    @food = get_food(params[:food_id])
    haml :edit_food
  end

  post '/edit_food' do
    edit_food(params[:food_id], params[:name], params[:category], params[:description])
    redirect to('/all_foods')
  end

  get '/delete_food' do
    delete_food(params[:food_id])
    redirect to('/all_foods')
  end

end
