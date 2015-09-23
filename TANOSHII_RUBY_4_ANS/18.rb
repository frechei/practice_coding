#1. 变量 $: 以数组的形式保存着 Ruby 中可用的库所在的目录。定义 
#print_libraries方法，利用变量 $:，按名称顺序输出 Ruby 中可用的库。

def traverse(path)
  if File.directory?(path)
    dir = Dir.open(path)
    while name = dir.read
      next if name == "."
      next if name == ".."
      traverse(path + '/' + name)
    end
  else
    reg = /\/([^\/]+.rb)$/
    if reg =~ path
      p $1
    end
  end
end

def print_libraries
  $:.each do |item|
    traverse(item)
  end
end

#print_libraries

#2. 定义 du 方法，功能类似于 Unix 命令 du，递归输出文件及目录中的数据大小。
#   本方法只有一个参数。
#   du( 目录名)输出指定目录下的文件大小（字节数）以及目录大小。
#   目录大小为该目录下所有文件大小的总和。
require 'find'
def du(top)
  howbig = 0
  Find.find(top) do |path|
    next if FileTest.directory?(path)
    howbig += File.size(path)
  end
  p "#{howbig}: #{top}"
end

#du(ARGV[0])

#def du(path)
#  result = 0
#  Find.find(path){|f|
#    if File.file?(f)
#      result += File.size(f)
#    end
#  }
#  printf("%d %s\n", result, path)
#  return result
#end

du(ARGV[0] || ".")
