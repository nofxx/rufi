require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/clientes/edit.html.erb" do
  include ClientesHelper
  
  before do
    @cliente = mock_model(Cliente)
    @cliente.stub!(:mac).and_return("MyString")
    @cliente.stub!(:ip).and_return("MyString")
    assigns[:cliente] = @cliente
  end

  it "should render edit form" do
    render "/clientes/edit.html.erb"
    
    response.should have_tag("form[action=#{cliente_path(@cliente)}][method=post]") do
      with_tag('input#cliente_mac[name=?]', "cliente[mac]")
      with_tag('input#cliente_ip[name=?]', "cliente[ip]")
    end
  end
end


