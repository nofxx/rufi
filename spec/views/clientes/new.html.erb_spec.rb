require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/clientes/new.html.erb" do
  include ClientesHelper
  
  before(:each) do
    @cliente = mock_model(Cliente)
    @cliente.stub!(:new_record?).and_return(true)
    @cliente.stub!(:mac).and_return("MyString")
    @cliente.stub!(:ip).and_return("MyString")
    assigns[:cliente] = @cliente
  end

  it "should render new form" do
    render "/clientes/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", clientes_path) do
      with_tag("input#cliente_mac[name=?]", "cliente[mac]")
      with_tag("input#cliente_ip[name=?]", "cliente[ip]")
    end
  end
end


