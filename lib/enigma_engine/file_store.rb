module EnigmaEngine
  class FileStore
 
    def open(file_name)
      File.open(file_name, 'r') do |file|
        data = file.read 
        data = data.gsub(/\n/, ' ').to_s
      end   
    rescue 
        raise 'Cannot find file, Run [enigma help] to see help!'
    end

    def create(txt, file_name, key, date, type = false)
      File.open(file_name, 'w') do |file|
        file.write(txt)
      end
      notify(file_name, key, date)
    end

    def to_2d_array(file)
      file = open(file)
      text = file.split('').map(&:downcase)
      text.each_slice(4).to_a
    end

    def notify(file_name, key, date)
     "Created: #{file_name}\nKey: #{key}\nDate: #{date}"
    end
  end
end
