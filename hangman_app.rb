require 'sinatra'
require 'rubygems'
require_relative 'hangman.rb'
# require_relative 'game_loop.rb'

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
	session[:game] = Hangman.new(word)
	# session[:game].word
	redirect '/name2?word=' + word 
end

get'/name2'  do
	erb :player_2_name
end

post '/name2' do
	name2 = params[:user_2_name]
	redirect '/user_guess?user_2_name='+ name2
end

get '/user_guess' do 
	name2 = params[:user_2_name]
	letter = params[:user_guess]
	wrong_guesses = session[:game].number_of_incorrect_guesses
	failure = session[:game].check_for_failure
	erb :user_guess, :locals => {:name2 => name2, :wrong_guesses => wrong_guesses}
	
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
