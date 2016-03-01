require 'enigma_engine/engine'
describe EnigmaEngine::Engine do
  prefix = 'should have method'
  obj = EnigmaEngine::Engine.new
  describe 'Engine' do
    it "#{prefix} characters" do
      expect(subject.respond_to?('characters')).to eql(true)
    end
    it "#{prefix} encrypt_char" do
      expect(subject.respond_to?('encrypt_char')).to eql(true)
    end
    it "#{prefix}method decrypt_char" do
      expect(subject.respond_to?('decrypt_char')).to eql(true)
    end
    it "#{prefix} encrypt" do
      expect(subject.respond_to?('encrypt')).to eql(true)
    end
    it "#{prefix} decrypt" do
      expect(subject.respond_to?('decrypt')).to eql(true)
    end
    it "#{prefix} a_rotation" do
      expect(subject.respond_to?('a_rotation')).to eql(true)
    end
    it "#{prefix} b_rotation" do
      expect(subject.respond_to?('b_rotation')).to eql(true)
      end
    it "#{prefix} c_rotation" do
      expect(subject.respond_to?('c_rotation')).to eql(true)
    end
    it "#{prefix} d_rotation" do
      expect(subject.respond_to?('d_rotation')).to eql(true)
    end
    it "#{prefix} a_offset" do
      expect(subject.respond_to?('a_offset')).to eql(true)
    end
    it "#{prefix} b_offset" do
      expect(subject.respond_to?('b_offset')).to eql(true)
    end
    it "#{prefix} c_offset" do
      expect(subject.respond_to?('c_offset')).to eql(true)
    end
    it "#{prefix} d_offset" do
      expect(subject.respond_to?('d_offset')).to eql(true)
    end
    it "#{prefix} open_file" do
      expect(subject.respond_to?('open_file')).to eql(true)
    end
    it "#{prefix} text_to_array" do
      expect(subject.respond_to?('text_to_array')).to eql(true)
    end
    it "#{prefix} handle_rotation" do
      expect(subject.respond_to?('handle_rotation')).to eql(true)
    end
    it "#{prefix} rand_key" do
      expect(subject.respond_to?('rand_key')).to eql(true)
    end
    it "#{prefix} date" do
      expect(subject.respond_to?('date')).to eql(true)
    end
  end

  describe '.date' do
    context 'given a date in the format DDMMYY' do
      obj2 = EnigmaEngine::Engine.new
      obj2.date = '020315'
      obj2.key = '41521'
      it 'should square the date and return the last 4 elements' do
        expect(obj2.date).to eql([9, 2, 2, 5])
      end
      it 'elements should all be integer' do
        expect(obj2.date.all? { |i| i.is_a?(Integer) }).to eql(true)
      end
    end
  end


  describe '.characters' do
    it 'should have a character map of 39' do
      expect(obj.characters.length).to eql(39)
    end
    it 'should equal the characters' do
      chars = ('a'..'z').to_a + ('0'..'9').to_a + [32.chr, 46.chr, 44.chr]
      expect(obj.characters).to eql(chars)
    end
    it 'should not have new line character letters' do
      expect(obj.characters.include?('\n')).to eql(false)
    end
    it 'should not have capital letters' do
      expect(obj.characters.all?{ |i| i == i.upcase! }).to eql(false)
    end
  end

  describe '.encrypt_char' do
    context 'given a character and a position x' do
      it 'should rotate the character x position down the character map' do
        expect(obj.encrypt_char('a', 25)).to eql('z')
        expect(obj.encrypt_char('9', 1000)).to eql('v')
        expect(obj.encrypt_char('A', 500)).to eql('6')
      end
    end
  end

  describe '.decrypt_char' do
    context 'given a character and a position x' do
      it 'should reverse the character x position up the character map' do
        expect(obj.decrypt_char('z', 25)).to eql('a')
        expect(obj.decrypt_char('v', 1000)).to eql('9')
        expect(obj.decrypt_char('6', 500)).to eql('a')
      end
    end
  end

  describe '.encrypt' do
    context 'given a plain message in a text file' do
      dir = 'spec/file/'
      obj.encrypt("#{dir}message.txt", "#{dir}encrypted.txt")
      it 'should encrypt the file and create a new file `encrypted.txt`' do
        expect(File.exist?("#{dir}encrypted.txt")).to eql(true)
      end
      it 'encrypted file should not equal original file' do
        encrypted_file = File.open("#{dir}default_encrypted.txt", 'r').read
        original = File.open("#{dir}message.txt", 'r').read
        expect(encrypted_file ).not_to eql(original)
      end
    end
  end

  describe '.decrypt' do
    context 'given an encrypted message in a text file' do
      dir = 'spec/file/'
      obj.decrypt("#{dir}default_encrypted.txt", "#{dir}default_decrypted.txt", '72602', '010316')
      it 'should decrypt the file to its original form' do
        decrypted_file = File.open("#{dir}default_decrypted.txt").read
        original = File.open("#{dir}default_message.txt").read
        expect(decrypted_file).to eql(original.downcase!)
      end
    end
  end
end
