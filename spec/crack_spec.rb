require 'spec_helper'
require 'enigma_engine/crack'
describe EnigmaEngine::Crack do
  obj = EnigmaEngine::Crack.new
  prefix = 'should have method'
  it 'should extend the Engine class' do
    expect(subject.class.superclass).to eql(EnigmaEngine::Engine)
  end
  it "#{prefix} handle_get_target" do
    expect(subject.respond_to?('handle_get_target')).to eql(true)
  end
  it "#{prefix} get_target" do
    expect(subject.respond_to?('get_target')).to eql(true)
  end
  it "#{prefix} find_key" do
    expect(subject.respond_to?('find_key')).to eql(true)
  end
  it "#{prefix} handle_crack_rotation" do
    expect(subject.respond_to?('handle_crack_rotation')).to eql(true)
  end
  it "#{prefix} crack" do
    expect(subject.respond_to?('crack')).to eql(true)
  end

  describe '.get_target' do
    prefix = 'given a multidimensional array of 4 elements each & 1 last array'
    context "#{prefix} of 4 elements" do
      res = obj.get_target([%w(x 8 w t), %w(t j 4 2)])
      it 'should have weakness' do
        expect(res[:weakness]).to eql(%w(n d . .))
      end
    end
    context "#{prefix} of 3 elements" do
      res = obj.get_target([%w(x 8 w t), %w(t j 4)])
      it 'should have weakness' do
        expect(res[:weakness]).to eql(%w(. . e n))
      end
    end
    context "#{prefix} of 2 elements" do
      res = obj.get_target([%w(x 8 w t), %w(t j)])
      it 'should have weakness' do
        expect(res[:weakness]).to eql(%w(. e n d))
      end
    end
    context "#{prefix} of 1 elements" do
      res = obj.get_target([%w(x 8 w t), %w(t)])
      it 'should have weakness' do
        expect(res[:weakness]).to eql(%w(e n d .))
      end
    end
  end

  describe '.handle_get_target' do
    prefix = 'given a multidimensional array of 4 elements each & 1 last array'
    context "#{prefix} of 4 elements" do
      res = obj.handle_get_target([%w(x 8 w t), %w(t j 4 2)], {})
      it 'should return' do
        expect(res).to eql({target:%w(t j 4 2), weakness:%w(n d . .)})
      end
    end
    context "#{prefix} of 3 elements" do
      res = obj.handle_get_target([%w(x 8 w t), %w(t j 4)], {})
      it 'should return' do
        expect(res).to eql({weakness:%w(. . e n)})
      end
    end
  end

  describe '.find_key' do
    context 'given an encrypted file in array form ' do
      dir = 'spec/file/'
      res = obj.find_key("#{dir}test_encrypted.txt")
      it 'should have a rotation of 6' do
        expect(res[:a_rotation]).to eql(6)
      end
      it 'should have b rotation 6' do
        expect(res[:b_rotation]).to eql(6)
      end
      it 'should have c rotation 32' do
        expect(res[:c_rotation]).to eql(32)
      end
      it 'should have d rotation 30' do
        expect(res[:d_rotation]).to eql(30)
      end
    end
  end

  describe '.crack' do
    context 'given an encrypted file in array form' do
      dir = 'spec/file/'
      obj.crack("#{dir}encrypted.txt", "#{dir}cracked.txt", '290216')
     it 'should create a file with name cracked.txt' do
       expect(File.exist?("#{dir}cracked.txt")).to eql(true)
     end
      it 'should crack the file' do
        cracked_file = File.open("#{dir}cracked.txt", 'r').read
        message = File.open("#{dir}message.txt", 'r').read
        expect(cracked_file).to eql(message.downcase!)
      end
    end
  end
end

