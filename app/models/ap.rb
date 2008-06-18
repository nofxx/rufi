class Ap < ActiveRecord::Base
  belongs_to :city, :country, :state
  has_many :clientes
end
