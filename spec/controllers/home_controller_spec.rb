require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe HomeController do   
  fixtures :users
  integrate_views
      
  before(:each) do
    u = User.first
    controller.stub!(:current_user).and_return(u)  
    #controller.stub!(:admin?).and_return(:true)    
     #   controller.stub!(:'current_user.login').and_return(:true)     
  end
  
  it "should use HomeController" do
    controller.should be_an_instance_of(HomeController)
  end
      
  describe "GET 'index'" do
    # before(:each) do
    #         get 'index'
    #  # @story = model_factory.story_with_components[:story]
    # end
    
    def do_get
       get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render index template" do
      do_get
      response.should render_template('index')
    end
    
    it "should have tag bem vindo" do
      do_get
      response.should have_tag('p', /vindo/)
    end
    
    it "should hava @mensagem with value Bem-vindo" do
      do_get
      assigns[:mensagem].should == "Bem-vindo"
    end

  end
  
  describe "handling GET /index.xml" do
    #  before(:each) do
     #   @clientes = mock("Array of Clientes", :to_xml => "XML")
     #   Cliente.stub!(:find).and_return(@clientes)
    #  end
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
    
    it "should be successful" do
      do_get
      response.should be_success
    end
    
    it "should have text 'vindo'" do
      do_get
      response.should have_text(/vindo/)
    end
    
  end
end
# 
# describe ClientesController do
#   describe "handling GET /clientes" do
# 
#     before(:each) do
#       @cliente = mock_model(Cliente)
#       Cliente.stub!(:find).and_return([@cliente])
#     end
#   
# 
#   
#     it "should find all clientes" do
#       Cliente.should_receive(:find).with(:all).and_return([@cliente])
#       do_get
#     end
#   
#     it "should assign the found clientes for the view" do
#       do_get
#       assigns[:clientes].should == [@cliente]
#     end
#   end
# 




#     it "should find all clientes" do
#       Cliente.should_receive(:find).with(:all).and_return(@clientes)
#       do_get
#     end
#   
#     it "should render the found clientes as xml" do
#       @clientes.should_receive(:to_xml).and_return("XML")
#       do_get
#       response.body.should == "XML"
#     end

