require "minitest/autorun"
require_relative 'hangman_array.rb'

class TestArrayFunction <Minitest::Test    

	def test_for_one_word_saved
	results = word_array
	assert_equal(1, results.length)
	end

	def test_for_letter_array_equal_seven
		results = letter_array
		assert_equal(7, results.length)
	end

	def test_for_correct_letter_guessed
		results = letter_array
		assert_equal(true, results.include?("a"))
	end
	
	def test_for_incorrect_letter_guessed
		results = letter_array
		assert_equal(false, results.include?("q"))
	end
end