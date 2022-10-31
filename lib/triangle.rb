class Triangle
  def initialize(a, b,c)
    @sides = [a,b,c]  
  end

  def pass_triangle_equality?(sides)
    a, b, c = sides
    sides.all? {|n| n > 0} && (a + b > c && a + c > b && b + c > a)
  end

  def kind
    if pass_triangle_equality?(@sides)
      if @sides.all? {|n| n == @sides[1]}
        :equilateral
      elsif @sides.uniq.size == 2 
        :isosceles
      else
        :scalene
      end
    else       
      begin
       raise TriangleError   
      end
    end
  end

  class TriangleError < StandardError
    def message
      "Invalid triangle!"
    end    
  end
end
