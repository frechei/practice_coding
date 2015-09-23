pattern = Regexp.new("(.{0,10})(" + ARGV[0] + ")(.{0,10})")
filename = ARGV[1]

count = 0
File.open(filename) do |file|
  file.each_line do |line|
    line.scan(pattern) do |s|     #scan的正則有()時候返回一個數組
      prefix_len = 0
      s[0].each_char do |ch|
        if ch.ord < 128           #通過ord方法獲取字符編碼的碼位
          prefix_len += 1         #碼位小於128的加一，大於加二
        else
          prefix_len += 2
        end
      end
      space_len = 20 - prefix_len
      puts "#{" "*space_len}#{s[0]}<<#{s[1]}>>#{s[2]}}"
      count += 1
    end
  end
end

puts "count: #{count}"
