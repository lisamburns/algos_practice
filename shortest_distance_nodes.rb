# On some directed graph G with O(inf) vertices,
# find the shortest path P from some vertex A to some other vertex X.
# Say the length of this path is O(r) and each vertex has O(k) edges out.
# Find this shortest path using O(rk) space
require 'byebug'
class Node
  attr_accessor :edges, :value

  def initialize(val)
    @value = val
    @edges = []
  end

  def add_edges(*nodes)
    nodes.each {|n| self.add_edge(n) }
  end

  def add_edge(node)
    @edges << node
  end

  def ==(x)
    self.value == x.value
  end

  def self.shortest_path(a, x)
    queue = [ [ [], a] ]
    visiteds = {}

    until queue.empty?
      path, v = queue.shift
      if v == x
        return path + [v]
      else
        visiteds[v] = true
        v.edges.each do |node|
          queue.push([path + [v], node]) unless visiteds[node]
        end
      end
    end
    -1
  end

end

a = Node.new(3)
b = Node.new(4)
c = Node.new(8)
d = Node.new(10)
e = Node.new(90)
f = Node.new(100)

a.add_edges(c, d)
c.add_edges(b,d)
d.add_edges(b)
b.add_edges(e)

result =  Node.shortest_path(a, e)
result.each do |node|
  puts node.value
end
