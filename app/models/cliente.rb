class Cliente < ActiveRecord::Base
  belongs_to :ap
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

