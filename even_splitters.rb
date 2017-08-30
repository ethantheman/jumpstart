# Even Splitters

# Return an array of characters on which we can split an input string to produce substrings of the same length.
# Don't count empty strings after the split.
# Here's an example for "banana":
# "banana".split("a") # => ["b", "n", "n"] (all elements same length)
# "banana".split("b") # => ["", anana"] (all elements same length - there's only
# one element "anana" because the empty string doesn't count)
# "banana".split("n") # => ["ba", "a", "a"] (all elements NOT same length)
#
# result: ["b", "a"]

def even_split?(letter, string)
  substrings = string.split(letter).reject { |string| string.empty? }
  substrings.all? { |string| string.length == substrings.first.length }
end

def even_splitters(string)
  result = []
  letters = string.split('').uniq
  string.each_char do |ch|
    if even_split?(ch, string)
      result << ch
    end
  end
  result.uniq
end

puts "-----Even Splitters----"
puts even_splitters("") == []
puts even_splitters("t") == ["t"]
puts even_splitters("jk") == ["j", "k"]
puts even_splitters("xoxo") == ["x", "o"]
puts even_splitters("banana") == ["b","a"]
puts even_splitters("mishmash") == ["m","h"]
