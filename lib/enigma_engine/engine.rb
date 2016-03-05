require_relative 'rotors'
require_relative 'offsets'
require_relative 'file_helpers'
require_relative 'date_key_helpers'

module EnigmaEngine
  class Engine
    include Rotors
    include Offsets
    include FileHelpers
    include DateKeyHelpers

    attr_writer :date, :key
    attr_reader :date

    def date=(date)
      date.sub!(/^0/, '')
      date_squared = date.to_i**2
      last_four = date_squared.to_s.split('')[-4, 4]
      @date = last_four.map(&:to_i)
    end

    def characters
      ('a'..'z').to_a + ('0'..'9').to_a + [32.chr, 46.chr, 44.chr]
    end

    def encrypt_char(char, pos)
      char.downcase!
      char_map_hash = Hash[characters.zip(characters.rotate(pos))]
      res = char.chars.map { |c| char_map_hash.fetch(c) }
      res.join('')
    end

    def decrypt_char(char, pos)
      char.downcase!
      pos *= -1
      char_map_hash = Hash[characters.zip(characters.rotate(pos))]
      res = char.chars.map { |c| char_map_hash.fetch(c) }
      res.join('')
    end

    def handle_rotation(index, item, func)
      case index
        when 0 then func.call(item, a_rotation + a_offset)
        when 1 then func.call(item, b_rotation + b_offset)
        when 2 then func.call(item, c_rotation + c_offset)
        when 3 then func.call(item, d_rotation + d_offset)
      end
    end

    def rand_key
      rand(999_99).to_s.center(5, rand(9).to_s)
    end

    def encrypt(file, new_file)
      process_file(file, new_file, :encrypt_char, true)
    end

    def decrypt(file, new_file, key, date)
      process_file(file, new_file, :decrypt_char, key, date)
    end

    def process_file(file, new_file, method, key = nil, date = nil, type = false)
      @key = key.nil? ? rand_key : key
      @date = date.nil? ? today : date
      message = text_to_array(open_file(file))
      return_chars = []
      message.each do |row|
        row.each_with_index do |item, index|
          rot = handle_rotation(index, item, method(method))
          return_chars.push(rot)
        end
      end
      create_write_file(return_chars.join(''), new_file, key, date)
    end
  end
end
