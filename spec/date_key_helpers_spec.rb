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

  describe '.colorize' do
    context 'given a string' do
      it 'should change the color of a text' do
        expect(obj.colorize('hello', 32)).to eql("\e[32mhello\e[0m")
      end
    end
  end

  describe '.date_valid?' do
    context 'given a date' do
      it 'should return true for date in the format DDMMYY' do
        expect(obj.date_valid?('010316')).to eql(true)
      end
      it 'should return false for an invalid date'do
        expect(obj.date_valid?('01031')).to eql(false)
      end
    end
  end

  describe '.key_valid?' do
    context 'given a key' do
      it 'should return true for a valid key e.g. 41521' do
        expect(obj.key_valid?('41521')).to eql(true)
      end
      it 'should return false for an invalid key e.g. 4152' do
        expect(obj.key_valid?('4152')).to eql(false)
      end
    end
  end

  describe '.files_valid?' do
    context 'given an array of files' do
      it 'should return true for valid files' do
        expect(obj.files_valid?(%w(a.txt b.txt c.txt))).to eql(true)
      end
      it 'should return false for invalid file' do
        expect(obj.files_valid?(%w(a.txt b.txt c.exe))).to eql(false)
      end
    end
  end

  describe '.fields_empty?' do
    context 'given an array of fields' do
      it 'should return true if array contains empty elements' do
        expect(obj.fields_empty?(['', 'hello', 'world'])).to eql(true)
      end
      it 'should return false if an array does not contain empty elements' do
        expect(obj.fields_empty?(%w(puts hello world))).to eql(false)
      end
    end
  end
end
