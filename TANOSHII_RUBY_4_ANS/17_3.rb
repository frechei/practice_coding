#3. 定义一个功能类似于 Unix 中的 tail 命令的 tail 方法。
#   tail 方法有两个参数。
#   tail( 行数, 文件名)
#   从文件的末尾开始数，输出参数指定的行数的内容。也就是说，假设
#   有一个有 100行数据的文件 some_file.txt，执行
#   tail(10, "some_file.txt") 后，程序就会跳过前90 行数据，
#   只在标准输出中输出最后 10 行数据。

File.open(ARGV[1], "r+") do |io|
  lines = io.readlines
  len = Integer(ARGV[0])
  stop = lines.length - 1
  start = stop - len
 # for i in start..stop
 #   print lines[i]
 # end
 str = lines[start..stop].join
 print str
end
