#1. 定义散列 wday，内容为星期的英文表达与中文表达的对应关系。

wday = {
  sunday: "星期日",
  monday: "星期一",
  tuesday: "星期二",
  wednesday: "星期三",
  thursday: "星期四",
  friday: "星期五",
  saturday: "星期六"
}

p wday

#2. 使用散列的方法，统计 1 的散列 wday 中键值对的数量。
p wday.size

#3. 使用 each 方法和 1 的散列 wday，输出下面的字符串
#   “sunday”是星期天。
#   “monday”是星期一。
#    ┊

wday.each do |key, value|
  puts "\"#{key}\"是#{value}"
end

#4. 散列没有像数组的 %w 这样的语法。因此，请定义方法
#   str2hash，将被空格、制表符、换行符隔开的字符串转换为散列。
#   p str2hash("blue 蓝色 white 白色\nred 红色")
#   #=> {"blue"=>"蓝色"， "white"=>"白色", "red"=>"红色"}

def str2hash(str)
  arr = str.split(/\s/)
  hash = Hash.new
  i = 0
  while i < arr.size
    hash.store(arr[i], arr[i+1])
    i += 2
  end
  return hash
end

p str2hash("blue 蓝色 white 白色\nred 红色")

#答案思路
def str2hash_answer(str)
  hash = Hash.new
  array = str.split(/\s+/)  #我落下这个+了
  while key = array.shift   #思路确实好过好
    value = array.shift
    hash[key] = value
  end
  return hash
end
