module EnigmaEngine
  module DateKeyHelpers
    def today
      date = Time.now.strftime('%d, %m, %y').to_s
      date.gsub!(/\,/, '').split(' ').join('').to_s
    end

    def colorize(text, color_code)
      "\e[#{color_code}m#{text}\e[0m"
    end

    def red(text)
      colorize(text, 31)
    end

    def green(text)
      colorize(text, 32)
    end

    def blue(text)
      colorize(text, 34)
    end

    def yellow(text)
      colorize(text, 33)
    end

    def call_error
      puts red('Arguments error!')
      puts yellow('Run [enigma help] for more info...')
      exit
    end

    def files_valid?(arr)
      arr.all? { |i| i[-4, 4] == '.txt' }
    end

    def key_valid?(key)
      key.to_s.length.eql? 5
    end

    def date_valid?(date)
      date.to_s.length.eql? 6
    end

    def fields_empty?(arr)
      arr.include? ''
    end
  end
end
