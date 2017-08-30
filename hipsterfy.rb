# Define a method, #hipsterfy, that accepts a sentence (string) as an argument.
# The method should return a new string with the last vowel removed from each word. 
# 'y' is not a vowel. If a word has no vowels, don't change it. You may assume all
# letters are lower-case.## hipsterfy("towel flicker banana") => "towl flickr banan"

def hip_word(word)
  vowels = ['a', 'e', 'i', 'o', 'u']
  idx = word.length - 1
  while idx > 0
    if vowels.include?(word[idx])
      return word[0...idx] + word[idx+1...word.length]
    end
    idx -= 1
  end
  word
end

def hipsterfy(sentence)
  sentence.split(' ').map { |word| hip_word(word) }.join(' ')
end


puts "-------Hipsterfy-------"
puts hipsterfy("proper") == "propr"
puts hipsterfy("mstrkrft") == "mstrkrft"
puts hipsterfy("towel flicker banana") == "towl flickr banan"
puts hipsterfy("turtle cheeseburger fries") == "turtl cheeseburgr fris"
