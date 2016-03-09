$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'enigma_engine'
require 'coveralls'
Coveralls.wear!

RSpec::Expectations.configuration.warn_about_potential_false_positives = false