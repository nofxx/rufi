require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ClientesController do
  describe "handling GET /clientes" do

    before(:each) do
      @cliente = mock_model(Cliente)
      Cliente.stub!(:find).and_return([@cliente])
    end
  
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
  
    it "should find all clientes" do
      Cliente.should_receive(:find).with(:all).and_return([@cliente])
      do_get
    end
  
    it "should assign the found clientes for the view" do
      do_get
      assigns[:clientes].should == [@cliente]
    end
  end

  describe "handling GET /clientes.xml" do

    before(:each) do
      @clientes = mock("Array of Clientes", :to_xml => "XML")
      Cliente.stub!(:find).and_return(@clientes)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all clientes" do
      Cliente.should_receive(:find).with(:all).and_return(@clientes)
      do_get
    end
  
    it "should render the found clientes as xml" do
      @clientes.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /clientes/1" do

    before(:each) do
      @cliente = mock_model(Cliente)
      Cliente.stub!(:find).and_return(@cliente)
    end
  
    def do_get
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render show template" do
      do_get
      response.should render_template('show')
    end
  
    it "should find the cliente requested" do
      Cliente.should_receive(:find).with("1").and_return(@cliente)
      do_get
    end
  
    it "should assign the found cliente for the view" do
      do_get
      assigns[:cliente].should equal(@cliente)
    end
  end

  describe "handling GET /clientes/1.xml" do

    before(:each) do
      @cliente = mock_model(Cliente, :to_xml => "XML")
      Cliente.stub!(:find).and_return(@cliente)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the cliente requested" do
      Cliente.should_receive(:find).with("1").and_return(@cliente)
      do_get
    end
  
    it "should render the found cliente as xml" do
      @cliente.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /clientes/new" do

    before(:each) do
      @cliente = mock_model(Cliente)
      Cliente.stub!(:new).and_return(@cliente)
    end
  
    def do_get
      get :new
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render new template" do
      do_get
      response.should render_template('new')
    end
  
    it "should create an new cliente" do
      Cliente.should_receive(:new).and_return(@cliente)
      do_get
    end
  
    it "should not save the new cliente" do
      @cliente.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new cliente for the view" do
      do_get
      assigns[:cliente].should equal(@cliente)
    end
  end

  describe "handling GET /clientes/1/edit" do

    before(:each) do
      @cliente = mock_model(Cliente)
      Cliente.stub!(:find).and_return(@cliente)
    end
  
    def do_get
      get :edit, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render edit template" do
      do_get
      response.should render_template('edit')
    end
  
    it "should find the cliente requested" do
      Cliente.should_receive(:find).and_return(@cliente)
      do_get
    end
  
    it "should assign the found Cliente for the view" do
      do_get
      assigns[:cliente].should equal(@cliente)
    end
  end

  describe "handling POST /clientes" do

    before(:each) do
      @cliente = mock_model(Cliente, :to_param => "1")
      Cliente.stub!(:new).and_return(@cliente)
    end
    
    describe "with successful save" do
  
      def do_post
        @cliente.should_receive(:save).and_return(true)
        post :create, :cliente => {}
      end
  
      it "should create a new cliente" do
        Cliente.should_receive(:new).with({}).and_return(@cliente)
        do_post
      end

      it "should redirect to the new cliente" do
        do_post
        response.should redirect_to(cliente_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @cliente.should_receive(:save).and_return(false)
        post :create, :cliente => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /clientes/1" do

    before(:each) do
      @cliente = mock_model(Cliente, :to_param => "1")
      Cliente.stub!(:find).and_return(@cliente)
    end
    
    describe "with successful update" do

      def do_put
        @cliente.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the cliente requested" do
        Cliente.should_receive(:find).with("1").and_return(@cliente)
        do_put
      end

      it "should update the found cliente" do
        do_put
        assigns(:cliente).should equal(@cliente)
      end

      it "should assign the found cliente for the view" do
        do_put
        assigns(:cliente).should equal(@cliente)
      end

      it "should redirect to the cliente" do
        do_put
        response.should redirect_to(cliente_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @cliente.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /clientes/1" do

    before(:each) do
      @cliente = mock_model(Cliente, :destroy => true)
      Cliente.stub!(:find).and_return(@cliente)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the cliente requested" do
      Cliente.should_receive(:find).with("1").and_return(@cliente)
      do_delete
    end
  
    it "should call destroy on the found cliente" do
      @cliente.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the clientes list" do
      do_delete
      response.should redirect_to(clientes_url)
    end
  end
end
