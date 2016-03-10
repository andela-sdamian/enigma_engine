require 'spec_helper'

describe EnigmaEngine::Moves do 
  subject { EnigmaEngine::Moves.new('81322', '090316') }
  
  describe "#a" do 
    it { expect(subject.a).to eql 90 }
  end

  describe "#b" do 
    it { expect(subject.b).to eql 21 }
  end
  
  describe "#c" do 
    it { expect(subject.c).to eql 37 }
  end
  
  describe "#d" do 
    it { expect(subject.d).to eql 28 }
  end
  
  describe "#rand_key" do 
    let(:key) { subject.rand_key }
    it { expect(key).to eql key }
  end
  
  describe "#today" do 
    it do
      allow(Time).to receive(:now) { Time.new(2016, 03, 03, 22, 25, 45, "+01:00") }
    end
  end
end
