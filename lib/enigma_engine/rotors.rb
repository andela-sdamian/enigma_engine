require_relative 'engine'
module EnigmaEngine
  class Rotors < Engine
    def key
      @key
    end

    def put_key(x, y)
      key.to_s.split('')[x, y].join('').to_i
    end

    def Rotors.a
      put_key(0, 2)
    end

    def Rotors.b
      put_key(1, 2)
    end

    def Rotors.c
      put_key(2, 2)
    end

    def Rotors.d
      put_key(3, 2)
    end
  end
end
