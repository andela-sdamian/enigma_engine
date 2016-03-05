module EnigmaEngine
  class Offsets
    def initialize(date)
      @date = date
    end

    def get_date(index)
      @date[index].to_i
    end

    def a
      get_date(0)
    end

    def b
      get_date(1)
    end

    def c
      get_date(2)
    end

    def d
      get_date(3)
    end
  end
end
