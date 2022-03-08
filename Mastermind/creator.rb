require './messages.rb'

module Maker
    include Messages
    @@player_secret_code = ""
    def player_pick
        loop do
            @player_secret_code = gets.chomp
            if @player_secret_code.count("1-6") < 4
                error_message()
            else
                return @player_secret_code
            end
        end
    end
end