require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/clientes/show.html.erb" do
  include ClientesHelper
  
  before(:each) do
    @cliente = mock_model(Cliente)
    @cliente.stub!(:mac).and_return("MyString")
    @cliente.stub!(:ip).and_return("MyString")

    assigns[:cliente] = @cliente
  end

  it "should render attributes in <p>" do
    render "/clientes/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
  end
end

