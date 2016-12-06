require 'sinatra'
require 'rubygems'
require_relative 'hangman.rb'

enable :sessions

get '/'	do
	erb :player_1_name
end

post '/name' do
	name = params[:user_name]
	redirect '/new_word?user_name='+ name
end

get '/new_word' do
	name = params[:user_name]
	# word = params[:word]
	erb :new_word, :locals => {:name => name}
end


post '/word' do
    # session[:game] = Hangman.new(word)
	name = params[:user_name]
	word = params[:word]
	redirect '/player_2_name?word=' + word 
end

get'/player_2_name'  do
	name = params[:user_name]
	erb :player_2_name, :locals => {:name => name}
end

post '/name2' do
	name2 = params[:user_2_name]
	redirect '/user_guess?user_2_name='+ name2
end

get '/user_guess' do 
	name = params[:user_guess]
	erb :user_guess, :locals => {:word => word}
end	