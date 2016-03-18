# Run once: search for words that are off by 1. Add edges
# check each edge (bfs)
# bidirectional find edges of destination word. Look for union of edges of first word graph and second
require 'byebug'
class Node
  attr_accessor :value, :edges

  def initialize(value)
    @value = value
    @edges = []
  end

  def add_edges(*edges)
    edges.each do |e|
      self.edges << e
      e.edges << self
    end
  end

  def to_s
    @value
  end

  def ==(other)
    self.value == other.value
  end

end

def read_words_from_file(filename)
  File.readlines(filename).map(:chomp)
end

def one_off?(w1, w2)
  num_diffs = 0
  return false if w1.length != w2.length

  i = 0
  while i < w1.length
    num_diffs += 1 if w1[i] != w2[i]
    return false if num_diffs > 1
    i += 1
  end
true
end

def construct_word_graph(words)
  nodes = []
  words.each do |word|
    nodes << Node.new(word)
  end

  i = 0
  while i < nodes.length
    j = i + 1
    while j < nodes.length
      if one_off?(nodes[i].value, nodes[j].value)
        nodes[i].add_edges(nodes[j])
      end
      j += 1
    end
    i += 1
  end
nodes
end

def word_distance(w1, w2)
  # words = read_words_from_file('dictionary.txt')
  words = ["hot","dot","dog","lot","log"]
  nodes = construct_word_graph([w1, w2] + words)
  # debugger
  start = nodes[0]
  final = nodes[1]

  distance = 0
  seen = {}
  queue = [[0, start]]
  until queue.empty?
    distance, this_node = queue.shift
    return distance + 1 if this_node == final
    seen[this_node] = true
    this_node.edges.each {|e| queue.push([1 + distance, e]) unless seen[e] }
  end
  -1
end

puts word_distance("hit", "cog")
