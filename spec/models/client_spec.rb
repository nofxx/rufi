require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

module ClientSpecHelper
  
  def attr_validos_client
    {
      :essid => 'Radio Pirata',
      :mac => '00:01:02:03:04:05',
      :lat => '178.842984',
      :lon => -176.847979,
      :ip => '200.80.70.10',
      :mask => 16,
      :key => 'HDgDHdhdGdhdgDHgd3810383hdhdkd8dhd',
      :channel => 10,
    }
  end
end

describe Client do
  
  fixtures :aps
  
  include ClientSpecHelper
  
  describe "Clients validos" do
    
    before(:each) do
      @client = Client.new
    end

    it "should be valido" do
      @client.attributes = attr_validos_client
      @client.should be_valid
    end
  
    it "should incrementar o numero no banco" do

        lambda do      
                  @client.attributes = attr_validos_client      
           @client.save 
        end.should change(Client, :count).by(1)
    end
  
    it "should accept upcase letters" do
      @client.attributes = attr_validos_client.with(:mac => "FF:FF:FF:FF:FF:FF")
      @client.should be_valid
    end
  
    it "should accept lowcase letters" do
      @client.attributes = attr_validos_client.with(:mac => "ff:ff:ff:ff:ff:ff")
      @client.should be_valid
    end
    
    it "should accept ipv6 addresses" do
      @client.attributes = attr_validos_client.with(:ip => 'fe80::fcfd:43ff:fe12:d079')
      @client.should be_valid
    end
    
    it "should accept blank ip" do
      @client.attributes = attr_validos_client.with(:ip => '')
      @client.should be_valid
    end
    
    it "should accept nil ip" do
      @client.attributes = attr_validos_client.with(:ip => nil)
      @client.should be_valid
    end
    
    it "should accept a valid ap" do
      @ap = Ap.first
      @client.attributes = attr_validos_client.with(:ap => @ap)
    end
    

  end
  
  describe "Clients invalidos" do
    
    before(:each) do
      @client = Client.new
    end

    it do
      @client.should have(1).error_on(:mac)
    end  
      
 # lambda do
 #   @client.save
 # end.should_not change(Client, :count)
  
    it "should have error on mac vazio (alternate)" do
      @client.attributes = attr_validos_client.except(:mac)
      @client.should have(1).error_on(:mac)
    end
  
    it "should have error on mac invalido" do
      @client.attributes = attr_validos_client.with(:mac => "isso nao eh um mac")
      @client.should have(1).error_on(:mac)
    end
  
    it "should have error on mac invalido" do
      @client.attributes = attr_validos_client.with(:mac => "00:00")
      @client.should have(1).error_on(:mac)
    end
    
    it "should have error on ip invalido" do
      @client.attributes = attr_validos_client.with(:ip => "hfjsf")
      @client.should have(1).error_on(:ip)
    end
    
    it "should have error with a negative channel" do
      @client.attributes = attr_validos_client.with(:channel => -1)
      @client.should have(1).error_on(:channel)
    end
    
    it "should have error with a channel greater than 55" do
      @client.attributes = attr_validos_client.with(:channel => 56)
      @client.should have(1).error_on(:channel)
    end
    
    it "should have error with a strange encryption" do
      @client.attributes = attr_validos_client.with(:enc => 'enigma')
      @client.should have(1).error_on(:enc)
    end
    
    it "should have error with a strange latituden" do
      @client.attributes = attr_validos_client.with(:lat => 1093)
      @client.should have(1).error_on(:lat)
    end
    
    it "should have error with a strange longitude" do
      @client.attributes = attr_validos_client.with(:lon => -1093)
      @client.should have(1).error_on(:lon)
    end
    
    it "should have error with a strange latituden" do
      @client.attributes = attr_validos_client.with(:lat => 0x1993)
      @client.should have(1).error_on(:lat)
    end
    
    it "should have error with a strange longitude" do
      @client.attributes = attr_validos_client.with(:lon => '2323')
      @client.should have(1).error_on(:lon)
    end
    


  end

end

# == Schema Info
# Schema version: 20080618063650
#
# Table name: clients
#
#  id         :integer         not null, primary key
#  client_id      :integer         
#  ip         :string(25)      
#  mac        :string(20)      
#  created_at :datetime        
#  updated_at :datetime        
#

