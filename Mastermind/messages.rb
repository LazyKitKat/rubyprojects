module Messages
    def opening_message
        puts "Hi, this is game of MASTERMIND!\nYou can either break or make a secret code, it's up to you."
        puts "Please select one of the following:"
        puts "BREAKER (1)\nMAKER (2)"
    end
    def error_message
        puts "You did not input a correct number. You need to pcik a 4 digit number combination, \nwritten without spaces, e.g. 1234"
    end
    def incorrect_choice
        puts "You did not put in a correct number"
        puts "Please select one of the following:"
        puts "BREAKER (1)\nMAKER (2)"
    end
    def win_message
        puts "You won! Great game."
    end
    def lose_message
        puts "You lost."
    end
    def input_code
        puts "Input your code"
    end
    def try_again
        puts "Wanna try again? (Y/N)"
    end
end