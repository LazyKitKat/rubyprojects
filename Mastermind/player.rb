require './messages.rb'

module Breaker
    include Messages
    def generate_code
        @secret_code = Array.new 
        for i in 0..3 do
            @secret_code << rand(1..6)
        end
        puts "The secret code is generated. Now play your turn."
        temp = ""
        @secret_code.each do |str| 
            temp += str.to_s
        end
        puts temp
        play()
    end
    def code_check(arr)
        guess_statement = ""
        arr.each do |sign|
            temp = sign.to_i
            if @secret_code.include?(temp) and (arr.index(sign) == @secret_code.index(temp))
                guess_statement += "O"
            elsif @secret_code.include?(temp) and (arr.index(sign) != @secret_code.index(temp))
                guess_statement += "X"
            end
        end
        if guess_statement == "OOOO"
            return true
        else
            puts guess_statement
        end   
    end
    def play()
        @turn = 0
        while @turn < 12 do
            @temp = Array.new
            puts "Turns left: " + (12 - @turn).to_s
            loop do
                @code_guess = gets.chomp
                if @code_guess.count("1-6") < 4
                    error_message()
                else
                    @temp = @code_guess.split("")
                    code_check(@temp)
                    break
                end
            end
            @turn += 1
            if code_check(@temp) == true 
                win_message()
                break
            elsif @turn == 12
                lose_message()
                @response = gets.chomp
                if @response.downcase == "y"
                    generate_code()
                end
            end
        end
    end
end
