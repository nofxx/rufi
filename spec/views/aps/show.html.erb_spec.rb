require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/aps/show.html.erb" do
  include ApsHelper
  
  before(:each) do
    @ap = mock_model(Ap)
    @ap.stub!(:essid).and_return("MyString")
    @ap.stub!(:mac).and_return("MyString")
    @ap.stub!(:enc).and_return("MyString")
    @ap.stub!(:key).and_return("MyString")
    @ap.stub!(:ip).and_return("MyString")
    @ap.stub!(:mask).and_return("MyString")
    @ap.stub!(:dhcp).and_return(false)
    @ap.stub!(:channel).and_return("1")
    @ap.stub!(:country).and_return()
    @ap.stub!(:city).and_return()
    @ap.stub!(:state).and_return()

    assigns[:ap] = @ap
  end

  it "should render attributes in <p>" do
    render "/aps/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/als/)
    response.should have_text(/1/)
    # response.should have_text(//)
    # response.should have_text(//)
    # response.should have_text(//)
  end
end

