module EnigmaEngine
  class Validate
    
    def Validate.files_valid?(arr)
      arr.all? { |i| (File.extname(i)).to_s == '.txt' }
    end

    def Validate.key_valid?(key)
      key.to_s.length.eql? 5
    end

    def Validate.date_valid?(date)
      date.to_s.length.eql? 6
    end

    def Validate.fields_empty?(arr)
      arr.include? ''
    end
  end
end

