require_relative 'engine'
module EnigmaEngine
  class Offsets < Engine
    def Offsets.get_date(index)
      @date[index].to_i
    end

    def Offsets.a
      get_date(0)
    end

    def Offsets.b
      get_date(1)
    end

    def Offsets.c
      get_date(2)
    end

    def Offsets.d
      get_date(3)
    end
  end
end
