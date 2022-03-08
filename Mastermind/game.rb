require './player.rb'
require './messages.rb'
require './creator.rb'
require './computer_play.rb'

class Game
    include Messages
    include Breaker
    include Maker
    include ComputerPlay

    def initialize()
        opening_message()
        @pick = gets.chomp.to_i
        @player_var
        loop do 
            if @pick < 1 or @pick > 2
                incorrect_choice()
                @pick = gets.chomp.to_i
            elsif @pick == 1
                puts "Computer has generated a code you need to break.\nGood luck."
                generate_code()
                break
            elsif @pick == 2 
                puts "Please procced to code creaton so you can try to win against a computer."
                @player_var = player_pick()
                @player_code = @player_var.split("")
                computer_play(@player_code)
                break
            end
        end
        play_again() 
    end

    def play_again()
        loop do
            try_again()
            @play_again = gets.chomp
            if @play_again.downcase == "y"
                Game.new
                break
            else
                return 1
            end
        end
    end
end
