require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/clients/new.html.erb" do
  include ClientsHelper
  
  before(:each) do
    @client = mock_model(Client)
    @client.stub!(:new_record?).and_return(true)
    @client.stub!(:mac).and_return("MyString")
    @client.stub!(:ip).and_return("MyString")
    assigns[:client] = @client
  end

  it "should render new form" do
    render "/clients/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", clients_path) do
      with_tag("input#client_mac[name=?]", "client[mac]")
      with_tag("input#client_ip[name=?]", "client[ip]")
    end
  end
end


