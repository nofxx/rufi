require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/logfiles/show.html.erb" do
  include LogfilesHelper
  
  before(:each) do
    assigns[:logfile] = @logfile = stub_model(Logfile,
      :type => "value for type",
      :state => "value for state",
      :source_content_type => "value for source_content_type",
      :source_file_name => "value for source_file_name",
      :source_file_size => "1",
      :note => "value for note"
    )
  end

  it "should render attributes in <p>" do
    render "/logfiles/show.html.erb"
    response.should have_text(/value\ for\ state/)
    response.should have_text(/value\ for\ source_content_type/)
    response.should have_text(/value\ for\ source_file_name/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ note/)
  end
end

