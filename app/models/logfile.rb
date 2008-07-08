require 'hpricot'

class Logfile < ActiveRecord::Base     
  
  # #
  # RELATIONS
  #
  belongs_to :user      
  
  has_many :aps, :dependent => :destroy 
  has_many :clients, :dependent => :destroy
    
  # #
  # Paperclip
  # http://www.thoughtbot.com/projects/paperclip
  has_attached_file :source, 
    :path => ":rails_root/files/:class/:attachment/:id/:style_:basename.:extension",
    :url => "/:class/:attachment/:id/:style_:basename.:extension"
                                                            
  LOGFILE_TYPES = %w{ Kismet Airodump Airstumbler }

  validates_inclusion_of :type, :in => LOGFILE_TYPES 
  
  # Paperclip Validations
  validates_attachment_presence :source
  #validates_attachment_content_type :source, :content_type => ‘video/quicktime’
  
  # #
  # Acts as state machine
  acts_as_state_machine :initial => :pending
  state :pending
  state :parsing
  state :done#, :enter => :mail?
  state :error
  
  event :parse do
    transitions :from => :pending, :to => :parsing
  end

  event :parsed do
    transitions :from => :parsing, :to => :done
  end

  event :failed do
    transitions :from => :parsing, :to => :error
  end
  

  # #   
  # LOG PARSERS 
  # 
  # This method is called from the controller and takes care of the converting
  def parse_log(user)
    self.parse! 
    
    doc = Hpricot(open("#{RAILS_ROOT}/files/logfiles/sources/#{self.id}/original_#{self.source_file_name}"))
 
   
    convertido = (doc/'wireless-network').each do |ponto|
      
      essid = (ponto/:ssid).text    
      mac = (ponto/:bssid).text 
        
      ap = user.aps.find_by_mac(mac) || Ap.new   
                          

      ap.attributes = {
        :user     =>  user,   
        :logfile  =>  self,
        :essid    =>  essid,
        :mac      =>  mac,
        :channel  =>  (ponto/:channel).text.to_i, #8 #'channel'.to_i
        :enc      =>  (ponto/:encryption).text,  
        :ip       =>  (ponto/'ip-address'/'ip-range').text
      }   
      ap.save    
      
        (ponto/'wireless-client').each do |client|
                             
          mac = (client/'client-mac').text
          
          cli = user.clients.find_by_mac(mac) || Client.new
          
          cli.attributes = { 
            :user   =>    user, 
            :logfile  =>  self,             
            :ap     =>    ap,
            :mac    =>    mac,  
            :ip     =>    (client/'client-ip-address').text                        
          }  
        cli.save 
                 
      end
    end           
    
    if convertido #&& $?.exitstatus == 0
      self.parsed!
    else
      self.failed!
    end
                         
  end
end

  

class Kismet < Logfile
end    

class Airodump < Logfile
end

class Airstumbler < Logfile
end

# 
# class Kismet < Logfile
# end
# 
    # KISMET LOG EXAMPLE => variable 'doc
    # wireless-network wep="false" number="1" last-time="Wed Jul  2 15:42:24 2008" cloaked="false" type="infrastructure" first-time="Wed Jul  2 15:38:53 2008">
    #     <ssid>LinkMais-APD01</ssid>
    #     <bssid>00:02:6F:49:F6:B9</bssid>
    #     <channel>6</channel>
    #     <maxrate>11.0</maxrate>
    #     <maxseenrate>11000</maxseenrate>
    #     <carrier>IEEE 802.11g</carrier>
    #     <encryption>None</encryption>
    #     <packets>
    #       <llc>208</llc>
    #       <data>334</data>
    #       <crypt>0</crypt>
    #       <weak>0</weak>
    #       <dupeiv>0</dupeiv>
    #       <total>542</total>
    #     </packets>
    #     <datasize>266996</datasize>
    #     <gps-info unit="english">
    #       <min-lat>90.000000</min-lat>
    #       <min-lon>180.000000</min-lon>
    #       <min-alt>0.000000</min-alt>
    #       <min-spd>0.000000</min-spd>
    #       <max-lat>-90.000000</max-lat>
    #       <max-lon>-180.000000</max-lon>
    #       <max-alt>0.000000</max-alt>
    #       <max-spd>0.000000</max-spd>
    #     </gps-info>
    #     <ip-address type="arp">
    #       <ip-range>10.0.10.0</ip-range>
    #     </ip-address>
    #     <wireless-client wep="false" number="1" last-time="Wed Jul  2 15:38:53 2008" type="fromds" first-time="Wed Jul  2 15:38:53 2008">
    #       <client-mac>00:06:4F:52:AD:42</client-mac>
    #       <client-packets>
    #         <client-data>2</client-data>
    #         <client-crypt>0</client-crypt>
    #         <client-weak>0</client-weak>
    #       </client-packets>
    #       <client-encryption>None</client-encryption>
    #       <client-gps-info unit="english">
    #         <client-min-lat>90.000000</client-min-lat>
    #         <client-min-lon>180.000000</client-min-lon>
    #         <client-min-alt>0.000000</client-min-alt>
    #         <client-min-spd>0.000000</client-min-spd>
    #         <client-max-lat>-90.000000</client-max-lat>
    #         <client-max-lon>-180.000000</client-max-lon>
    #         <client-max-alt>0.000000</client-max-alt>
    #         <client-max-spd>0.000000</client-max-spd>
    #       </client-gps-info>
    #       <client-datasize>344</client-datasize>
    #       <client-maxrate>0.0</client-maxrate>
    #       <client-maxseenrate>11000</client-maxseenrate>
    #     </wireless-client>
    #       <cisco number="1">
    #     <cdp-device-id></cdp-device-id>
    #     <cdp-capability level2-transparent="false" igmp-forward="false" level2-sourceroute="false" level1="false" level3-routing="false" level2-switching="false" netlayer="false">
    #     <cdp-interface></cdp-interface>
    #     <cdp-ip>0.0.0.0</cdp-ip>
    #     <cdp-platform></cdp-platform>
    #     <cdp-software></cdp-software>
    #   </cdp-capability></cisco>
    # </wireless-network>  
       #        <wireless-client wep="false" number="17" last-time="Wed Jul  2 15:42:03 2008" type="fromds" first-time="Wed Jul  2 15:42:03 2008">
       #   <client-mac>00:0E:2E:4F:B0:03</client-mac>
       #   <client-packets>
       #     <client-data>2</client-data>
       #     <client-crypt>0</client-crypt>
       #     <client-weak>0</client-weak>
       #   </client-packets>
       #   <client-encryption>None</client-encryption>
       #   <client-gps-info unit="english">
       #     <client-min-lat>90.000000</client-min-lat>
       #     <client-min-lon>180.000000</client-min-lon>
       #     <client-min-alt>0.000000</client-min-alt>
       #     <client-min-spd>0.000000</client-min-spd>
       #     <client-max-lat>-90.000000</client-max-lat>
       #     <client-max-lon>-180.000000</client-max-lon>
       #     <client-max-alt>0.000000</client-max-alt>
       #     <client-max-spd>0.000000</client-max-spd>
       #   </client-gps-info>
       #   <client-datasize>156</client-datasize>
       #   <client-maxrate>0.0</client-maxrate>
       #   <client-maxseenrate>11000</client-maxseenrate>
       #   <client-ip-address type="arp">10.0.10.16</client-ip-address>
       # </wireless-client>        
       
    # 
    # 
    # #   

