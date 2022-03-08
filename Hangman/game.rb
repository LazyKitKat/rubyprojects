class Game
	def initialize()
		puts "Welcome to the game of 'Hangman'!"
		if Dir.exist?("save-games") and Dir.empty?("save-games") == false
			puts "Would you like to load a game? (Y/N, default: Y)"
			@load = gets.chomp
			if @load.downcase == "y" or @load == ""
				load_game()
			else
				new_game()
			end	
		else
			new_game() 
		end 
	end

	def clear_array(arr)
        for i in 0..1 
            arr.shift()
        end
        return arr
    end

    def load_game()
        puts "Pick one of the following:"
        saves = clear_array(Dir.entries('save-games'))
        for i in 1..saves.length
            puts "#{i.to_s}) " + saves[i - 1]
        end
        pick = gets.chomp.to_i
        file_load(saves[pick - 1])
    end

    def file_load(id)
        temp = File.read("save-games/#{id}").split("\n").map { |keyword| keyword.split(" ") }
        @chosen_word = temp[0][1]
        @mistakes = temp[1][1].to_i
		@guess = temp[2][1].split("")
        move()
    end

    def save_game
        puts "Name your save file:"
        name = gets.chomp
        Dir.mkdir('save-games') unless Dir.exist?('save-games')
        filename = "save-games/#{name}.txt"
        file = File.open(filename, "w") 
        file.puts "SelectedWord: " + @chosen_word
        file.puts "Mistakes: " + @mistakes.to_s
		file.puts "GuessScore: " + puts_guess()
    end

	def new_game()
        @word_list = File.read('./dictionary/google-10000-english-no-swears.txt').split("\n")
        @chosen_word = pick_word().downcase
        @mistakes = 0
        @guess = Array.new(@chosen_word.length, "_")
        move()
    end

    def pick_word()
        loop do
            temp = rand(0...@word_list.length)
            if @word_list[temp].length > 5 and @word_list[temp].length < 13
				puts "A word had been selected. Start!"
				puts @word_list[temp]
                return @word_list[temp]
            end
        end
    end

    def update_put(input)
		temp = @guess
        @guess.each_with_index do |char, idx|
            if char == "_" and @chosen_word[idx] == input
                temp[idx] = input
				break
			end 
        end
		return temp
    end

    def check_winner()
        if @guess.include?("_") == false
            return true
        else
            return false
        end
    end

    def check_word(input)
        if @chosen_word.include?(input)
            return true
        else
            return false
        end
    end

	def puts_guess()
		temp = ""
		@guess.each do |letter|
			temp += letter
		end
		return temp
	end

    def move()
        while @mistakes < 13 
			puts "Your guess " + puts_guess()
			puts "Mistakes: " + @mistakes.to_s
            put = gets.chomp.downcase
            if check_word(put) == true 
               update_put(put)
            elsif put.downcase == "save"
                save_game()
            else 
                @mistakes += 1
            end
            check_winner()
            if check_winner() == true
                puts "You won!"
                break
            end
        end
		if @mistakes == 12
			puts "You lost!"
		end
    end

end
