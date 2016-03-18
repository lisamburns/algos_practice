require 'Set'
require 'byebug'

def word_distance(start, target, words)
  dictionary = words.to_set
  distance = 0
  seen = {}
  queue = [[distance, start]]
  return distance if start == target

  until queue.empty?
    distance, current = queue.shift
    return distance + 1 if current == target
    seen[current] = true
    adjacent_words(current, dictionary).each do |word|
      queue.push([distance + 1, word]) unless seen[word]
    end
  end

-1
end

def adjacent_words(word, dictionary)
  i = 0
  adjacent_words = []

  while i < word.length
    ('a'..'z').to_a.each do |new_letter|
      new_word = word.dup
      new_word[i] = new_letter
      adjacent_words << new_word if dictionary.include?(new_word)
    end
    i += 1
  end
  adjacent_words
end

words = ["hot","dot","dog","lot","log", "cog"]
puts word_distance("hit", "cog", words)
