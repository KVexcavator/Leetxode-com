#coding: utf-8
# Найдите непрерывный подмассив в массиве (содержащем как минимум 1 элемент),
# который имеет максимальную сумму элементов.
# Пример: [-1, -13, -2, 1, -3, 4, -1, 2, 1, -5, 4] должно вернуть [4, -1, 2, 1].
# Kadane's algoritm

arr = [-1, -13, -2, 1, -3, 4, -1, 2, 1, -5, 4]

def max_subarray(nums)
  max_so_far = max_ending_here = -1.0/0
  nums.each do |x|
    max_ending_here = [x, max_ending_here + x].max
    max_so_far = [max_so_far, max_ending_here].max 
  end
  max_so_far 
end

puts max_subarray arr
