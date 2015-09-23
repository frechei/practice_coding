#1. 创建脚本，读取文本文件中的内容，按以下条件进行处理。
#   这里将空白和换行以外的连续字符串称为“单词”。
#   （a）统计文本的行数
#   （b）统计文本的单词数
#   （c）统计文本的字符数

File.open(ARGV[0]) do |io|
  line_num = 0
  word_num = 0
  char_num = 0

  io.each_line do |line|
    line.chomp!
      line_num += 1
      line_arr = line.split(/\s/)   #此处右+，单词数量不一样
      word_num += line_arr.length
      #line.each_char do |ch|
      #  char_num += 1
      #end
      char_num += line.length

  end
  p line_num
  p word_num
  p char_num
end

################################################
#对比作者代码，有两个点没注意到
#1. 对空字符的考虑还不够仔细。reject的作用是相当于delete_if
#2. 多用了一个循环。没想到line也是字符串，也有长度
#def wc(file)
# nline = nword = nchar = 0
# File.open(file){|io|
#   io.each{|line|
#     words = line.split(/\s+/).reject{|w| w.empty? }
#     nline += 1
#     nword += words.length
#     nchar += line.length
#   }
# }
# puts "lines=#{nline} words=#{nword}
# chars=#{nchar}"
#end
#
#wc(__FILE__)
