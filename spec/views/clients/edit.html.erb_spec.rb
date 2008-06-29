require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/clients/edit.html.erb" do
  include ClientsHelper
  
  before do
    @client = mock_model(Client)
    @client.stub!(:mac).and_return("MyString")
    @client.stub!(:ip).and_return("MyString")
    assigns[:client] = @client
  end

  it "should render edit form" do
    render "/clients/edit.html.erb"
    
    response.should have_tag("form[action=#{client_path(@client)}][method=post]") do
      with_tag('input#client_mac[name=?]', "client[mac]")
      with_tag('input#client_ip[name=?]', "client[ip]")
    end
  end
end


