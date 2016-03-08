require_relative 'file_store'
require_relative 'characters'
require_relative 'moves'

module EnigmaEngine
  class Engine
    
    def initialize(type = false, key = nil, date = nil)
        @type = type  
        @moves = EnigmaEngine::Moves.new(key, date)
        @characters = EnigmaEngine::Characters.new
        @file_store = EnigmaEngine::FileStore.new
        @moves_map = { 0=>@moves.a, 1=>@moves.b, 2=>@moves.c, 3=>@moves.d }  
    end
    
    def rotate_char(char, pos)
        char.downcase!
        pos *= -1 unless @type
        char_map = @characters.char_map
        char_map_hash = @characters.char_map_hash(pos)
        res = char.chars.map { |c| char_map_hash.fetch(c) }
        res.join('')
    end
    
    def handle_rotation(index, item)
      send(:rotate_char, item, @moves_map[index])
    end

    def process_file(file, new_file)
      file_array = @file_store.to_2d_array(file)
      new_chars = []
      file_array.each do |row|
        row.each_with_index do |item, index|
          rot = handle_rotation(index, item)
          new_chars.push(rot)
        end
      end
      @file_store.create(new_chars.join(''), new_file, @moves.key, @moves.date)
    end
  end
end
