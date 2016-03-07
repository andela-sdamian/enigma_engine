require_relative 'file_store'
require_relative 'characters'
require_relative 'moves'

module EnigmaEngine
  class Engine
    
    def initialize(type = false, key = nil, date = nil)
        @type = type  
        @key = key 
        @date = date
        @moves = EnigmaEngine::Moves.new(@key, @date)
        @characters = EnigmaEngine::Characters.new
        @file_store = EnigmaEngine::FileStore.new  
    end
    
    def rotate_char(char, pos)
        pos *= -1 unless @type
        char_map = @characters.char_map
        char_map_hash = @characters.char_map_hash(pos)
        res = char.chars.map { |c| char_map_hash.fetch(c) }
        res.join('')
    end
    
    def handle_rotation(index, item) 
      case index
        when 0 then send(:rotate_char, item, @moves.a)
        when 1 then send(:rotate_char, item, @moves.b)
        when 2 then send(:rotate_char, item, @moves.c)
        when 3 then send(:rotate_char, item, @moves.d)
      end
    end
  
    def process_file(file, new_file)
      message = @file_store.to_2d_array(@file_store.open(file))
      new_chars = []
      message.each do |row|
        row.each_with_index do |item, index|
          rot = handle_rotation(index, item)
          new_chars.push(rot)
        end
      end
      @file_store.create(new_chars.join(''), new_file, @moves.key, @moves.date)
    end
  end
end
