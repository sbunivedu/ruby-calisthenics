module FunWithStrings
  def palindrome?
    sentence = self.remove_non_alpha.delete(' ')
    return sentence.downcase == sentence.downcase.reverse
  end

  def count_words
    words = self.downcase.remove_non_alpha.split(" ")
    words_hash = Hash.new(0)
    words.each do |word|
      words_hash[word] += 1
    end
    return words_hash
  end

  def anagram_groups
    anagram_groups = Hash.new {|h,k| h[k] = [] }
    words = self.downcase.remove_non_alpha.split(" ")
    words.each do |word|
      anagram_groups[word.sort].push(word)
    end
    anagrams = []
    anagram_groups.each do |key, value|
      anagrams.push(value.sort)
    end
    return anagrams
  end

  # Helper Methods
  def remove_non_alpha
   self.gsub(/[^a-z0-9\s]/i, '')
  end

  def sort
    self.chars.sort.join
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
