require 'hpricot'

class Logfile < ActiveRecord::Base   
  belongs_to :user      
  
  # #
  # Paperclip
  # http://www.thoughtbot.com/projects/paperclip
  has_attached_file :source, 
    :path => ":rails_root/files/:class/:attachment/:id/:style_:basename.:extension",
    :url => "/:class/:attachment/:id/:style_:basename.:extension"

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
  # This method is called from the controller and takes care of the converting
  def parse_log
    self.parse!
    doc = Hpricot::XML("#{RAILS_ROOT}/files/logfiles/sources/#{self.id}/original_#{self.source_file_name}")
    p doc
    (doc/:'detection-run').each do |d| 
      'wireless-network'.each do |w|
        p w
        Ap.create!(:essid => 'SSID' )
      end
    end

    # 
    # if success #&& $?.exitstatus == 0
    #   self.parsed!
    # else
    #   self.failed!
    # end   
  end
  

  
end
