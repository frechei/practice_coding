#1. 定义 cparsedate 方法，把“2013年5月30日下午8点17分50秒”
#   这种使用了“年月日时分秒”的字符串转换为 Time 对象。

reg = /(\d+)年(\d+)月(\d+)日([上下])午(\d+)点(\d+)分(\d+)秒/
str = "2013年5月30日下午8点17分50秒"
reg =~ str

year = Integer($1)
month = Integer($2)
day = Integer($3)

if ($4 == "上")
  hour = Integer($5)
elsif ($4 == "下")
  hour = Integer($5) + 12
end

minute = Integer($6)
second = Integer($7)
t = Time.mktime(year, month, day, hour, minute, second)
p t

#2. 定义 ls_t 方法，把指定目录下的文件按时间顺序排列，就像 Unix 的 ls -t
#   命令那样。这个方法只有一个参数。
#   ls_t( 目录名)
#   将指定目录下的文件名按照时间从小到大的顺序排列并输出。

def ls_t(path)
  dir = Dir.open(path)
  hash = Hash.new
  while name = dir.read
    hash[name] = File.ctime(name)
  end
  hash.sort{|a,b| a[1] <=> b[1]}.each do |key, value|
    p key
  end
end
ls_t(ARGV[0] || ".")

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

months = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa']
years = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov','Dec']
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
print months[month - 1], " ", years[year - 1]
