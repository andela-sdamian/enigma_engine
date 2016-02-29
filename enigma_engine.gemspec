# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'enigma_engine/version'

Gem::Specification.new do |spec|
  spec.name          = 'enigma_engine'
  spec.version       = EnigmaEngine::VERSION
  spec.authors       = ['Damian Simon Peter']
  spec.email         = ['simon.peter@andela.com']

  spec.summary       = 'A gem that simulates the Enigma Machine'
  spec.description   = 'The inner working of an enigma machine has three rotors. Each rotors has wrapped around it the 26 letters. When a key is pressed it moves the rotor ahead one alphabet. The other rotors kick off after the first has completed a revolution and so for the third.When this is done, text in plain english becomes gibberish. Before you start encrypting you and your recipient must agree upon a key which can be set on the machine. Find out more on my GitHub page'
  spec.homepage      = 'https://github.com/andela-sdamian/enigma_engine'
  spec.license       = 'MIT'

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
end
