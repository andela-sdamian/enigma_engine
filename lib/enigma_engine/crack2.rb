require_relative 'file_store'

module EnigmaEngine
  class FakeCrack
    
    def initialize 
      @file_store = EnigmaEngine::FileStore.new  
    end
     
    def handle_get_target(encrypted_file, res)
      case encrypted_file.last.length
      when 4 then res[:target] = encrypted_file.last
                  res[:weakness] = %w(n d . .)
      when 3 then res[:weakness] = %w(. . e n)
      when 2 then res[:weakness] = %w(. e n d)
      when 1 then res[:weakness] = %w(e n d .)
      end
      res
    end
    def characters
      ('a'..'z').to_a + ('0'..'9').to_a + [32.chr, 46.chr, 44.chr]
    end
  
 
    def get_target(encrypted_file)
      res = {}
      res[:target] = encrypted_file[encrypted_file.length - 2]
      handle_get_target(encrypted_file, res)
    end

    def find_key(encrypted_file)
      encrypted_file = @file_store.to_2d_array(encrypted_file)
      char_map_with_index = Hash[characters.zip(0...characters.size)]
      target_char = get_target(encrypted_file)
      rotation = {}
      target_char[:target].each_with_index do |item, index|
        weakness_pos = char_map_with_index[target_char[:weakness][index]]
        pos = char_map_with_index[item] - weakness_pos
        (pos < 0) ? pos += 39 : pos
        case index
        when 0 then rotation[:a_rotation] = pos
        when 1 then rotation[:b_rotation] = pos
        when 2 then rotation[:c_rotation] = pos
        when 3 then rotation[:d_rotation] = pos
        end
      end
      rotation
    end

    def handle_crack_rotation(index, item, res, func)
      case index
      when 0 then func.call(item, res[:a_rotation])
      when 1 then func.call(item, res[:b_rotation])
      when 2 then func.call(item, res[:c_rotation])
      when 3 then func.call(item, res[:d_rotation])
      end
    end
    
    def decrypt_char(char, pos)
      char.downcase!
      pos *= -1
      char_map_hash = Hash[characters.zip(characters.rotate(pos))]
      res = char.chars.map { |c| char_map_hash.fetch(c) }
      res.join('')
    end

    def crack(encrypted_file, new_file, date)
      res = find_key(encrypted_file)
      key = res.values.map(&:to_s).join('')
      encrypted_file = @file_store.to_2d_array(encrypted_file)
      cracked_chars = []
      encrypted_file.each do |row|
        row.each_with_index do |item, index|
          brk = handle_crack_rotation(index, item, res, method(:decrypt_char))
          cracked_chars.push(brk)
        end
      end
      puts cracked_chars.join('')
      
    end
  end
end