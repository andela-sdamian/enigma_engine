RSpec.shared_examples "an engine process" do
  it { is_expected.to respond_to :do }
  
  describe "#do" do 
     let(:io) { StringIO.new('this is a test file to test my refactored encryption algorithm..end..')}
     let(:file) { 'message.txt' }
     let(:new_file) { 'encrypted.txt' }
     let(:output) {'52ghj3qzmsr64b87u6cz598iqarzyg8gq0.459p6pscco,we53mcjvj80,git790q8b0k'}
     
     let(:engine) {spy('engine')}
     
     it do
        
       allow(File).to receive(:open).with(file, 'r').and_yield(io)
       allow(File).to receive(:open).with(new_file, 'w').and_yield(output)
       allow(subject).to receive(:do).with(file, new_file).and_return(output)
       allow(File).to receive(:write).with(new_file, 'w').and_yield(output)
       expect(subject.do(file, new_file)).to eq output                 
     end
  end
end
