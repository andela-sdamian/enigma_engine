require 'spec_helper'
require 'support/engine_shared_examples_spec'
describe EnigmaEngine::Crack do 
  it { is_expected.to respond_to :handle_crack_rotation }
  it { is_expected.to respond_to :crack_char }
  it { is_expected.to respond_to :do }
  
  it_behaves_like "an engine process" 
end
