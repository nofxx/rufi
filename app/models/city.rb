class City < ActiveRecord::Base
  belongs_to :state, :country
end
