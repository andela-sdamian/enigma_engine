# EnigmaEngine [![Coverage Status](https://coveralls.io/repos/github/andela-sdamian/enigma_engine/badge.svg?branch=master)](https://coveralls.io/github/andela-sdamian/enigma_engine?branch=master)

This is a ruby gem that simulates the Enigma Machine.
The Enigma Machine is a cipher mechanism created by [Arthur Scherbius](https://en.wikipedia.org/wiki/Arthur_Scherbius) a German Engineer. The machine is capable of transcribing text into coded information as a means of encryption. As of its time during World War II, it was the most sophisticated means of encryption. During the war, both the Allies and the Axis countries were looking for a new way to encrypt messages - a way that would result in complete security this was when the Enigma was born. By the end of World War II [Alan Turing](https://en.wikipedia.org/wiki/Alan_Turing) with the help of is friends where able to crack the enigma which helped Britain and their allies during the war. [More on the Enigma](https://en.wikipedia.org/wiki/Enigma_machine).

<img src="http://static.bbc.co.uk/history/img/ic/640/images/resources/topics/enigma.jpg" />

## How the encryption works

The inner working of an enigma machine has three rotors, each rotors has wrapped around it the 26 letters. When a key is pressed it moves the rotor ahead one alphabet. The other rotors kick off after the first has completed a revolution and so for the third.  When this is done, text in plain english becomes gibberish. Before you start encrypting you and your recipient must agree upon a key which can be set on the machine. Find out more about the enigma machine by watching this video.

<a href="http://www.youtube.com/watch?feature=player_embedded&v=G2_Q9FoD-oQ
" target="_blank"><img src="http://img.youtube.com/vi/G2_Q9FoD-oQ/0.jpg"
alt="How the Enigma Machine works" width="600" height="350" border="10" /></a>

Though, my implementation of the Enigma Machine is slightly different from that of World War II but here is the catch

<strong>The rotors: they are denoted by five digit numbers e.g. 97239</strong>
<ul>
    <li>The first two digits of the key is the "A" rotation (97)</li>
    <li>The second and third digits are the "B" rotation (72)</li>
    <li>The third and fourth digits are the "C" rotation (23)</li>
    <li>The fourth and firth digits are the "D" rotation (39)</li>
</ul>

<strong>The offsets: the date of message transmission is also factored into the encryption</strong>
<ul>
    <li>Date is in the format DDMMYY e.g. 020315</li>
    <li>Square the numeric form you get 412699225 pick the last four digits</li>
    <li>The first digit is the "A" offset (9)</li>
    <li>The second digit is the "B" offset (2)</li>
    <li>The third digit is the "C" offset (2)</li>
    <li>The fourth digit is the "D" offset (5)</li>
</ul>

<strong>Encrypting a message</strong>

<ul>
    <li>Four characters are encrypted at a time</li>
    <li>The first character is rotated forward by the "A" rotation plus the "A offset"</li>
    <li> The second character is rotated forward by the "B" rotation plus the "B offset"</li>
    <li>The third character is rotated forward by the "C" rotation plus the "C offset"</li>
    <li>The fourth character is rotated forward by the "D" rotation plus the "D offset"</li>
</ul>

<strong>Decrypting a message</strong>

The offsets and keys can be calculated by the same methods above. Then each character is rotated backwards instead of forwards.

<strong>Cracking a message</strong>
When the key is not known, the offsets can still be calculated from the message date. We believe that each enemy message ends with the characters "..end..". Use that to determine when you’ve correctly guessed the key.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'enigma_engine'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install enigma_engine

## Usage

The tool is used from the command line like so:</p>

<strong>View Help </strong>

`enigma help` To see help file

<strong> Encrypting a message</strong>

`enigma encrypt [message.txt] [encrypted.txt]`
created encrypted.txt with key 82648 and date 090216

That will take the plaintext file message.txt and create an encrypted file encrypted.txt.

<strong> Decrypting a message</strong>
Then, if we know the key, we can decrypt like so:

`enigma decrypt [encrypted.txt] [decrypted.txt] [82648] [030415]`
created ‘decrypted.txt with key 82648 and date 030415

<strong> Cracking a message</strong>
But if we don’t know the key, we can try to crack it with just the date like so: 

`enigma crack [decrypted.txt] [cracked.txt] [030415]`
created ‘cracked.txt with key 82648 and date 030415

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/andela-sdamian/EnigmaEngine. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
