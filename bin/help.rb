require_relative'console_helpers'

def show_wait_cursor(seconds, fps = 10)
  chars = %w(| / - \\)
  delay = 1.0 / fps
  (seconds * fps).round.times do |i|
    print chars[i % chars.length]
    sleep delay
    print "\b"
  end
end

show_wait_cursor(3)
@msg_help = <<HELP
                                                                 .         .
8 8888888888   b.             8  8 8888     ,o888888o.          ,8.       ,8.                   .8.
8 8888         888o.          8  8 8888    8888     `88.       ,888.     ,888.                 .888.
8 8888         Y88888o.       8  8 8888 ,8 8888       `8.     .`8888.   .`8888.               :88888.
8 8888         .`Y888888o.    8  8 8888 88 8888              ,8.`8888. ,8.`8888.             . `88888.
8 888888888888 8o. `Y888888o. 8  8 8888 88 8888             ,8'8.`8888,8^8.`8888.           .8. `88888.
8 8888         8`Y8o. `Y88888o8  8 8888 88 8888            ,8' `8.`8888' `8.`8888.         .8`8. `88888.
8 8888         8   `Y8o. `Y8888  8 8888 88 8888   8888888 ,8'   `8.`88'   `8.`8888.       .8' `8. `88888.
8 8888         8      `Y8o. `Y8  8 8888 `8 8888       .8',8'     `8.`'     `8.`8888.     .8'   `8. `88888.
8 8888         8         `Y8o.`  8 8888    8888     ,88',8'       `8        `8.`8888.   .888888888. `88888.
8 888888888888 8            `Yo  8 8888     `8888888P' ,8'         `         `8.`8888. .8'       `8. `88888.


Intro
====================================
Hello there, welcome to the EnigmaEngine! This program simulates the Enigma Machine used in World War II by the Germans.
Find out more on "#{yellow('https://github.com/andela-sdamian/enigma_engine')}"

Usage
====================================
1. Encrypting a file
   `enigma encrypt [file_name.txt] [new_file.txt]`

2. Decrypting a file
   `enigma decrypt [encrypted_file.txt] [new_file.txt] [five_digit_key] [date]`

3. Cracking a file
  `enigma crack [file_name.txt] [new_file.txt] [date]`

All date should be in the format DDMMYY e.g. 020416

AUTHOR
=====================================
Copyright (c) 2016 Damian Simon Peter
----------------------------------------------------------------------
|Twitter =>  "#{blue('http://twitter.com/damiansimonpete')}"
|StackOverflow => "#{yellow('http://goo.gl/3WIAP4')}"
|GitHub => "#{blue('http://github.com/andela-sdamian')}"
|Powered by Andela "#{green('http://twitter.com/andela')}"
----------------------------------------------------------------------

HELP
