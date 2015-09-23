#1. 有字符串 "Ruby is an object oriented programming
#   language"，请创建一个数组，数组元素为这个字符串的各个单词。

str = "Ruby is an object oriented programming language"
str_arr = str.split()
p str_arr

#2. 有将 1 的数组按照英文字母顺序进行排序。

str_arr.sort!
p str_arr

#3. 不区分大小写，将 2 的数组按照英文字母顺序进行排序。

str_arr.sort!{|a,b| a.downcase <=> b.downcase}
p str_arr

#4. 有把 1 的字符串的全部单词的首字母转换为大写，转换后的结果为 
#   "Ruby Is A n Object Oriented Programming Language"。
str = "Ruby is an object oriented programming language"
str_arr = str.split()
str_arr.each do |ch|
  ch.capitalize!
end
str = str_arr.join(" ")
p str

#5. 有统计 1 的字符串中的字符及其数量，并按下面的形式输出结果
#   （空格字符 6 个，'R'1 个，'a'4 个等等）。
str = "Ruby is an object oriented programming language"
count = Hash.new(0)
str.each_char do |ch|
  count[ch] += 1
end
count.sort{|a,b| a[0] <=> b[0]}.each do |key, value|
  print "'#{key}' : "
  value.times{ print "*" } 
  print  "\n"
end


#6. 定义方法 han2num， 将汉字数字转换为 1 ～ 9999的阿拉伯数字形式，
#   例如将“七千一百二十三”转换为“7123”。

def han2num(han)
  sum = 0
  if /(.)千/ =~ han
    thousand = number($1)
    sum += thousand * 1000
  end

  if /(.)百/ =~ han
    hundred = number($1)
    sum += hundred * 100
  end

  if /(.)十/ =~ han
    ten = number($1)
    sum += ten * 10
  end

  if /([^千百十]$)/ =~ han
    one = number($1)
    sum += one
  end
  return sum
end

def number(str)
  case str
  when "一"
    return 1
  when "二"
    return 2
  when "三"
    return 3
  when "四"
    return 4
  when "五"
    return 5
  when "六"
    return 6
  when "七"
    return 7
  when "八"
    return 8
  when "九"
    return 9
  end
end

p han2num("七千八百九十一")
p han2num("八百九十一")
p han2num("七千九十一")
p han2num("七千八百九十")
p han2num("七千一")
p han2num("八百九十")
p han2num("八百")
p han2num("九十一")

#答案思路
#我写的正则在http://www.rubular.com/结果不太吻合
#包括这里答案也不太吻合，估计编码原因
def han2num_answer(string)
  digit4 = digit3 = digit2 = digit1 = "0"
  nstring = string.dup
  nstring.gsub!(/一/, "1")
  nstring.gsub!(/二/, "2")
  nstring.gsub!(/三/, "3")
  nstring.gsub!(/四/, "4")
  nstring.gsub!(/五/, "5")
  nstring.gsub!(/六/, "6")
  nstring.gsub!(/七/, "7")
  nstring.gsub!(/八/, "8")
  nstring.gsub!(/九/, "9")

  if nstring =~ /((\d)?千)?((\d)?百)?((\d)?十)?(\d)?$/
    if $1
      digit4 = $2 || "1"
    end
    if $3
      digit3 = $4 || "1"
    end
    if $5
      digit2 = $6 || "1"
    end
    digit1 = $7 || "0"
  end

  return (digit4+digit3+digit2+digit1).to_i
end

p han2num_answer("七千八百九十一")
p han2num_answer("八百九十一")
p han2num_answer("七千九十一")
p han2num_answer("七千八百九十")
p han2num_answer("七千一")
p han2num_answer("八百九十")
p han2num_answer("八百")
p han2num_answer("九十一")
