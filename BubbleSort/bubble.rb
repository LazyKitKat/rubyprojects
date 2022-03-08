def bubble(arr)
    temp = 0
    final_arr = []
    for j in 0...(arr.length - 1) do
        for i in 0...(arr.length - 1) do 
            if arr[i] > arr[i+1] 
                temp = arr[i + 1]
                arr[i + 1] = arr[i]
                arr[i] =  temp
            end
        end
    end
    puts arr
end

input_arr = gets.chomp
create_arr = input_arr.split(" ").to_a
input_arr = []
for i in 0...create_arr.length
    input_arr << create_arr[i].to_i
end
bubble(input_arr)