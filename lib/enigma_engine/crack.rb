require_relative 'engine'
require_relative 'characters'
require_relative 'file_store'
module EnigmaEngine
  class Crack
    def handle_get_target(file, res)
      case file.last.length
      when 4 then res[:target] = file.last
                  res[:weakness] = %w(n d . .)
      when 3 then res[:weakness] = %w(. . e n)
      when 2 then res[:weakness] = %w(. e n d)
      when 1 then res[:weakness] = %w(e n d .)
      end
      res
    end

    def get_target(file)
      res = {}
      res[:target] = file[file.length - 2]
      handle_get_target(file, res)
    end

    def find_key(file)
      message = FileStore::to_2d_array(FileStore::open(file))
      char_map_with_index = EnigmaEngine::Characters.char_map_with_index
      target_char = get_target(message)
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
      when 0 then send(func, item, res[:a_rotation])
      when 1 then send(func, item, res[:b_rotation])
      when 2 then send(func, item, res[:c_rotation])
      when 3 then send(func, item, res[:d_rotation])
      end
    end
        
    def crack(file, new_file, date)
      res = find_key(file)
      key = res.values.map(&:to_s).join('')
      message = FileStore::to_2d_array(FileStore::open(file))
      cracked_chars = []
      message.each do |row|
        row.each_with_index do |item, index|
          broken = handle_crack_rotation(index, item, res,:rotate_char)
          cracked_chars.push(broken)
        end
      end
      EnigmaEngine::FileStore.create(cracked_chars.join(''), new_file, key, date)
    end
  end
end
