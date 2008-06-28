require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

module ApSpecHelper
  
  def attr_validos_ap
    {
      :essid => "Radio Pirata",
      :mac => "00:01:02:03:04:05"
    }
  end
end

describe Ap do
  
  include ApSpecHelper
  
  before(:each) do
    @ap = Ap.new
  end

  it "should be valido" do
    @ap.attributes = attr_validos_ap
    @ap.should be_valid
  end
  
  it do
    @ap.should have(1).error_on(:mac)
  end
  
  it "should have error on mac vazio (alternate)" do
    @ap.attributes = attr_validos_ap.except(:mac)
    @ap.should have(1).error_on(:mac)
  end
  
  it "should have error on mac invalido" do
    @ap.attributes = attr_validos_ap.with(:mac => "isso nao eh um mac")
    @ap.should have(1).error_on(:mac)
  end
  
end

# == Schema Info
# Schema version: 20080618063650
#
# Table name: aps
#
#  id         :integer         not null, primary key
#  cidade_id  :integer         
#  estado_id  :integer         
#  pais_id    :integer         
#  channel    :integer         
#  dhcp       :boolean         
#  enc        :string(10)      
#  essid      :string(150)     
#  ip         :string(25)      
#  key        :string(150)     
#  mac        :string(15)      
#  mask       :string(25)      
#  created_at :datetime        
#  updated_at :datetime        
#

