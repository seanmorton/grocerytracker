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
    @purchases = get_purchases(session['user_id'])
    haml :pantry
  end

  get '/delete_from_pantry' do
    delete_purchase(params[:purchase_id])
    redirect to('/pantry')
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

  get '/all_stores' do
    @all_stores = all_stores
    haml :all_stores
  end

  get '/add_to_store' do
    @stores = all_stores
    @food = { id: params[:food_id], name: params[:food_name] }
    haml :add_to_store
  end

  post '/add_to_store' do
    add_to_available(params[:store_id], params[:food_id], params[:price], params[:quantity])
    redirect to('/all_foods')
  end

  get '/available' do
    @available = available(params[:store_id])
    haml :available
  end

  get '/purchase' do
    update_available(params[:store_id], params[:food_id], params[:quantity])
    create_purchase(session[:user_id], params[:food_id], params[:store_id], params[:price], params[:quantity])
    redirect to("/available?store_id=#{params[:store_id]}")
  end
end
