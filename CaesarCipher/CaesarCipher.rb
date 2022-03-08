LOWER_CASE = [*'a'..'z']
UPPER_CASE = [*'A'..'Z']

def shift (input_letter, num, upper)
    index = 0
    new_letter = ""
    if upper == true
        if (UPPER_CASE.index(input_letter) + num >= 26)
            index = UPPER_CASE.index(input_letter) - 26 + num
            new_letter = UPPER_CASE[index]
        else
            index = UPPER_CASE.index(input_letter) + num
            new_letter = UPPER_CASE[index]
        end
    else
        if (LOWER_CASE.index(input_letter) + num >= 26)
            index = LOWER_CASE.index(input_letter) - 26 + num
            new_letter = LOWER_CASE[index]
        else
            index = LOWER_CASE.index(input_letter) + num
            new_letter = LOWER_CASE[index]
        end
    end
    return new_letter
end

def caesar(string, shif_num) 
    temp = string.split("").to_a
    result = ""
    temp.each do |letter|
       if LOWER_CASE.include?(letter)
           result += shift(letter, shif_num, false)
       elsif UPPER_CASE.include?(letter)
            result += shift(letter, shif_num, true)
       else
           result += letter
       end
    end
    puts result
end

puts "What do you want to encrypt?"
string_input = gets.chomp
puts "Enter a number to shift the string."
shift_string = gets.chomp
caesar(string_input.to_s, shift_string.to_i)
