require 'ipaddr'


class Client < ActiveRecord::Base
  belongs_to :ap
  belongs_to :user
  
  ENC_TYPES = %w{ wep wpa wpa2-tkip wpa2-aes open }

  validates_each :ip, :allow_nil => true, :allow_blank => true do |record, attr, value|
    IPAddr.new(value) rescue record.errors.add attr, 'não é um ip válido' 
  end
  
  validates_numericality_of :lat, :lon, :greater_than => -180, :less_than => 180, :allow_nil => true
  
  
  # tnx to perl! http://www.perlmonks.org/?node_id=83405
  validates_format_of :mac, :with => /^([0-9a-f]{2}([:-]|$)){6}$/i,
          :message => "mac invalido"
          
  validates_numericality_of :channel, :only_integer => true, 
          :greater_than => 0, :less_than => 55, :allow_nil => true
  
  validates_numericality_of :mask, :only_integer => true, 
          :greater_than => 0, :less_than => 129, :allow_nil => true
          
  validates_inclusion_of :enc, :in => ENC_TYPES#.map {|disp, value| value}
  
  
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

