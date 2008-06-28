class Region < ActiveRecord::Base
  belongs_to :country
  has_many :cities
end

# == Schema Info
# Schema version: 20080618063650
#
# Table name: states
#
#  id         :integer         not null, primary key
#  country_id :integer         
#  code       :string(2)       
#  name       :string(40)      
#  created_at :datetime        
#  updated_at :datetime        
#

