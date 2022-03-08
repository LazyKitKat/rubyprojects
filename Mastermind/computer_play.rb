require './game.rb'
require './player.rb'
require './messages.rb'
require './computer_play.rb'

module ComputerPlay

    def rand_num()
        return rand(1..6).to_s
    end

    def comp_code_check(break_array, guess_array)
        @comp_guess_statement = String.new
        for i in 0..3 do
           if guess_array[i] == break_array[i]
               @comp_guess_statement += "O"
           elsif (guess_array[i] != break_array[i]) and break_array.include?(guess_array[i])
               @comp_guess_statement += "X"
           end
        end
    end



    def computer_play(array_in)
        comp_turn = 0
        comp_arr = []
        while comp_turn < 12
            if comp_turn == 0
                for i in 0..3 do
                    comp_arr << rand_num()
                end
                comp_code_check(array_in, comp_arr)
            else
                new_temp_arr = strategies(comp_arr, array_in)
                comp_code_check(array_in, new_temp_arr)
            end

            if @comp_guess_statement == "OOOO"
                break
                puts "Computer has cracked your code."
            end
            comp_turn += 1
        end
        if comp_turn == 12
            puts "Computer has failed. Good job."
        end
    end

    def strategies(ai_arr, my_arr)
        temp = Array.new
        for i in 0..3 do
            if @comp_guess_statement[i] == "O"
                temp << ai_arr[i]
            else
                temp << rand_num()
            end
        end
        return temp
    end
end