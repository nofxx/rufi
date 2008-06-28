class Ap < ActiveRecord::Base
  belongs_to :city
  belongs_to :country
  belongs_to :state
  has_many :clientes
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

