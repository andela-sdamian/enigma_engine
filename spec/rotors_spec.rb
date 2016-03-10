require 'spec_helper'

describe EnigmaEngine::Rotors do 
  subject { EnigmaEngine::Rotors.new('41521') }
    
   describe "#get_key" do 
     let(:get_key) { subject.get_key(0, 2)}
     it { expect(get_key).to eql 41 }   
   end
   
   describe "#a" do 
     let(:a) { subject.a }
     it { expect(a).to eql 41 }
   end
   
   describe "#b" do 
     let(:b) { subject.b }
     it { expect(b).to eql 15 }
   end
   
   describe "#c" do 
     let(:c) { subject.c }
     it { expect(c).to eql 52 }
   end
   
   describe "#d" do 
     let(:d) { subject.d }
     it { expect(d).to eql 21 }
   end
end
