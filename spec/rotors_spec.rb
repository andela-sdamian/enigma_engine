require 'enigma_engine/engine'
describe EnigmaEngine do
  describe 'Rotation' do
    test_class = EnigmaEngine::Engine.new
    test_class.key = '41521'
    context 'given a five digit key 41521' do
      it 'A rotation should be an integer' do
        expect(test_class.a_rotation).to eql(41)
      end
      it 'B rotation should be an integer' do
        expect(test_class.b_rotation).to eql(15)
      end
      it 'C rotation should be an integer' do
        expect(test_class.c_rotation).to eql(52)
      end
      it 'D rotation should be an integer' do
        expect(test_class.d_rotation).to eql(21)
      end
    end
  end
end
