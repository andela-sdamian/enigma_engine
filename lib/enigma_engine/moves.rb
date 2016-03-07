require_relative 'rotors'
require_relative 'offsets'
module EnigmaEngine
  class Moves
    attr_reader :key, :date
    
    def initialize(key, date) 
      key = rand_key if key.nil?
      date = today if date.nil?
      @rotation = EnigmaEngine::Rotors.new(key)
      @offset = EnigmaEngine::Offsets.new(date)
      @key, @date = key, date   
    end
   
    def a 
      @rotation.a + @offset.a 
    end
    
    def b 
      @rotation.b + @offset.b 
    end
    
    def c 
      @rotation.c + @offset.c 
    end
    
    def d 
      @rotation.d + @offset.d 
    end
    
    def rand_key
      rand(999_99).to_s.center(5, rand(9).to_s)
    end
    
    def today
     date = Time.now.strftime('%d, %m, %y').to_s
     date.gsub!(/\,/, '').split(' ').join('').to_s
    end
  end
end