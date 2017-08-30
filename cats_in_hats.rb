# Cats in hats

# You have 100 cats.
# Your rules are simple: whenever you visit a cat, you toggle it's hat status (if it already has a hat, you remove it.. if it does not have a hat, you put one on). All of the cats start hat-less. You cycle through 100 rounds of visiting cats. In the 1st round, you visit every cat. In the second round, you visit every other cat. In the nth round, you visit every nth cat.. until the 100th round, in which you only visit the 100th cat.
# At the end of 100 rounds, which cats have hats?

# I looked at a simpler case first: 5 cats, 5 iterations
# before we begin visiting, all hatless:      [0, 0, 0, 0, 0]
# 1st iteration (visit i = 0, 1, 2, 3, 4):    [1, 1, 1, 1, 1]
# 2nd iteration (visit i = 1, 3):             [1, 0, 1, 0, 1]
# 3rd iteration (visit i = 2):                [1, 0, 0, 0, 1]
# 4th iteration (visit i = 3):                [1, 0, 0, 1, 1]
# 5th iteration (visit i = 4):                [1, 0, 0, 1, 0]

# so the pattern seems to be that once the ith iteration has passed, you never visit
# the cat at index i-1 again. so I need to find how many times each index is 
# visited and if that count is odd it will have a hat at the end.

# in the 5 cat case, how many times was each index visited:
# i = 0: 1 -> has hat
# i = 1: 2 -> hatless
# i = 2: 2 -> hatless
# i = 3: 3 -> has hat
# i = 4: 2 -> hatless

# also looking at the result they are all the perfect squares - why?
# the only indices visited each iteration are the ones divisible by i (index % i == 0).
# therefore I just need to count the number of factors each index has to
# find out how many times the switch occurs. indices with an odd number of factors
# will have hats, and an even number of factors will be hatless.

def cats_in_hats
  (1..101).select {|n| num_factors(n) % 2 != 0}
end

# helper method to get number of factors
def num_factors(n)
  (1..n).count {|i| n % i == 0}
end

puts "------Cats in Hats------"
puts cats_in_hats == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
