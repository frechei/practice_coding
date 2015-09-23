#3. 使用 Date 类获取本月中每天所对应的星期，并按以下日历格式输出结果。
#
#    May 2013
#    Su Mo Tu We Th Fr Sa
#              1  2  3  4
#     5  6  7  8  9 10 11
#    12 13 14 15 16 17 18
#    19 20 21 22 23 24 25
#    26 27 28 29 30 31

require 'date'

weeks = ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]
months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov","Dec"]
d = Date.today
year = d.year
month = d.month
d1 = Date.new(year, month, 1)
wday1 = d1.wday

#判断一个月有几天
lastdate = Date.new(year, 12, 31)
days_in_a_year = lastdate.yday
#计算二月份的总数
if (days_in_a_year == 365)
  feb = 28
else
  feb = 29
end
#判断本月有几天
case month
when 1,3,5,7,8,10,12
  days_in_a_month = 31
when 4,6,9,11
  days_in_a_month = 30
when 2
  days_in_a_month = feb
end
#打印出来了

print months[month-1], " ", year, "\n"
weeks.each do |item|
  print item, " "
end
puts

table = Array.new(7, " ")
day = 1
for i in wday1..6
  table[i] = day
  day += 1
end
str1 = table.join("  ")
print str1,"\n"
j = 0
for i in day..days_in_a_month
  if (i < 10)
    table[j] = i.to_s + " "
  else
    table[j] = i
  end
  j += 1
  if j > 6
    j = 0
    print table.join(" ")
    print "\n"
    table = Array.new(7, " ")
  elsif i == days_in_a_month
    print table.join(" ")
    print "\n"
  end
end

#看看作者答案，代码行数只有一半。自己写出来的复习度也挺高，维护困难。
#作者利用文具万年历的原理整理日历（此处真心不知道，好像挺有意思的样子）。
#2月30日等不存在的日期，与月末的日期进行比较后就会弹起来（跳到下一个月）
#另外，在表格中不存在的日期，为了让它们遇到相同的条件时候能弹起来，我们将
#它们初始值设为99

require "date"

module Calendar
  WEEK_TABLE = [
    [99, 99, 99, 99, 99, 99,  1,  2,  3,  4,  5,  6,  7],
    [ 2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14],
    [ 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21],
    [16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28],
    [23, 24, 25, 26, 27, 28, 29, 30, 31, 99, 99, 99, 99],
    [30, 31, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99],
  ]

  module_function

  def cal(year, month)
    first = Date.new(year, month, 1)      #被指定的月的1号
    end_of_month = ((first >> 1) - 1).day #次月的一号的前一天
    start = 6 - first.wday                #表示在表格的哪个位置

    puts first.strftime("%B %Y").center(21)
    puts " Su Mo Tu We Th Fr St"
    WEEK_TABLE.each do |week|
      buf = ""
      week[start, 7].each do |day|
        if day > end_of_month
          buf << "   "
        else
          buf << sprintf("%3d", day)
        end
      end
    puts buf
    end
  end
end
  t = Date.today
  Calendar.cal(t.year, t.month)
