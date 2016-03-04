require 'spec_helper'
require 'enigma_engine/version'
describe EnigmaEngine::VERSION do
  subject { expect(EnigmaEngine::VERSION).to eq '0.1.0' }
end
