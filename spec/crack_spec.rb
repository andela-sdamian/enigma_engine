require 'spec_helper'
require 'enigma_engine/crack'
describe EnigmaEngine::Crack do
  it { is_expected.to respond_to(:handle_get_target, :get_target, :find_key, :handle_crack_rotation, :crack) }
  it { expect(subject.class.superclass).to eql(EnigmaEngine::Engine) }
  dir = 'spec/file/'
  subject do
    EnigmaEngine::Crack.new
  end

  describe '#get_target' do
    prefix = 'when given a multidimensional array of 4 elements each & 1 last array'

    context "#{prefix} of 4 elements" do
      it 'should have weakness' do
        res = subject.get_target([%w(x 8 w t), %w(t j 4 2)])[:weakness]
        expect(res).to eql %w(n d . .)
      end
    end
    context "#{prefix} of 3 elements" do
      it 'should have weakness' do
        res = subject.get_target([%w(x 8 w t), %w(t j 4)])[:weakness]
        expect(res).to eql %w(. . e n)
      end
    end
    context "#{prefix} of 2 elements" do
      it 'should have weakness' do
        res = subject.get_target([%w(x 8 w t), %w(t j)])[:weakness]
        expect(res).to eql %w(. e n d)
      end
    end
    context "#{prefix} of 1 elements" do
      it 'should have weakness' do
        res = subject.get_target([%w(x 8 w t), %w(t)])[:weakness]
        expect(res).to eq %w(e n d .)
      end
    end
  end

  describe '#handle_get_target' do
    prefix = 'given a multidimensional array of 4 elements each & 1 last array'
    context "#{prefix} of 4 elements" do
      it do
        res = subject.handle_get_target([%w(x 8 w t), %w(t j 4 2)], {})
        expect(res).to eql({target:%w(t j 4 2), weakness:%w(n d . .)})
      end
    end
    context "#{prefix} of 3 elements" do
      it do
        res = subject.handle_get_target([%w(x 8 w t), %w(t j 4)], {})
        expect(res).to eql({weakness:%w(. . e n)})
      end
    end
  end

  describe '#find_key' do
    context 'given an encrypted file in array form ' do
      it do
        res = subject.find_key("#{dir}test_encrypted.txt")
        expect(res.values).to eq [6, 6, 32, 30]
      end
    end
  end

  describe '#crack' do
    context 'given an encrypted file in array form' do
      it do
        subject.crack("#{dir}encrypted.txt", "#{dir}cracked.txt", '290216')
        expect(File.exist?("#{dir}cracked.txt")).to be_truthy
      end
      it do
        cracked_file = File.open("#{dir}cracked.txt", 'r').read
        message = File.open("#{dir}message.txt", 'r').read
        expect(cracked_file).to eql(message.downcase!)
      end
    end
  end
end
