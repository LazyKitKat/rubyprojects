# Template for methods
## def my_any?(&arg)
##  if block_given?
##  else
##    'Block does not exist'
##  end
## end


module Enumerable

  def my_each_with_index(&arg)
    if block_given?
      index = -1
      for i in self
        index += 1
        arg.call(i, index)
      end
    else
      return "Array non existent"
    end
  end

  def my_select(&arg)
    arr = []
    if block_given?
      for i in self
        arr << self[i] if arg.call(i) == true
      end
      arr 
    else
      'Block does not exist'
    end
  end

  def my_all?(&arg)
    if block_given?
      is_true = true
      for i in self 
          if arg.call(i) == false
            is_true = false
          end
      end
      is_true
    else
      'Block does not exist'
    end
  end

  def my_any?(&arg)
    if block_given?
      is_true = false
      for i in self 
          if arg.call(i) == true
            is_true = true
          end
      end
      is_true
    else
      'Block does not exist'
    end
  end

  def my_none?(&arg)
    if block_given?
      is_true = true
      for i in self 
          if arg.call(i) == true
            is_true = false
          end
      end
      is_true
    else
      'Block does not exist'
    end
  end

  def my_count(&arg)
    count = 0
    if block_given?
      for i in self 
          if arg.call(i) == true
            count += 1
          end
      end
      count
    else
      for i in self
        count += 1
      end
      count
    end
  end

end

class Array
  def my_each(&arg)
      if block_given? 
        for i in self
          arg.call(i)
        end
      else
        "Block does not exist"
      end 
  end
end
