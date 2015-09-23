#1. 创建一个数组 a，使 1 到 100 的整数按升序排列（即 a[0] 为 1，a[99] 
#   为 100）

a = []
for i in 1..100
  a << i
end
print a
puts

#2. 将 1 数组中的各元素扩大 100 倍，创建新数组 a2（即 a2[0] 为
#   100）。另外，不创建新数组，将原数组中的各元素都扩大 100 倍。

a2 = a.collect{|item| item * 100}
a.collect!{|item| item * 100}
print a2
puts
print a
puts

#3. 获取 1 数组中值是 3 的倍数的元素，创建新数组 a3（即 a3[0] 为 3，
#   a3[2] 为 9）。另外，不创建新数组，把 3 的倍数以外的元素全部删除。

a = []
for i in 1..100
  a << i
end
####1
a3 = []
a.each do |item|
  if (item % 3 == 0)
    a3 << item
  end
end
####2
a.delete_if{|item| item % 3 != 0}

print a3
puts
print a
puts

#4. 将 1 的数组按倒序排列。
a = []
for i in 1..100
  a << i
end

a.sort!{|a, b| b <=> a}
print a
puts

#5. 求 1 数组中的整数的和。
sum = 0
a.each do |item|
  sum += item
end
puts sum

#6. 从 1 到 100 的整数数组中，取出 10 个分别包含 10 个元素的数组，
#   如 1 ～ 10，11 ～ 20，21 ～ 30。再将取出的全部数组按顺序保存
#   到数组 result中。
ary = []
for i in 1..100
  ary << i
end
result = Array.new
10.times do |i|
  result << ary[i*10, 10]
end
print result
puts

def sum_array(num1s, num2s)
  size1 = num1s.size
  size2 = num2s.size
  sum = []
  length = size1 > size2 ? size1 : size2
  length.times do |i|
    sum << (num1s[i] + num2s[i])
  end
  return sum
end

p sum_array([1,2,3], [4,6,8])
