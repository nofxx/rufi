require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/clients/index.html.erb" do
  include ClientsHelper
  
  before(:each) do
    client_98 = mock_model(Client)
    client_98.should_receive(:mac).and_return("MyString")
    client_98.should_receive(:ip).and_return("MyString")
    client_99 = mock_model(Client)
    client_99.should_receive(:mac).and_return("MyString")
    client_99.should_receive(:ip).and_return("MyString")

    assigns[:clients] = [client_98, client_99]
  end

  it "should render list of clients" do
    render "/clients/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

