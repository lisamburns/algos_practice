# given birth and death years of people, compute year with greatest number of people
require 'byebug'
def highest_population_year(people)
  # debugger
  num_births_deaths = Array.new(101, 0) # i = 0 maps to 1900
  people.each do |p|
    # debugger
    num_births_deaths[p.birth - 1900] += 1
    num_births_deaths[p.death - 1900 + 1] -= 1
  end

  max_pop = 0
  this_pop = 0
  max_yr = -1

  num_births_deaths.each_with_index do |change, yr|
    this_pop += change
    if this_pop > max_pop
      max_pop = this_pop
      max_yr = yr
    end
  end
  max_yr + 1900
end

class Person
  attr_accessor :birth, :death

  def initialize(birth, death)
    @birth = birth
    @death = death
  end

end

people = []
a = Person.new(1909, 1910)
10.times do |i|
  birth = 1900 + rand(50)
  death = birth + rand(50)
  people << Person.new(birth, death)
end

# p people.inspect
puts highest_population_year(people)
