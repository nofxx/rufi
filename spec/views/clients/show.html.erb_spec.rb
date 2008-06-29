require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/clients/show.html.erb" do
  include ClientsHelper
  
  before(:each) do
    @client = mock_model(Client)
    @client.stub!(:mac).and_return("MyString")
    @client.stub!(:ip).and_return("MyString")

    assigns[:client] = @client
  end

  it "should render attributes in <p>" do
    render "/clients/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
  end
end

