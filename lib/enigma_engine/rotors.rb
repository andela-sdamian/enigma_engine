module EnigmaEngine
  class Rotors
    attr_reader :key 
    def initialize(key)
      @key = key
    end
    
    def get_key(m, n)
      key = @key.to_s.split('')
      key[m,n].join('').to_i
    end
    
    def a
      get_key(0, 2)
    end

    def b
      get_key(1, 2)
    end

    def c
      get_key(2, 2)
    end

    def d
      get_key(3, 2)
    end
  end
end
