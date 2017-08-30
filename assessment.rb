# Long Word Count

# Return the number of words longer than 7 characters
# "cat cactus balderdash phenomenon amazon" has two words over 7 characters long
# "balderdash" and "phenomenon"
# long_word_count("cat cactus balderdash phenomenon amazon") => 2

def long_word_count(text)
  text.split(' ').count{|word| word.length > 7}
end

puts "-------Long Word Count-------"
puts long_word_count("") == 0
puts long_word_count("short words only") == 0
puts long_word_count("one reallylong word") == 1
puts long_word_count("two reallylong words inthisstring") == 2

# ------------------------------------------------------------------------------

# Calculate

# Define a method, #calculate, that accepts two arguments: a starting value and an
# array of commands. The method should preform the specified commands and return the
# final value. An example of commands might look like:

# [["+", 3], ["/",4 ], ['-', 10], ["*", 6]]

# Note that this is an array of arrays, where the first element is the operation to perform,
# and the second argument is the value to use in the operation. You only need to account
# for the 4 basic operations: +, -, *, and /

# ex: calculate(3, [["*", 5]]) ==> 3 * 5 == 15
# ex: calculate(2, [["+", 2], ["/",4 ]]) ==> (2 + 2) / 4 == 1

def calculate(starting_value, operations)
  for i in 0...operations.length
    # just in case an unexpected operator is given:
    if '*/+-'.include?(operations[i][0]) == false
      puts 'unexpected operator!'
      break
    end
    
    if operations[i][0] == "*"
      starting_value *= operations[i][1]
    elsif operations[i][0] == "+"
      starting_value += operations[i][1]
    elsif operations[i][0] == "-"
      starting_value -= operations[i][1]
    else
      starting_value /= operations[i][1]
    end
  end
  starting_value
end

puts "-------Calculate-------"
puts calculate(3, [["*", 5]]) == 15
puts calculate(2, [["+", 2], ["/",4 ]]) == 1
puts calculate(0, [["+", 3], ["/", 3], ['-', 10], ["*", 6]]) == -54
puts calculate(10, [["+", 1], ["+", 10], ['-', 3], ["/", 2]]) == 9

# ------------------------------------------------------------------------------

# Hashtagify

# Given a sentence string and an array of words, hashtag-ify the words (case-insensitive)
# in the original string and return the updated cool string with hashtags.

def hashtagify(sentence, tags)
  # I assume punctuation will only be at the end of the sentence.
  # To deal with punctuation in the middle of the sentence, I could do
  # the same thing for each word that I'm doing for the whole sentence.
  ends_with_punc = false
  if '!?.,;'.include?(sentence[-1]) 
    ends_with_punc = true
    punc = sentence[-1] # save the punc and then add it back in at end.
    sentence = sentence.slice(0, sentence.length-1)
  end
  words = sentence.split(' ')
  result = []
  words.each do |word|
    if tags.include?(word.downcase)
      result << "#" + word
    else
      result << word
    end
  end
  if ends_with_punc
    result.join(' ') + punc
  else
    result.join(' ')
  end
end

puts "-------Hashtagify-------"
puts hashtagify("coding", ["coding"]) == "#coding"
puts hashtagify("coding is fun", ["coding", "fun"]) == "#coding is #fun"
puts hashtagify("Coding is fun!", ["coding", "fun"]) == "#Coding is #fun!"
puts hashtagify("Learned about coding.", ["coding"]) == "Learned about #coding." 
puts hashtagify("coding,", ["coding"]) == '#coding,'
puts hashtagify("coDing", ["coding"]) == '#coDing'
# ------------------------------------------------------------------------------

# Vigenere Cipher

# Vigenere's Cipher is a tool for encrypting strings. We'll offset each character
# according to a key sequence. For example, if we encrypt "bananasinpajamas" with the
# key sequence [1, 2, 3], the result would be "ccqbpdtkqqcmbodt":
#
# Word:   b a n a n a s i n p a j a m a s
# Keys:   1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1
# Cipher: c c q b p d t k q q c m b o d t
#
# Note that offsets should wrap around the alphabet - offsetting 'z' by 1 should
# produce 'a'

# Write a method that takes a string and a key-sequence, returning
# the encrypted word. Assume only lower-case letters are used.

# We're giving you the alphabet as an array if you need it.
# ------------------------------------------------------------------------------

def vigenere_cipher(string, key_sequence)
  alphabet = ("a".."z").to_a
  alphabet.concat(alphabet) # double it to deal with wrapping
  
  chars = string.split('')
  count = 0
  
  for i in 0...chars.length
  # lookup the index of chars[i] in alphabet, then add to it using key sequence
  # and modulo to keep track of which step in the sequence you're at
    chars[i] = alphabet[alphabet.index(chars[i]) + key_sequence[count % key_sequence.length]]
    count += 1
  end
  chars.join('')
end

puts "----Vigenere cipher----"
puts vigenere_cipher("toerrishuman", [1]) == "upfssjtivnbo"
puts vigenere_cipher("toerrishuman", [1, 2]) == "uqftsktjvobp"
puts vigenere_cipher("toarrispirate", [1, 2, 3, 4]) == "uqdvskvtjtdxf"
puts vigenere_cipher("zzz", [1, 2, 1]) === "aba"
puts vigenere_cipher('', [1, 2, 3]) == ''
