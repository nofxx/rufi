require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

module ApSpecHelper
  
  def attr_validos_ap
    {            
      :user_id => 1,
      :essid => 'Radio Pirata',
      :enc => 'WEP',
      :mac => '00:01:02:03:04:05',
      :lat => '178.842984',
      :lon => -176.847979,
      :ip => '200.80.70.10',
      :mask => 16,
      :key => 'HDgDHdhdGdhdgDHgd3810383hdhdkd8dhd',
      :channel => 10,     
      :dhcp => 1
    }
  end
end

describe Ap do    
  
  fixtures :users
  
  include ApSpecHelper
  
  describe "Aps validos" do
    
    before(:each) do
      @ap = Ap.new
    end

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
  
    it "should accept upcase letters" do
      @ap.attributes = attr_validos_ap.with(:mac => "FF:FF:FF:FF:FF:FF")
      @ap.should be_valid
    end
  
    it "should accept lowcase letters" do
      @ap.attributes = attr_validos_ap.with(:mac => "ff:ff:ff:ff:ff:ff")
      @ap.should be_valid
    end
    
    it "should accept ipv6 addresses" do
      @ap.attributes = attr_validos_ap.with(:ip => 'fe80::fcfd:43ff:fe12:d079')
      @ap.should be_valid
    end
    
    it "should accept blank ip" do
      @ap.attributes = attr_validos_ap.with(:ip => '')
      @ap.should be_valid
    end
    
    it "should accept nil ip" do
      @ap.attributes = attr_validos_ap.with(:ip => nil)
      @ap.should be_valid
    end
    

    
  end

  describe "Aps invalidos" do
    
    before(:each) do
      @ap = Ap.new
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
  
    it "should have error on mac invalido" do
      @ap.attributes = attr_validos_ap.with(:mac => "00:00")
      @ap.should have(1).error_on(:mac)
    end
    
    it "should have error on ip invalido" do
      @ap.attributes = attr_validos_ap.with(:ip => "hfjsf")
      @ap.should have(1).error_on(:ip)
    end
    
    it "should have error with a negative channel" do
      @ap.attributes = attr_validos_ap.with(:channel => -1)
      @ap.should have(1).error_on(:channel)
    end
    
    it "should have error with a channel greater than 55" do
      @ap.attributes = attr_validos_ap.with(:channel => 56)
      @ap.should have(1).error_on(:channel)
    end
    
    it "should have error with a strange encryption" do
      @ap.attributes = attr_validos_ap.with(:enc => 'enigma')
      @ap.should have(1).error_on(:enc)
    end
    
    it "should have error with a strange latituden" do
      @ap.attributes = attr_validos_ap.with(:lat => 1093)
      @ap.should have(1).error_on(:lat)
    end
    
    it "should have error with a strange longitude" do
      @ap.attributes = attr_validos_ap.with(:lon => -1093)
      @ap.should have(1).error_on(:lon)
    end
    
    it "should have error with a strange latituden" do
      @ap.attributes = attr_validos_ap.with(:lat => 0x1993)
      @ap.should have(1).error_on(:lat)
    end
    
    it "should have error with a strange longitude" do
      @ap.attributes = attr_validos_ap.with(:lon => '2323')
      @ap.should have(1).error_on(:lon)
    end
    
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

