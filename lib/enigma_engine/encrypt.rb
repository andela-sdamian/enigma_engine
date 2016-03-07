require_relative 'engine'
module EnigmaEngine 
  class Encrypt 
    def initialize(file, new_file) 
      @file = file 
      @new_file = new_file 
      @encryption = EnigmaEngine::Engine.new(true)
    end
    
    def do
      @encryption.process_file(@file, @new_file)
    end
  end
end
