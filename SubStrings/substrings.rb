MY_DICTIONARY = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings (inp, dictionary)
    temp = inp.downcase.delete('(.!?"%&,)').sub("'", " ").split(" ").to_a
    my_list = Hash.new
    temp.each do |word|
        if my_list.include?(word) == false
            my_list[word] = 0
        end
        if MY_DICTIONARY.include?(word) == true
            my_list[word] += 1 
        end
    end
    puts my_list
end

puts "Enter your string."
my_str = gets.chomp
substrings(my_str, MY_DICTIONARY)