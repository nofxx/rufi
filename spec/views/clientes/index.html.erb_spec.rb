require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/clientes/index.html.erb" do
  include ClientesHelper
  
  before(:each) do
    cliente_98 = mock_model(Cliente)
    cliente_98.should_receive(:mac).and_return("MyString")
    cliente_98.should_receive(:ip).and_return("MyString")
    cliente_99 = mock_model(Cliente)
    cliente_99.should_receive(:mac).and_return("MyString")
    cliente_99.should_receive(:ip).and_return("MyString")

    assigns[:clientes] = [cliente_98, cliente_99]
  end

  it "should render list of clientes" do
    render "/clientes/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

