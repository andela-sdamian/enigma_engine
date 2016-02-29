require 'enigma_engine/engine'
describe EnigmaEngine do
  describe 'VERSION' do
    it 'should equals' do
      expect(EnigmaEngine::VERSION).to eql('0.1.8')
    end
  end
end
