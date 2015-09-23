#2. 创建脚本，按照以下条件覆盖文本文件中原有的数据。
#（a）将文件中的行逆序排列
#（b）保留文件中第 1 行数据，其余全部删除
#（c）保留文件中最后 1 行数据，其余全部删除


##################################################
#此处用到的truncate也不知道bc两问无法做
##################################################
#a
#File.open(ARGV[0],"r+") do |io|
#  lines = []
#  i = 0
#  io.each_line do |line|
#    lines[i] = line
#    i += 1
#  end
#  io.rewind
#  i = lines.length - 1
#  while i >= 0
#    io.write(lines[i])
#    len -= 1
#  end
#end

# a答案，挺巧妙
# 自己对readlines不熟悉，
# readlines一次性读取所有数据，并且返回每行数据作为元素封装的数组
# 
# open (ARGV[0], "r+") do |io|
#   lines = io.readlines
#   f.rewind
#   f.truncate(0)
#   f.write lines.reverse.join
#end


#b
#File.open(ARGV[0], "r+") do |io|
#  io.gets
#  io.truncate(io.pos)
#end

File.open(ARGV[0], "r+") do |io| 
  lines = []
  i = 0
  io.each_line do |line|
    lines[i] = line
    i += 1
  end
  io.rewind
  io.truncate(0)
  io.write(lines[lines.length-1])
end

#c答案
#File.open(ARGV[0], "r+") do |f| #  lines = f.readlines
#  f.rewind
#  f.truncate(0)
#  f.write lines.reverse[0]
#end
