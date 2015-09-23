#1. 仿照 Array#collect 方法，定义 my_collect 方法。参数为拥有 each
#方法的对象，并在块中对各元素进行处理。

def my_collect(obj, &block)
  result = []
  obj.each do |num|
    new_num = block.call(num)
    result << new_num
  end
  return result
end

ary = my_collect([1, 2, 3, 4, 5]) do |i|
    i * 2
end

p ary  #=> [2, 4, 6, 8, 10]

#3. 修改计数器的例子，计算 call 方法的参数的合计值。请补充下面 (??) 部分的代码。

def accumlator
  total = 0
  Proc.new do |x|
    total = 0
    for i in 1..x
      total += i
    end
    total
  end
end

acc = accumlator
p acc.call(1)    #=> 1
p acc.call(2)    #=> 3
p acc.call(3)    #=> 6
p acc.call(4)    #=> 10


