require_relative 'characters'
require_relative 'file_store'

module EnigmaEngine
  class Cracker 
   
    def initialize 
      @file_store = EnigmaEngine::FileStore.new 
      @characters = EnigmaEngine::Characters.new 
      @char_map_with_index = @characters.char_map_with_index  
      @rotation = { 0=>0, 1=>0, 2=>0, 3=>0 }  
    end
    
      def get_target(file_array)
      match = {}
      match[:target] = file_array[file_array.length - 2]
      len = file_array.last.length 
      if len == 4 
        match[:target] = file_array.last 
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
      {rot: @rotation, file:file_array, key:@rotation.values.map(&:to_s).join('')} 
    end
  end
end