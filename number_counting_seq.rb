# Number Counting Sequence
#
# The number counting sequence is a sequence of number strings that begins with:
# ["1", "11", "21", "1211", "111221", ...]
#
# "1" is counted as "one 1" or "11", followed by
# "11" which is counted as "two 1s" or "21", followed by
# "21" which is counted as "one 2 and one 1" or "1211", and so on.
#
# It helps to "say it out loud" to describe the item in the sequence.
#
# Given an integer n, generate the n-th element in the number counting sequence.

def number_counting_seq(n)
  count = 0
  result = ''
  while count < n
    if count == 0
      result = '1'
    else
      result = translate(result)
    end
    count += 1
  end
  result
end

def translate(str)
  if str == '1'
    return '11'
  else
    s = ''
    i = 0
    while i < str.length
      temp_count = 1
      j = i
      while str[j] == str[j + 1]
        temp_count += 1
        j += 1
      end
      s += temp_count.to_s + str[j]
      i = j+1
    end
  end
  return s
end


puts "-------Number Counting Sequence-------"
puts number_counting_seq(0) == ""
puts number_counting_seq(1) == "1"
puts number_counting_seq(2) == "11" # one 1 above
puts number_counting_seq(3) == "21" # two 1s above
puts number_counting_seq(5) == "111221" #the last sequence was one 1, one 2, and two 1s: "1211"
puts number_counting_seq(8) == "1113213211"
puts number_counting_seq(10) == "13211311123113112211"
