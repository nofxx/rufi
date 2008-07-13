require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/logfiles/index.html.erb" do
  include LogfilesHelper
  
  before(:each) do
    assigns[:logfiles] = [
      stub_model(Logfile,
        :type => "value for type",
        :state => "value for state",
        :source_content_type => "value for source_content_type",
        :source_file_name => "value for source_file_name",
        :source_file_size => "1",
        :note => "value for note"
      ),
      stub_model(Logfile,
        :type => "value for type",
        :state => "value for state",
        :source_content_type => "value for source_content_type",
        :source_file_name => "value for source_file_name",
        :source_file_size => "1",
        :note => "value for note"
      )
    ]
  end

  # it "should render list of logfiles" do
  #   render "/logfiles/index.html.erb"
  # #  response.should have_tag("tr>td", "value for type", 2)
  #   response.should have_tag("tr>td", "value for state", 2)
  #   response.should have_tag("tr>td", "value for source_content_type", 2)
  #   response.should have_tag("tr>td", "value for source_file_name", 2)
  #   response.should have_tag("tr>td", "1", 2)
  #   response.should have_tag("tr>td", "value for note", 2)
  # end  
end

