#1. 电子邮件的地址格式为账号名 @ 域名。请写出一个正则表达式，
#   将账号名保存在 $1中，域名保存在 $2 中。

reg = /(.+)@(.+)/i
name = $1
domain = $2

#2. 利用 gsub方法，将字符串“正则表达式真难啊，怎么这么难懂！”
#   置换为“正则表达式真简单啊，怎么这么易懂！”

str = "正则表达式真难啊，怎么这么难懂！"
str.gsub!(/难懂/, "易懂")
str.gsub!(/难/, "简单")
p str

#3. 定义方法word_capitalize，当被指定的参数为用连字符（hyphen）
#   连接的英文字母字符串时，对被连字符分割的部分做 Capitalize 
#   化处理（即单词的首字母大写，其余小写）。
#   p word_capitalize("in-reply-to")    #=> "In-Reply-To"
#   p word_capitalize("X-MAILER")       #=> "X-Mailer"

def word_capitalize(str)
  arr = str.split("-")
  arr_cap =  arr.each do |item|
    item.capitalize!
  end
  str_cap = arr_cap.join("-")
  return str_cap
end

p word_capitalize("in-reply-to")
p word_capitalize("X-MAILER")
