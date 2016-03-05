require_relative 'rotors'
require_relative 'offsets'
require_relative 'date_key_helpers'

module EnigmaEngine
  class Engine
    include Rotors
    include Offsets
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
      @key = rand_key
      @date = today
      message = text_to_array(open_file(file))
      encrypted_chars = []
      message.each do |row|
        row.each_with_index do |item, index|
          rotated = handle_rotation(index, item, method(:encrypt_char))
          encrypted_chars.push(rotated)
        end
      end
      create_write_file(encrypted_chars.join(''), new_file, @key, date, true)
    end

    def decrypt(file, new_file, key, date)
      @key = key
      @date = date
      message = text_to_array(open_file(file))
      decrypted_chars = []
      message.each do |row|
        row.each_with_index do |item, index|
          reversed = handle_rotation(index, item, method(:decrypt_char))
          decrypted_chars.push(reversed)
        end
      end
      create_write_file(decrypted_chars.join(''), new_file, key, date)
    end
  end
end
