require 'spec_helper'
require 'enigma_engine/version'
describe EnigmaEngine do
  describe 'VERSION' do
    it 'should equals' do
      expect(EnigmaEngine::VERSION).to eql('0.1.0')
    end
  end
end
