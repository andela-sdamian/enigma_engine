require 'spec_helper'
require 'enigma_engine/engine'
describe EnigmaEngine::Offsets do
    subject do
      obj = EnigmaEngine::Engine.new
      obj.date = '020315'
      obj
    end
    context 'given a date in the format DDMMYY' do
      it { expect(subject.a_offset).to eq 9 }
      it { expect(subject.b_offset).to eq 2 }
      it { expect(subject.c_offset).to eq 2 }
      it { expect(subject.d_offset).to eq 5 }
    end
end
