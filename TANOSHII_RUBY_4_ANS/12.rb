#1. 表示温度的单位有摄氏、华氏两种。请定义将摄氏转换为华氏的方法
#   cels2fahr。摄氏与华氏的转换公式如下：
#
#   华氏＝摄氏 × 9 ÷ 5 ＋ 32

def cels2fahr(cels)
  fahr = cels * 9 / 5.0 + 32
end


#2. 与 1 相反，请定义将华氏转换为摄氏的方法 fahr2cels。然后从 1 摄氏度到
#   100摄氏度，请按照每隔 1 摄氏度输出一次的方式，输出对应的华氏温度。

def fahr2cels(fahr)
  cels = (fahr - 32) * 5.0 / 9.0
  cels = (cels * 100).round / 100.0
end

1.upto(10) do |f|
  puts fahr2cels(f)
end

#3. 请定义返回掷骰子（1 到 6 随机整数）的结果的 dice 方法。

def dice
  random = Random.rand(5) + 1
end


#4. 请定义合计掷 10 次骰子的结果的 dice10 方法

def dice10
  count = Array.new(6,0)
  10.times do
    case dice
    when 1
      count[0] += 1
    when 2
      count[1] += 1
    when 3
      count[2] += 1
    when 4
      count[3] += 1
    when 5
      count[4] += 1
    when 6
      count[5] += 1
    end
   end
  print count
  puts
end

dice10

#5. 请定义调查整数 num 是否为素数的 prime?(num) 方法。素数的定义为除
#   了 1 和自己外不能被整除的数。个位整数中，2、3、5、7 为素数。

def prime?(num)
  for i in 2..(num-1)
    if(num % i == 0)
      return false
    end
  end
  return true
end

