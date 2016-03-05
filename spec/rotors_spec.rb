require 'spec_helper'
require 'enigma_engine/engine'
describe EnigmaEngine::Rotors do
  subject do
    obj = EnigmaEngine::Engine.new
    obj.key = '41521'
    obj
  end
  it { is_expected.to respond_to(:key,:a_rotation, :b_rotation, :c_rotation, :d_rotation)}
  context 'given a five digit key 41521' do
    it { expect(subject.a_rotation).to eq 41 }
    it { expect(subject.b_rotation).to eq 15 }
    it { expect(subject.c_rotation).to eq 52 }
    it { expect(subject.d_rotation).to eq 21 }
  end
end
