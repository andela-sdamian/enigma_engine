require 'spec_helper' 

describe EnigmaEngine::FileStore do 
   
   describe "#open" do 
     let(:io) { StringIO.new('abcdefghijklmnopqrstuvwxyz..end..')}
     let(:file) { 'message.txt' }
     
     it do 
       allow(File).to receive(:open).with(file, 'r').and_yield(io)
       subject.open(file)
     end
   end
   
   describe "#create" do 
     let(:io) { StringIO.new }
     let(:content) {'abcdefghijklmnopqrstuvwxyz..end..'}
     let(:file_name) { 'message.txt' }
     
     it do 
       allow(File).to receive(:open).with(file_name, 'w').and_yield(io)
       subject.create(content, file_name, nil, nil)
       expect(io.string).to eq content
     end
   end
   
   describe "#to_2d_array" do 
     let(:io) { StringIO.new('abcdefghijklmnopqrstuvwxyz..end..')}
     let(:file) { 'message.txt' }
     let(:output) { [["a", "b", "c", "d"], 
                    ["e", "f", "g", "h"], 
                    ["i", "j", "k", "l"], 
                    ["m", "n", "o", "p"], 
                    ["q", "r", "s", "t"],
                    ["u", "v", "w", "x"], 
                    ["y", "z", ".", "."], 
                    ["e", "n", "d", "."], 
                    ["."]] }
     
     it do 
       allow(File).to receive(:open).with(file, 'r').and_yield(io)
       expect(subject.to_2d_array(file)).to eq output      
     end
   end
   
   describe "#notify" do 
     let(:task) { subject.notify('encrypted.txt', '81322', '090316') }
     let(:notify){ "Created: encrypted.txt\nKey: 81322\nDate: 090316" }
     it { expect(notify).to eql task }
   end
end
