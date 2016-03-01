require 'spec_helper'
require 'enigma_engine/engine'
describe EnigmaEngine do
  describe 'Rotation' do
    test_class = EnigmaEngine::Engine.new
    test_class.date = '020315'
    context 'given a date in the format DDMMYY' do
      it 'A offset should be integer' do
        expect(test_class.a_offset).to eql(9)
      end
      it 'B offset should be an integer' do
        expect(test_class.b_offset).to eql(2)
      end
      it 'C offset should be an integer ' do
        expect(test_class.c_offset).to eql(2)
      end
      it 'D offset should be an integer ' do
        expect(test_class.d_offset).to eql(5)
      end
    end
  end
end
