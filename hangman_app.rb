require 'sinatra'
require 'rubygems'
require_relative 'hangman.rb'

enable :sessions

get '/' do 
	erb :player_1_name
end

post '/name' do
	name = params[:user_name]
	redirect '/word?user_name=' + name
end

get '/word'	do
	name = params[:user_name]
	word = params[new_word:word] 

	erb :new_word, :locals => {:name => name, :word => word }
end

post '/word' do
    session[:game] = Hangman.new(word) 
	name = params[:user_name]
	word = params[new_word:word] 
	redirect '/player2_name?new_word' + word + '&user_name=' + name
end

get '/player2_name' do
	name = params[:user_name]
	name2 = params[:user2_name]
	erb :player_2_name, :locals => {:name => name, :name2 => name2}
end

post '/player2_name' do
	name = params[:user_name]
	name2 = params[:user2_name]
	redirect '/user_guess?user_name' + name +'&user2_name=' + name2
	# "Welcome #{name2}! The boxes below represent spaces for the secret word. If you guess correctly, at least one box will be filled in with your letter. An incorrect guess will begin construction of the hangman's gallows.  A list of incorrect letters will display on the screen so you don't waste your guesses, because if you guess wrong 10 times, YOU'RE DEAD! Now, please guess a letter."
end

get '/user_guess' do 
	name = params[:user_guess]
	name2 = params[:user2_name]
	erb :game_screen, :locals => {:name => name, :word => word, :name2 => name2, :user_guess => user_guess}
end	