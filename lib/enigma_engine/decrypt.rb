require_relative 'engine'
module EnigmaEngine 
  class Decrypt
    def initialize(key = nil, date = nil) 
      @encryption = EnigmaEngine::Engine.new(false, key, date)
    end
    def do(file, new_file)
      @encryption.process_file(file, new_file)
    end
  end
end
