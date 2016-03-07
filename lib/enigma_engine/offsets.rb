module EnigmaEngine
  class Offsets
    attr_reader :date 
    def initialize(date)
      @date = date   
    end
     
    def date_squared
      date = @date.dup   
      date.sub!(/^0/, '')
      date.to_i**2    
    end
    
    def last_four(index) 
      @last_four ||= date_squared.to_s.split('')[-4, 4].map(&:to_i)
      @last_four[index]
    end
    
    def a
      last_four(0)
    end

    def b
      last_four(1)
    end

    def c
      last_four(2)
    end

    def d
      last_four(3)
    end
  end
end
