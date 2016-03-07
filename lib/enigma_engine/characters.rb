module EnigmaEngine
  class Characters
    def self.char_map
      ('a'..'z').to_a + ('0'..'9').to_a + [32.chr, 46.chr, 44.chr]
    end
   
    def self.char_map_hash(pos = 0) 
      Hash[char_map.zip(char_map.rotate(pos))]
    end
    
    def self.char_map_with_index
      Hash[char_map.zip(0...char_map.size)]      
    end
  end
end


