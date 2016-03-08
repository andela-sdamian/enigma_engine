require_relative 'engine'
module EnigmaEngine 
  class Encrypt 
    def initialize   
      @encryption = EnigmaEngine::Engine.new(true)
    end
    
    def do(file, new_file)
      @encryption.process_file(file, new_file)
    end
  end
end
