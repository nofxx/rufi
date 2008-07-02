class Logfile < ActiveRecord::Base   
  
  # #
  # Paperclip
  # http://www.thoughtbot.com/projects/paperclip
  has_attached_file :source

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
    success = true # TODO: parse_command
    if success #&& $?.exitstatus == 0
      self.parsed!
    else
      self.failed!
    end
  end
  
  def parse_command
  end

  
end
