require 'sinatra'
require 'shotgun'
require 'capybara'
require 'selenium-webdriver'

get '/home' do
  "Hello!"
end

get '/secret' do
  "World"
end

get '/random-cat' do
  @name = ["Amigo", "Oscar", "Viking"].sample
  erb :index
end

get '/cat_form' do
  erb :cat_form
end

post '/named-cat' do
  p params
  @name = params[:name]
  erb :index
end
