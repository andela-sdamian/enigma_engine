module EnigmaEngine
  module Offsets
    def get_date(index)
      @date[index].to_i
    end

    def a_offset
      get_date(0)
    end

    def b_offset
      get_date(1)
    end

    def c_offset
      get_date(2)
    end

    def d_offset
      get_date(3)
    end
  end
end
