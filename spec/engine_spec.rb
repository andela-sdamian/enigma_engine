require 'enigma_engine/engine'

describe EnigmaEngine::Engine do
  test_class = EnigmaEngine::Engine.new
  prefix = 'should have method'
  describe 'Engine' do
    it "#{prefix} characters" do
      expect(test_class.respond_to?('characters')).to eql(true)
    end
    it "#{prefix} encrypt_char" do
      expect(test_class.respond_to?('encrypt_char')).to eql(true)
    end
    it "#{prefix}method decrypt_char" do
      expect(test_class.respond_to?('decrypt_char')).to eql(true)
    end
    it "#{prefix} encrypt" do
      expect(test_class.respond_to?('encrypt')).to eql(true)
    end
    it "#{prefix} decrypt" do
      expect(test_class.respond_to?('decrypt')).to eql(true)
    end
    it "#{prefix} a_rotation" do
      expect(test_class.respond_to?('a_rotation')).to eql(true)
    end
    it "#{prefix} b_rotation" do
      expect(test_class.respond_to?('b_rotation')).to eql(true)
    end
    it "#{prefix} c_rotation" do
      expect(test_class.respond_to?('c_rotation')).to eql(true)
    end
    it "#{prefix} d_rotation" do
      expect(test_class.respond_to?('d_rotation')).to eql(true)
    end
    it "#{prefix} a_offset" do
      expect(test_class.respond_to?('a_offset')).to eql(true)
    end
    it "#{prefix} b_offset" do
      expect(test_class.respond_to?('b_offset')).to eql(true)
    end
    it "#{prefix} c_offset" do
      expect(test_class.respond_to?('c_offset')).to eql(true)
    end
    it "#{prefix} d_offset" do
      expect(test_class.respond_to?('d_offset')).to eql(true)
    end
    it "#{prefix} open_file" do
      expect(test_class.respond_to?('open_file')).to eql(true)
    end
    it "#{prefix} text_to_array" do
      expect(test_class.respond_to?('text_to_array')).to eql(true)
    end
  end

  describe '.date' do
    context 'given a date in the format DDMMYY' do
      test_class.date = '020315'
      it 'should square the date and return the last 4 elements' do
        expect(test_class.date).to eql([9, 2, 2, 5])
      end
      it 'elements should all be integer' do
        expect(test_class.date.all? { |i| i.is_a?(Integer) }).to eql(true)
      end
    end
  end
  describe '.characters' do
    it 'should have a character map of 36' do
      expect(test_class.characters.length).to eql(39)
    end
  end

  describe '.encrypt_char' do
    context 'given a character and a position x' do
      it 'should rotate the character x position down the character map' do
        expect(test_class.encrypt_char('a', 25)).to eql('z')
        expect(test_class.encrypt_char('9', 1000)).to eql('v')
        expect(test_class.encrypt_char('A', 500)).to eql('6')
      end
    end
  end

  describe '.decrypt_char' do
    context 'given a character and a position x' do
      it 'should reverse the character x position up the character map' do
        expect(test_class.decrypt_char('z', 25)).to eql('a')
        expect(test_class.decrypt_char('v', 1000)).to eql('9')
        expect(test_class.decrypt_char('6', 500)).to eql('a')
      end
    end
  end

  # describe '.encrypt' do
  #   context 'given a plain message in a text file' do
  #     test_class.encrypt('message.txt', 'encrypted.txt')
  #     it 'should encrypt the file' do
  #       expect(File.exist?('encrypted.txt')).to eql(true)
  #     end
  #   end
  # end
end
