require 'spec_helper'

describe EnigmaEngine::Offsets do 
  subject { EnigmaEngine::Offsets.new('020315') }
  
  describe "#date_squared" do 
    let(:date_squared) { subject.date_squared }
    it { expect(date_squared).to eql 412699225 }
  end
  
  describe "#last_four_num" do 
    let(:last_four_num) { subject.last_four_num }
    it { expect(last_four_num).to eql [9, 2, 2, 5] }
  end
  
  describe "#pick" do 
    let(:pick) { subject.pick(0) }
    it { expect(pick).to eql 9 }
  end 
  
  describe "#a" do 
    let(:a) { subject.a }
    it { expect(a).to eql 9 }
  end
  
  describe "#b" do 
    let(:b) { subject.b }
    it { expect(b).to eql 2 }
  end
  
  describe "#c" do 
    let(:c) { subject.c }
    it { expect(c).to eql 2 }
  end
  
  describe "#d" do 
    let(:d) { subject.d }
    it { expect(d).to eql 5}
  end
end
