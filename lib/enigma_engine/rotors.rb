module EnigmaEngine
  class Rotors
    def initialize(key)
      @key = key
    end

    def put_key(x, y)
      @key.to_s.split('')[x, y].join('').to_i
    end

    def a
      put_key(0, 2)
    end

    def b
      put_key(1, 2)
    end

    def c
      put_key(2, 2)
    end

    def d
      put_key(3, 2)
    end
  end
end
