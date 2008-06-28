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
#Inicio da area de validos
  it "should be valido" do
    @ap.attributes = attr_validos_ap
    @ap.should be_valid
  end
  
  
  it "should incrementar o numero no banco" do
    lambda do
      @ap.attributes = attr_validos_ap
      @ap.save
    end.should change(Ap, :count).by(1) 
  end
  
  
  it "should have error on mac invalido" do
    @ap.attributes = attr_validos_ap.with(:mac => "FF:FF:FF:FF:FF:FF")
    @ap.should be_valid
  end
  
  it "should have error on mac invalido" do
    @ap.attributes = attr_validos_ap.with(:mac => "ff:ff:ff:ff:ff:ff")
    @ap.should be_valid
  end

#Fim da area de validos

#Inicio da area de invalidos
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
  
  it "should have error on mac invalido" do
    @ap.attributes = attr_validos_ap.with(:mac => "00:00")
    @ap.should have(1).error_on(:mac)
  end

#Fim da area de invalidos
  
  
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

