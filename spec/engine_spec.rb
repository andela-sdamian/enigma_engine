require 'spec_helper'
require 'enigma_engine/engine'
describe EnigmaEngine::Engine do
  it { is_expected.to respond_to(:date, :characters, :encrypt_char, :decrypt_char, :handle_rotation, :rand_key, :encrypt, :decrypt)}
  dir = 'spec/file/'
  subject do
    obj = EnigmaEngine::Engine.new
    obj.date = '020315'
    obj.key = '41521'
    obj
  end

  describe '#date' do
    context 'given a date in the format DDMMYY ' do
      it 'should square the date and return the last 4 integers as an array' do
        expect(subject.date).to eq [9, 2, 2, 5]
      end
      it 'elements should all be integer' do
        expect(subject.date).to all(be_an(Integer))
      end
    end
  end

  describe '#characters' do
    it { expect(subject.characters.length).to eq 39 }
    it 'should equal the characters' do
      chars = ('a'..'z').to_a + ('0'..'9').to_a + [32.chr, 46.chr, 44.chr]
      expect(subject.characters).to eql chars
    end
    it { expect(subject.characters).not_to include('\n') }
  end

  describe '#encrypt_char' do
    context 'given a character and a position x' do
      it { expect(subject.encrypt_char('a', 25)).to eq 'z' }
      it { expect(subject.encrypt_char('9', 1000)).to eq 'v' }
      it { expect(subject.encrypt_char('a', 500)).to eq '6' }
      it { expect(subject.encrypt_char('.', 22)).to eq 'u' }
    end
  end

  describe '#decrypt_char' do
    context 'given a character and a position x' do
      it { expect(subject.decrypt_char('z', 25)).to eq 'a' }
      it { expect(subject.decrypt_char('v', 1000)).to eq '9' }
      it { expect(subject.decrypt_char('6', 500)).to eq 'a' }
      it { expect(subject.decrypt_char('u', 22)).to eq '.' }
    end
  end

  describe '#encrypt' do
    context 'given a plain message in a text file' do
      it do
        subject.encrypt("#{dir}message.txt", "#{dir}encrypted.txt")
        expect(File.exist?("#{dir}encrypted.txt")).to be_truthy
      end
      it do
        encrypted_file = File.open("#{dir}default_encrypted.txt", 'r').read
        original = File.open("#{dir}message.txt", 'r').read
        expect(encrypted_file ).not_to eql(original)
      end
    end
  end

  describe '#decrypt' do
    context 'given an encrypted message in a text file' do
      it  do
        subject.decrypt("#{dir}default_encrypted.txt", "#{dir}default_decrypted.txt", '72602', '010316')
      end
      it  do
        decrypted_file = File.open("#{dir}default_decrypted.txt").read
        original = File.open("#{dir}default_message.txt").read
        expect(decrypted_file).to eql(original.downcase!)
      end
    end
  end
end
