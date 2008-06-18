class Country < ActiveRecord::Base
  has_many :cities, :states
end
