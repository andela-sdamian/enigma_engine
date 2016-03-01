module EnigmaEngine
  module FileHelpers
    def open_file(file_name)
      file = File.open(file_name, 'r')
      if File.exist? file
        data = file.read
        data.gsub(/\n/, ' ')
      end
    rescue
      raise <<NOTIFY
"Cannot find file, Run [enigma help] to see help!"
NOTIFY
    end

    def create_write_file(txt, file_name, key, date, type = false)
      file = File.open(file_name, 'w')
      file.write(txt)
      file.close
      show_msg(file_name, key, date, type)
    end

    def text_to_array(text)
      text = text.split('').map(&:downcase)
      text.each_slice(4).to_a
    end

    def show_msg(new_file, key, date, type = false)
      msg = 'Please take note of the key & date in order to decrypt this file'
      (type) ? msg = yellow(msg) : msg = ''
      puts <<NOTIFY
Created: #{green(new_file)}\nKey: #{red(key)}\nDate: #{blue(date)}
#{msg}
NOTIFY
    end
  end
end
