module EnigmaEngine
  class FileDataStore
    def open(file_name)
      if File.exist? file_name
        data = File.read file_name
        data.gsub(/\n/, ' ')
      else
        'Cannot find file, Run [enigma help] to see help!'
      end
    end

    def create(txt, file_name, key, date, type = false)
      file = File.open(file_name, 'w')
      file.write(txt)
      file.close
      show_msg(file_name, key, date, type)
    end

    def to_array(text)
      text = text.split('').map(&:downcase)
      text.each_slice(4).to_a
    end

    def show_msg(new_file, key, date, type = false)
      msg = 'Please take note of the key & date in order to decrypt this file'
      (type) ? msg = yellow(msg) : msg = ''
      "Created: #{green(new_file)}\nKey: #{red(key)}\nDate: #{blue(date)} #{msg}"
    end
  end
end
