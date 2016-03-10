require 'spec_helper'
require 'support/engine_shared_examples_spec'
describe EnigmaEngine::Decrypt do 
   subject { EnigmaEngine::Decrypt.new('81322','090316') }
    it_behaves_like "an engine process"
end 

