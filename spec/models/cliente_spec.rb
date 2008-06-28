require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Cliente do
  before(:each) do
    @cliente = Cliente.new
  end

  it "should be valid" do
    @cliente.should be_valid
  end
end

# == Schema Info
# Schema version: 20080618063650
#
# Table name: clientes
#
#  id         :integer         not null, primary key
#  ap_id      :integer         
#  ip         :string(25)      
#  mac        :string(20)      
#  created_at :datetime        
#  updated_at :datetime        
#

