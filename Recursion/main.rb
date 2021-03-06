def merge_sort(array)

    return array if array.length < 2

    split_one = merge_sort(array.slice!(0, array.length/2))
    split_two = merge_sort(array)

 
    sorted = []

    until split_one.empty? or split_two.empty?
        if split_one[0] < split_two[0]
            sorted << split_one.shift
        else
            sorted << split_two.shift
        end
    end
    sorted + split_one + split_two
end

arr = [3, 54, 2,1, 75]
p merge_sort(arr)

