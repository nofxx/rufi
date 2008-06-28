class City < ActiveRecord::Base
  belongs_to :region
  belongs_to :country
end

# == Schema Info
# Schema version: 20080618063650
#
# Table name: cities
#
#  id         :integer         not null, primary key
#  country_id :integer         
#  state_id   :integer         
#  code       :string(2)       
#  name       :string(40)      
#  created_at :datetime        
#  updated_at :datetime        
#

