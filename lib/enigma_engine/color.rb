module EnigmaEngine
  class Colors
    def Colors.colorize(text, color_code)
      "\e[#{color_code}m#{text}\e[0m"
    end

    def Colors.red(text)
      Colors.colorize(text, 31)
    end

    def Colors.green(text)
      Colors.colorize(text, 32)
    end

    def Colors.blue(text)
      Colors.colorize(text, 34)
    end

    def Colors.yellow(text)
      Colors.colorize(text, 33)
    end
  end

end
