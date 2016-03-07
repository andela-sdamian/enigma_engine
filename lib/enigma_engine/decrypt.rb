require_relative 'engine'
module EnigmaEngine 
  class Decrypt
    def self.do(file, new_file, key, date)
      EnigmaEngine::Engine.process_file(file, new_file, :rotate_char, key, date, false)
    end
  end
end
