require 'enigma_engine'
describe EnigmaEngine::Crack do
  prefix = 'should have method'
  test_class = EnigmaEngine::Crack.new
  it 'should extend the Engine class' do
    expect(EnigmaEngine::Crack.superclass).to eql(EnigmaEngine::Engine)
  end
  it "#{prefix} get_target" do
    expect(test_class.respond_to?('get_target')).to eql(true)
  end
  it "#{prefix} find_key" do
    expect(test_class.respond_to?('find_key')).to eql(true)
  end
  it "#{prefix} crack" do
    expect(test_class.respond_to?('crack')).to eql(true)
  end

  describe '.get_target' do
    prefix = 'given a multidimensional array of 4 elements each & 1 last array'
    context "#{prefix} of 4 elements" do
      res = test_class.get_target([%w(x 8 w t), %w(t j 4 2)])
      it 'should have weakness' do
        expect(res[:weakness]).to eql(%w(n d . .))
      end
    end

    context "#{prefix} of 3 elements" do
      res = test_class.get_target([%w(x 8 w t), %w(t j 4)])
      it 'should have weakness' do
        expect(res[:weakness]).to eql(%w(. . e n))
      end
    end

    context "#{prefix} of 2 elements" do
      res = test_class.get_target([%w(x 8 w t), %w(t j)])
      it 'should have weakness' do
        expect(res[:weakness]).to eql(%w(. e n d))
      end
    end

    context "#{prefix} of 1 elements" do
      res = test_class.get_target([%w(x 8 w t), %w(t)])
      it 'should have weakness' do
        expect(res[:weakness]).to eql(%w(e n d .))
      end
    end
  end
end
