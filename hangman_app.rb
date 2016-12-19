require 'sinatra'
require 'rubygems'
require_relative 'hangman.rb'
require 'csv'

enable :sessions

get '/'	do
	erb :player_1_name
end

post '/name' do
	# name = params[:user_name.capitalize]
	session[:name] = params[:user_name.capitalize]
	@name = session[:user_name]
	redirect '/new_word'
end

get '/new_word' do
	# name = params[:user_name.capitalize]
	erb :new_word, :locals => {:name => session[:name]}
end


post '/word' do
	@name = session[:user_name]
	word = params[:word]
	session[:game] = Hangman.new(word)
	redirect '/player_2_name?new_word' + word
end

get'/player_2_name'  do
	erb :player_2_name
end

post '/name2' do
	session[:name2] = params[:user_2_name.capitalize]
	redirect '/game_screen'
end

get '/letter_guess' do
	@name2 = session[:user_2_name]
    @player_word = session[:game].word
    puts "Player: #{session[:user_2_name]}"
    puts "Word: #{session[:game].word}"
    erb :game_screen, :locals => {:incorrect_letters => session[:game].incorrect_letters, :blank_word => session[:game].blank_word}

get '/user_guess' do 
	@name2 = session[:name2]
	letter = params[:user_guess]
	wrong_guesses = session[:game].number_of_incorrect_guesses
	failure = session[:game].check_for_failure
	erb :user_guess, :locals => {:name2 => session[:name2]}
	
end	

post '/guess' do
	letter = params[:user_guess]
	session[:game].game_loop(letter)
	# session[:game].make_guess(letter)
	# session[:game].stop_duplicate_guess
	
	# session[:game].update_incorrect_guess_count(letter)
	# session[:game].show_board
	# if session[:game].check_for_failure == false
		# redirect '/guess_loop'
	# end

end

get '/guess_loop' do
	name2 = params[:user_2_name]
	letter = params[:user_guess]
	wrong_guesses = session[:game].number_of_incorrect_guesses
	failure = session[:game].check_for_failure
	erb :guess_loop, :locals => {:name2 => name2, :wrong_guesses => wrong_guesses}
end

post '/guess_loop' do
	letter = params[:user_guess]
	session[:game].update_blanks(letter)
	session[:game].make_guess(letter)
	# session[:game].stop_duplicate_guess
	
	session[:game].update_incorrect_guess_count(letter)
	session[:game].show_board
	if session[:game].check_for_failure == false
		redirect '/guess_loop'
	end
end	
