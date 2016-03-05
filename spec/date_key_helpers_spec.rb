require 'spec_helper'
require 'enigma_engine/engine'
describe EnigmaEngine::DateKeyHelpers do
  subject do
    EnigmaEngine::Engine.new
  end

  it { is_expected.to respond_to(:today, :colorize, :red, :green, :red, :yellow, :files_valid?, :key_valid?, :date_valid?, :fields_empty?)}

  describe '#today' do
    today = Time.now.strftime('%d, %m, %y').to_s
    today = today.gsub!(/\,/, '').split(' ').join('').to_s
    it { expect(subject.today).to eql(today) }
  end

  describe '#colorize' do
    context 'given a string' do
      it { expect(subject.colorize('hello', 32)).to eql("\e[32mhello\e[0m") }
    end
  end

  describe '#date_valid?' do
    context 'given a date' do
      it { expect(subject.date_valid?('010316')).to be_truthy }
      it { expect(subject.date_valid?('01031')).to be_falsey }
    end
  end

  describe '#key_valid?' do
    context 'given a key' do
      it { expect(subject.key_valid?('41521')).to be_truthy }
      it { expect(subject.key_valid?('4152')).to be_falsey }
    end
  end

  describe '#files_valid?' do
    context 'given an array of files' do
      it { expect(subject.files_valid?(%w(a.txt b.txt c.txt))).to be_truthy }
      it { expect(subject.files_valid?(%w(a.txt b.txt c.exe))).to be_falsey }
    end
  end

  describe '#fields_empty?' do
    context 'given an array of fields' do
      it { expect(subject.fields_empty?(['', 'hello', 'world'])).to be_truthy }
      it{ expect(subject.fields_empty?(%w(puts hello world))).to be_falsey }
    end
  end
end
