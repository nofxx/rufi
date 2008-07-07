require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Logfile do 
  fixtures :users
  
  before(:each) do 
    f = "#{RAILS_ROOT}/spec/fixtures/kismet.xml"
    u = User.first
    @valid_attributes = {
      :type => 'Kismet',
      :state => :pending, 
      :source => f,
      # :source_content_type => "value for source_content_type",
      # :source_file_name => "value for source_file_name",
      # :source_file_size => "1",     
      :note => "value for note"
    }
  end
  # 
  # it "should create a new instance given valid attributes" do
  #   Logfile.create!(@valid_attributes)
  # end         
  # 
  # it "shoud parse" do
  #   @logfile =  Logfile.create!(@valid_attributes)
  # #  @logfile.parse_log
  # end    
  
end
