require_relative 'characters'
require_relative 'file_store'
require_relative 'cracker'
module EnigmaEngine
  class Crack 
    def initialize 
      @file_store = EnigmaEngine::FileStore.new 
      @characters = EnigmaEngine::Characters.new    
    end
   
    def handle_crack_rotation(index, item)
     send(:crack_char, item, @rotation[index])
    end
   
    def crack_char(char, pos)
        char.downcase!
        pos *= -1
        char_map = @characters.char_map
        char_map_hash = @characters.char_map_hash(pos)
        res = char.chars.map { |c| char_map_hash.fetch(c) }
        res.join('')
    end
        
    def do(file, new_file, date)
      cracker = EnigmaEngine::Cracker.new
      res = cracker.find_key(file)
      @rotation = res[:rot]
      file_array = res[:file]
      key = res[:key] 
      new_chars = []
      file_array.each do |row|
        row.each_with_index do |item, index|
          rot = handle_crack_rotation(index, item)
          new_chars.push(rot)
        end
      end
      @file_store.create(new_chars.join(''), new_file, key, date)
    end
  end
end