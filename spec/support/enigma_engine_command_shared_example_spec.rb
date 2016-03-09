RSpec.shared_examples "an enigma engine command" do |type:|
  it { is_expected.to respond_to :do }
  
  context 'Class' do
    it { expect(subject.class.to_s).to eq "EnigmaEngine::#{type.capitalize}" } 
  end 
  
  describe "#do" do 
    let(:engine) { spy(engine) }
    
    it "calls process_file engine method with two arguments" do
      subject.do(file, new_file)
      expect(engine).to have_received(:process_file).with(file, new_file)
    end 
  end 
  
end
