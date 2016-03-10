RSpec.shared_examples "a_character_map" do 
  
  it { is_expected.to respond_to :char_map }
  it { is_expected.to respond_to :char_map_hash}
  it { is_expected.to respond_to :char_map_with_index}
  
  describe "#char_map" do 
    let(:characters) do 
      [ "a", "b", "c", "d", "e", "f", 
        "g", "h", "i", "j", "k", "l", 
        "m", "n", "o", "p", "q", "r", 
        "s", "t", "u", "v", "w", "x", 
        "y", "z", "0", "1", "2", "3", 
        "4", "5", "6", "7", "8", 
        "9", " ", ".", ","]
    end
    it { expect(subject.char_map).to eql characters }
  end
  
  describe "#char_map_hash" do 
    let(:char_map_hash) do 
      {"a"=>"a", "b"=>"b", "c"=>"c", "d"=>"d", "e"=>"e", 
       "f"=>"f", "g"=>"g", "h"=>"h", "i"=>"i", "j"=>"j",
       "k"=>"k", "l"=>"l", "m"=>"m", "n"=>"n", "o"=>"o", 
       "p"=>"p", "q"=>"q", "r"=>"r", "s"=>"s", "t"=>"t", 
       "u"=>"u", "v"=>"v", "w"=>"w", "x"=>"x", "y"=>"y", 
       "z"=>"z", "0"=>"0", "1"=>"1", "2"=>"2", "3"=>"3", 
       "4"=>"4", "5"=>"5", "6"=>"6", "7"=>"7", "8"=>"8", 
       "9"=>"9", " "=>" ", "."=>".", ","=>","}
    end  
    it { expect(subject.char_map_hash).to eql char_map_hash}
  end
  
  describe "#char_map_with_index" do 
    let(:char_map_with_index) do 
     { "a"=>0, "b"=>1, "c"=>2, "d"=>3, "e"=>4, "f"=>5, 
      "g"=>6, "h"=>7, "i"=>8, "j"=>9, "k"=>10, 
      "l"=>11, "m"=>12, "n"=>13, "o"=>14, "p"=>15,
       "q"=>16, "r"=>17, "s"=>18, "t"=>19, "u"=>20, 
       "v"=>21, "w"=>22, "x"=>23, "y"=>24, "z"=>25, 
       "0"=>26, "1"=>27, "2"=>28, "3"=>29, "4"=>30, 
       "5"=>31, "6"=>32, "7"=>33, "8"=>34, 
       "9"=>35, " "=>36, "."=>37, ","=>38} 
    end
    it { expect(subject.char_map_with_index).to eql char_map_with_index}
  end
end
