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
    
    def last_four_num 
      date_squared.to_s.split('')[-4, 4].map(&:to_i)
    end
    def pick (index) 
        last_four_num[index]
    end
    
    def a
      pick(0)
    end

    def b
      pick(1)
    end

    def c
      pick(2)
    end

    def d
      pick(3)
    end
  end
end
