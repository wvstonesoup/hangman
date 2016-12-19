class Hangman

    attr_reader :word
    attr_accessor :blanks, :incorrect_letters, :correct_letters, :number_of_incorrect_guesses, :chances

    def initialize(word)
        
        @word = (word).downcase
        @blanks = "_" * word.length
        @incorrect_letters = []
        @correct_letters = []
        @number_of_incorrect_guesses = 0
        @chances = 0
        
        # @all_lines_of_file = []  <-- this was just checking to make sure it was reading the whole file.
    end
	
	def game_loop(guess)
		make_guess(guess)
		word_include?(guess)
		# update_blanks(guess)
        # update_incorrect_guess_count
    end


    def word_include?(guess)
       word.include?(guess)
        if word.include?(guess)
           update_blanks(guess)
        else update_guessed_letters(guess) && update_incorrect_guess_count(guess)
        end
    end

    def make_guess(guess)
        guess = guess.delete("^a-zA-Z")
    end

    def update_guessed_letters(guess)
        incorrect_letters << (guess.downcase)
    end

    def update_blanks(guess)
        i = 0
        word.length.times do
            if word[i] == guess
                @blanks[i] = guess
            end
            puts "\n"
            i += 1
        end
    end

     def update_incorrect_guess_count(guess)
        if word.include?(guess)
        else
            @number_of_incorrect_guesses += 1
        end
	puts "Number of incorrect guesses:  #{number_of_incorrect_guesses}" 

    end

    def stop_duplicate_guess
        if @incorrect_letters.uniq.length != @incorrect_letters.length
            puts "Duplicate guess, try again."
            @number_of_incorrect_guesses -= 1
            @incrrect_letters = @incorrect_letters.uniq
		else 
			@number_of_incorrect_guesses = @number_of_incorrect_guesses
        end
    end

    def stop_invalid_guess(guess)
        if valid_guess?(guess) == false
            puts "Only alphabetical characters, 1 at a time."
            @number_of_incorrect_guesses -= 1
        end
    end


    def valid_guess?(guess)
        guess = guess.delete("^a-zA-Z")
        guess.length == 1
    end

    def check_success
        word == blanks
    end

    def check_for_failure
       if number_of_incorrect_guesses == 7
            exit
        end
    end

	def show_board
		@blanks.scan(/_|\w/).join(' ')
	end

end


    # def valid_guess_loop(guess)
    #     # if stop_duplicate_guess
    #     if valid_guess?(guess)

    #     else
    #         puts "Invalid input, try again."
    #         @guessed_letters = @guessed_letters.uniq
    #         receive_input_loop
    #         update_blanks(guess)
    #     end
    # end

# class Hangman

# 	# attr_reader :word
# 	attr_accessor :blanks, :guessed_letters, :word

# 	def	initialize(word)
# 		@word = (word).downcase
# 		@blanks = "_"*word.length
# 		@guessed_letters = []
# 	end

# 	def word_include?(guess)
# 		word.include?(guess)	
# 	end

# 	def make_guess(guess)
# 		@guessed_letters << guess
# 		guessed_letters
# 	end

# 	def update_blanks(guess)
#         i = 0
#         word.length.times do
#             if word[i] == guess
#                 @blanks[i] = guess
#             end
#             i += i
#         end
#     end

# 	def show_board
# 		@blanks.scan(/_|\w/).join(' ')
# 	end
# end