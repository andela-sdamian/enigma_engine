module EnigmaEngine
  module Rotors
    def key
      @key
    end

    def put_key(x, y)
      key.to_s.split('')[x, y].join('').to_i
    end

    def a_rotation
      put_key(0, 2)
    end

    def b_rotation
      put_key(1, 2)
    end

    def c_rotation
      put_key(2, 2)
    end

    def d_rotation
      put_key(3, 2)
    end
  end
end
