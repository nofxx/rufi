require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/logfiles/new.html.erb" do
  include LogfilesHelper
  
  before(:each) do
    assigns[:logfile] = stub_model(Logfile,
      :new_record? => true,
      :type => "value for type",
      :state => "value for state",
      :source_content_type => "value for source_content_type",
      :source_file_name => "value for source_file_name",
      :source_file_size => "1",
      :note => "value for note"
    )
  end

  it "should render new form" do
    render "/logfiles/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", logfiles_path) do
      with_tag("input#logfile_type[name=?]", "logfile[type]")
      with_tag("textarea#logfile_note[name=?]", "logfile[note]")
    end
  end
end


