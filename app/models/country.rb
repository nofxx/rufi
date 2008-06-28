class Country < ActiveRecord::Base
  has_many :cities
  has_many :states
end
# == Schema Info
# Schema version: 20080618063650
#
# Table name: countries
#
#  id         :integer         not null, primary key
#  code       :string(2)       
#  name       :string(40)      
#  created_at :datetime        
#  updated_at :datetime        
#

