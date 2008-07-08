require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Logfile do 
  fixtures :users
  
  before(:each) do 
    f = File.open(File.dirname(__FILE__) + '/../fixtures/kismet.xml')
    u = User.first
    @valid_attributes = { 
      :user_id => 1,
      :state => :pending, 
      :source => f,
      # :source_content_type => "value for source_content_type",
      # :source_file_name => "value for source_file_name",
      # :source_file_size => "1",     
      :note => "value for note"
    }
  end   
  
  # #
  # Kismet
  it "should create a new instance given valid attributes" do
    Kismet.create!(@valid_attributes)
  end         
  
  it "shoud parse" do
    @logfile =  Kismet.create!(@valid_attributes)
  #  @logfile.parse_log
  end       
  
  # #
  # Unknown type       
  # it "should not create a new instance given valid attributes" do 
  #   @logfile =  Logfile.new(@valid_attributes)
  # 
  # end    
  
end
