require_relative 'engine'
require_relative 'characters'
require_relative 'file_store'
module EnigmaEngine
  class Crack 
    def initialize 
      @file_store = EnigmaEngine::FileStore.new 
      @characters = EnigmaEngine::Characters.new 
      @char_map_with_index = @characters.char_map_with_index
      @rotation = { 0=>0, 1=>0, 2=>0, 3=>0 }  
    end
    
    def get_target(file)
      match = {}
      match[:target] = file[file.length - 2]
      len = file.last.length 
      if len == 4 
        match[:target] = file.last 
        match[:weakness] = %w(n d . .)
      elsif len == 3
        match[:weakness] = %w(. . e n)
      elsif len == 2 
        match[:weakness] = %w(. e n d)
      elsif len == 1 
        match[:weakness] = %w(e n d .)
      end
      match 
    end
    
    def find_key(file)
      file_array = @file_store.to_2d_array(file)
      target_char = get_target(file_array)
      weakness = target_char[:weakness]
      targets = target_char[:target]
      targets.each_with_index do |item, index|
        weak_pos = @char_map_with_index[weakness[index]] 
        pos = @char_map_with_index[item] - weak_pos 
        (pos < 0) ? pos += 39 : pos
          @rotation[index] = pos 
      end
      @rotation 
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
      find_key(file)
      key = @rotation.values.map(&:to_s).join('') 
      file_array = @file_store.to_2d_array(file)
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
