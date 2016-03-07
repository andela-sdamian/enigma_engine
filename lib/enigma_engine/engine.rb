require_relative 'file_store'
require_relative 'characters'
require_relative 'moves'

module EnigmaEngine
  class Engine
    def self.rotate_char(char, pos, type = false)
        pos *= -1 unless type
        char_map = EnigmaEngine::Characters.char_map
        char_map_hash = EnigmaEngine::Characters.char_map_hash(pos)
        res = char.chars.map { |c| char_map_hash.fetch(c) }
        res.join('')
    end
    
    def self.handle_rotation(index, item, func, type)
      case index
        when 0 then send(func, item, @moves.a, type)
        when 1 then send(func, item, @moves.b, type)
        when 2 then send(func, item, @moves.c, type)
        when 3 then send(func, item, @moves.d, type)
      end
    end
  
    def self.process_file(file, new_file, method, key = nil, date = nil, type = true)
      @moves = EnigmaEngine::Moves.new(key, date)
      message = FileStore::to_2d_array(FileStore::open(file))
      return_chars = []
      message.each do |row|
        row.each_with_index do |item, index|
          rot = self.handle_rotation(index, item, method, type)
          return_chars.push(rot)
        end
      end
      EnigmaEngine::FileStore.create(return_chars.join(''), new_file, @moves.key, @moves.date)
    end
  end
end
