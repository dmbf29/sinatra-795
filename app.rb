require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require 'pry-byebug'
# router + controller in one file

# HTTP VERBS (get, post, patch, delete)
post '/restaurants' do
  # i will create the instance here!
  restaurant = Restaurant.new(params)
  restaurant.save
  redirect '/'
end

get "/" do
  # get all the restaurants from the DB
  @restaurants =
    if params[:name].blank?
      Restaurant.all
    else
      Restaurant.where("name LIKE ?", "%#{params[:name]}%")
    end
  # pass them to the view you need an INSTANCE variable
  erb :index
end


# "www.airbnb.com/ro oms/123123"
get "/restaurants/:id" do
  # params -> given to you by default
  # params[:id] -> this will take the ID from the URL
  @restaurant = Restaurant.find(params[:id])
  erb :show
end

# get '/hello' do
#   "Hello again!"
# end
