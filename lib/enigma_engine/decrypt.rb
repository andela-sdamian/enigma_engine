require_relative 'engine'
module EnigmaEngine 
  class Decrypt
    def initialize(key, date, file) 
      @key = key 
      @date = date
      @file = file   
      @encryption = EnigmaEngine::Engine.new(false, @key, @date)
    end
    def do(new_file)
      @encryption.process_file(@file, new_file)
    end
  end
end
