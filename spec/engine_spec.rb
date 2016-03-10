require 'spec_helper'
describe EnigmaEngine::Engine do
  
  it { is_expected.to respond_to :rotate_char }
  it { is_expected.to respond_to :handle_rotation }
  it { is_expected.to respond_to :process_file } 
  
  subject { EnigmaEngine::Engine.new(false, '81322', '090316') }
  
  describe "#rotate_char" do 
    let(:new_char) { subject.rotate_char('a', 29)}
    it { expect(new_char).to eql 'k' }
  end
  
  describe "#handle_rotation" do 
    let(:new_char) { subject.handle_rotation(1, 'a') }
    it { expect(new_char).to eql 's' }
  end
end 