require 'spec_helper'
require 'enigma_engine/engine'
describe EnigmaEngine do
  obj = EnigmaEngine::Engine.new
  describe 'Rotation' do
    it 'should have method today' do
      expect(obj.respond_to?('today')).to eql(true)
    end
    it 'should have method colorize' do
      expect(obj.respond_to?('colorize')).to eql(true)
    end
    it 'should have method red' do
      expect(obj.respond_to?('red')).to eql(true)
    end
    it 'should have method green' do
      expect(obj.respond_to?('green')).to eql(true)
    end
    it 'should have method blue' do
      expect(obj.respond_to?('red')).to eql(true)
    end
    it 'should have method yellow' do
      expect(obj.respond_to?('yellow')).to eql(true)
    end
    it 'should have method call_error' do
      expect(obj.respond_to?('call_error')).to eql(true)
    end
    it 'should have method files_valid?' do
      expect(obj.respond_to?('files_valid?')).to eql(true)
    end
    it 'should have method key_valid?' do
      expect(obj.respond_to?('key_valid?')).to eql(true)
    end
    it 'should have method date_valid?' do
      expect(obj.respond_to?('date_valid?')).to eql(true)
    end
    it 'should have method fields_empty?' do
      expect(obj.respond_to?('fields_empty?')).to eql(true)
    end
  end
  describe '.today' do
    today = Time.now.strftime('%d, %m, %y').to_s
    today = today.gsub!(/\,/, '').split(' ').join('').to_s
    it 'should return today\'s date' do
      expect(obj.today).to eql(today)
    end
  end

end
