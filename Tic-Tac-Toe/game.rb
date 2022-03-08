$winner = false



class Game
    def initialize 
        @game_board = [
            ["_","_","_"],["_","_","_"],["_","_","_"]
        ]
    end
    def show_board()
        puts @game_board[0][0] + " | " + @game_board[0][1] + " | " + @game_board[0][2]
        puts @game_board[1][0] + " | " + @game_board[1][1] + " | " + @game_board[1][2]
        puts @game_board[2][0] + " | " + @game_board[2][1] + " | " + @game_board[2][2]
    end

    def move (symbol, row, column)
    if row > 2 or column > 2 or @game_board[row][column] != "_"
        puts "You can't make this move"
        move (symbol, row, column)
    else
        @game_board[row][column] = symbol
        check_winner(@game_board)
    end
        
    end
end

class Player
    def initialize (name, symbol)
        @name = name
        @symbol = symbol
    end
    def my_symbol()
        return @symbol
    end
    def my_name()
        return @name
    end
end



## Game



$turn = 1
$new_game = Game.new

if $turn == 1
    puts "Player 1 name: "
    name_one = gets.chomp 
    $player_one = Player.new(name_one, "o")
    puts "Your name is #{$player_one.my_name} and your simbol is #{$player_one.my_symbol}"
    puts "Player 2 name: "
    name_two = gets.chomp
    $player_two = Player.new(name_two, "x")
    puts "Your name is #{$player_two.my_name} and your simbol is #{$player_two.my_symbol}"
end

def check_tie(res)

    if res.include?("_") == false and $winner == false
        $winner = true
        puts "Tie!"
    end

end

def check_winner(temp_one)
    if (temp_one[0][0] == "o" and temp_one[0][1] == "o" and temp_one[0][2] == "o") or (temp_one[1][0] == "o" and temp_one[1][1] == "o" and temp_one[1][2] == "o") or (temp_one[2][0] == "o" and temp_one[2][1] == "o" and temp_one[2][2] == "o") or (temp_one[0][0] == "o" and temp_one[1][1] == "o" and temp_one[2][2] == "o") or (temp_one[2][0] == "o" and temp_one[1][1] == "o" and temp_one[0][2] == "o") 
        $winner = true
        puts "#{$player_one.my_name} is the winner"
    elsif (temp_one[0][0] == "x" and temp_one[0][1] == "x" and temp_one[0][2] == "x") or (temp_one[1][0] == "x" and temp_one[1][1] == "x" and temp_one[1][2] == "x") or (temp_one[2][0] == "x" and temp_one[2][1] == "x" and temp_one[2][2] == "x") or (temp_one[0][0] == "x" and temp_one[1][1] == "x" and temp_one[2][2] == "x") or (temp_one[2][0] == "x" and temp_one[1][1] == "x" and temp_one[0][2] == "x") 
        $winner = true
        puts "#{$player_two.my_name} is the winner"  
    elsif (temp_one[0][0] == "o" and temp_one[1][0] == "o" and temp_one[2][0] == "o") or (temp_one[0][1] == "o" and temp_one[1][1] == "o" and temp_one[2][1] == "o") or (temp_one[0][2] == "o" and temp_one[1][2] == "o" and temp_one[2][2] == "o")
        $winner = true
        puts "#{$player_one.my_name} is the winner" 
    elsif (temp_one[0][0] == "x" and temp_one[1][0] == "x" and temp_one[2][0] == "x") or (temp_one[0][1] == "x" and temp_one[1][1] == "x" and temp_one[2][1] == "x") or (temp_one[0][2] == "x" and temp_one[1][2] == "x" and temp_one[2][2] == "x")
        $winner = true
        puts "#{$player_two.my_name} is the winner"
    end
    check_tie(temp_one.flatten)
end



def playgame()

    while $winner == false do
        $new_game.show_board()
        if ($turn % 2 != 0)
            puts "#{$player_one.my_name} pick your row"
            row = gets.chomp
            puts "Now pick your column"
            column = gets.chomp
            $new_game.move("o", row.to_i, column.to_i)
        else
            puts "#{$player_two.my_name} pick your row"
            row = gets.chomp.to_i
            puts "Now pick your column"
            column = gets.chomp.to_i
            $new_game.move("x", row, column)
        end     
            puts ("Turn: " + $turn.to_s)
            $turn += 1
    end
end

playgame()
