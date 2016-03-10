require 'spec_helper'

describe EnigmaEngine::Cracker do 
  it { is_expected.to respond_to :get_target }
  it { is_expected.to respond_to :find_key }
  
  describe "#get_target" do 
    let(:match) { subject.get_target([%w(x 8 w t), %w(t j 4 2)]) }
    
    it { expect(match[:weakness]).to eql %w(n d . .) }
  end
end
