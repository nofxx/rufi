require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Ap do
  before(:each) do
    @ap = Ap.new
  end

  it "should be valid" do
    @ap.should be_valid
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

