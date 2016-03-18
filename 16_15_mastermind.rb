# Given two codes in mastermind, return number of exact hits and near hits
# ex (code is RBGY and guess is GGRR, then answer is 1 direct, one pseudohit)
# Find exact hits first, remove them from array of chars.
# Then find freqs of chars and take the min of the freqs to calc pseudohits
require 'byebug'
def result(code, guess)
  raise "Error" if code.length != guess.length
  i = 0
  hits = 0
  pseudo_hits = 0
  code = code.split("")
  guess = guess.split("")
  while i < code.length
    if code[i] == guess[i]
      hits += 1
      code[i] = nil
      guess[i] = nil
    end
    i += 1
  end

  code_freqs = Hash.new(0)
  guess_freqs = Hash.new(0)
  code.each {|char| code_freqs[char] += 1 unless char.nil?}
  guess.each {|char| guess_freqs[char] += 1 unless char.nil?}

  guess_freqs.each do |char, guess_freq|
    pseudo_hits += [guess_freq, code_freqs[char]].min
  end
  [hits, pseudo_hits]
end

puts result("RGBY", "GGRR")
