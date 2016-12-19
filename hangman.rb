class Hangman

	attr_reader :word
	attr_accessor :blanks, :guessed_letters

	def	initialize(word)
		@word = word.downcase!
		@blanks = "_"*word.length
		@guessed_letters = []
	end

	def word_include?(guess)
		word.include?(guess)	
	end

	def make_guess(guess)
		@guessed_letters << guess
		guessed_letters
	end

	def update_blanks(guess)
        i = 0
        word.length.times do
            if word[i] == guess
                @blanks[i] = guess
            end
            i += i
        end
    end
end