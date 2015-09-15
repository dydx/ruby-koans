# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  # push them and sort them
  sides = []
  sides << a
  sides << b
  sides << c
  sides.sort!

  # check that none of them are zeros
  sides.each do |side|
    unless side > 0
      raise TriangleError
    end
  end

  # unless we're using an equilateral, the sum
  # of the two shortest sides should be longer
  # than the longest side
  unless sides[0] == sides[2]
    if sides[0] && sides[1] == 1
      raise TriangleError
    elsif (sides[0] + sides[1]) <= sides[2]
      raise TriangleError
    end
  end

  # if no errors are raised, classify that bad-boy
  if sides[0] == sides[2]
    :equilateral
  # we can have two sides of the same length in
  # two different configurations: [2, 2, 3] or [2, 3, 3]
  elsif (sides[0] < sides[1] && sides[1] == sides[2]) ||
        (sides[0] == sides[1] && sides[1] < sides[2])
    :isosceles
  elsif sides[0] < sides[1] && sides[1] < sides[2]
    :scalene
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
