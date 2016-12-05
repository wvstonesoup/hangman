require "minitest/autorun"
require_relative 'hangman.rb'

class TestHangmanFunction <Minitest::Test  

	def test_for_new_game
		game = Hangman.new("beer")  
		assert_equal("beer", game.word)
	end

	def test_for_number_of_blanks
		game = Hangman.new("beer")
		assert_equal("____", game.blanks)
	end

	def test_for_letter_in_word
		game = Hangman.new("beer")
		assert_equal(true, game.word.include?("b"))
		assert_equal(false, game.word.include?("c"))
	end

	def test_for_empty_array_at_game_start
		game = Hangman.new("beer")
		assert_equal([], game.guessed_letters)
	end

	def test_for_letters_guessed_go_into_array
		game = Hangman.new("beer")
		game.make_guess("a")
		game.make_guess("z")
		assert_equal(["a", "z"], game.guessed_letters)
	end

	def test_update_blanks
		game = Hangman.new("beer")
		game.update_blanks("b")		
		assert_equal("b___", game.blanks)
	end
end