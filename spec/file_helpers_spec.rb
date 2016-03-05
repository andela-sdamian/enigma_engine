require 'spec_helper'
require 'enigma_engine/engine'
describe EnigmaEngine::FileHelpers do
  subject do
    EnigmaEngine::Engine.new
  end
  dir = 'spec/file/'
  it { is_expected.to respond_to(:characters, :open_file, :create_write_file, :text_to_array, :show_msg) }

  describe '#open_file' do
    file = "#{dir}message.txt"
    err = "#{dir}error.txt"
    it { expect(subject.open_file(file)).not_to be_nil }
    it { expect(subject.open_file(err)).to raise_error("Cannot find file, Run [enigma help] to see help!") }
  end

  describe '#create_write_file' do
    txt = 'Hello World'
    file = "#{dir}hello.txt"
    it { expect(subject.create_write_file(txt, file, false, false)).to be_nil }
  end

  describe '#text_to_array' do
    file = File.open("#{dir}message.txt").read
    it { expect(subject.text_to_array(file).first.length).to eq 4 }
  end

  describe '#show_msg' do
    it { expect(subject.show_msg(false, false, false)).to be_nil }
  end
end
