require 'spec_helper'
require 'enigma_engine/engine'
describe EnigmaEngine do
  obj = EnigmaEngine::Engine.new
  describe 'FileHelpers' do
    it 'should have method open_file' do
      expect(obj.respond_to?('open_file')).to eql(true)
    end
    it 'should have method create_write_file' do
      expect(obj.respond_to?('create_write_file')).to eql(true)
    end
    it 'should have method text_to_array' do
      expect(obj.respond_to?('text_to_array')).to eql(true)
    end
    it 'should have method show_msg' do
      expect(obj.respond_to?('show_msg')).to eql(true)
    end
  end

  describe '.open_file' do
    it 'should open a file' do
      file = 'spec/file/message.txt'
      expect(obj.open_file(file).nil?).to eql(false)
    end
  end

  describe '.create_write_file' do
    it 'should create a file' do
      txt = 'Hello World'
      file = 'spec/file/hello.txt'
      expect(obj.create_write_file(txt, file, false, false, false)).to eql(nil)
    end
  end

  describe '.text_to_array' do
    it 'split a text into an array of 4 elements' do
      file = File.open('spec/file/message.txt').read
      expect(obj.text_to_array(file)[0].length).to eql(4)
    end
  end

  describe '.show_msg' do
    it 'should show a message' do
      expect(obj.show_msg(false, false, false)).to eql(nil)
    end
  end
end
