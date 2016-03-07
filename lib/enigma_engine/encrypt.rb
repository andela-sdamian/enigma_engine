require_relative 'engine'
module EnigmaEngine 
  class Encrypt 
    def self.do(file, new_file)
      EnigmaEngine::Engine.process_file(file, new_file, :rotate_char, nil, nil, true)
    end
  end
end
