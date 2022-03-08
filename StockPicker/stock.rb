def stock(arr) 
    min = arr.min
    max = arr.max
    temp = []
    if arr.index(min) == (arr.length - 1) or arr.index(max) == 0
        return "You can't buy."
    elsif arr.index(min) > arr.index(max)
        temp_min = min
        arr.each do |num|
            if num < temp_min and arr.index(num) < arr.index(max)
                temp_min = num
            end
        end
        temp << temp_min
        temp << max
    else
        temp << min
        temp << max
    end
    puts temp
end


stock([1,3,6,9,15,8,6,10])