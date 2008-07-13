require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ClientsController do  
  
  fixtures :users

  u = User.first                  

  before(:each) do
    controller.stub!(:current_user).and_return(u)     
  end       
    
  describe "handling GET /clients" do

    before(:each) do
      @client = mock_model(Client)
      Client.stub!(:find).and_return([@client])
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
  
    # it "should find all clients" do
    #   Client.should_receive(:find).with(:all).and_return([@client])
    #   do_get
    # end
    #   
    # it "should assign the found clients for the view" do
    #   do_get
    #   assigns[:clients].should == [@client]
    # end   
  end

  describe "handling GET /clients.xml" do

    before(:each) do
      @clients = mock("Array of Clients", :to_xml => "XML")
      Client.stub!(:find).and_return(@clients)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    # it "should find all clients" do
    #   Client.should_receive(:find).with(:all).and_return(@clients)
    #   do_get
    # end
    #   
    # it "should render the found clients as xml" do
    #   @clients.should_receive(:to_xml).and_return("XML")
    #   do_get
    #   response.body.should == "XML"
    # end   
  end

  describe "handling GET /clients/1" do

    before(:each) do
      @client = mock_model(Client)
      Client.stub!(:find).and_return(@client)
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
  
    it "should find the client requested" do
      Client.should_receive(:find).with("1").and_return(@client)
      do_get
    end
  
    it "should assign the found client for the view" do
      do_get
      assigns[:client].should equal(@client)
    end
  end

  describe "handling GET /clients/1.xml" do

    before(:each) do
      @client = mock_model(Client, :to_xml => "XML")
      Client.stub!(:find).and_return(@client)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the client requested" do
      Client.should_receive(:find).with("1").and_return(@client)
      do_get
    end
  
    it "should render the found client as xml" do
      @client.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /clients/new" do

    before(:each) do
      @client = mock_model(Client)
      Client.stub!(:new).and_return(@client)
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
  
    it "should create an new client" do
      Client.should_receive(:new).and_return(@client)
      do_get
    end
  
    it "should not save the new client" do
      @client.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new client for the view" do
      do_get
      assigns[:client].should equal(@client)
    end
  end

  describe "handling GET /clients/1/edit" do

    before(:each) do
      @client = mock_model(Client)
      Client.stub!(:find).and_return(@client)
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
  
    it "should find the client requested" do
      Client.should_receive(:find).and_return(@client)
      do_get
    end
  
    it "should assign the found Client for the view" do
      do_get
      assigns[:client].should equal(@client)
    end
  end

  describe "handling POST /clients" do

    before(:each) do
      @client = mock_model(Client, :to_param => "1")
      Client.stub!(:new).and_return(@client)
    end
    
    describe "with successful save" do
  
      def do_post
        @client.should_receive(:save).and_return(true)
        post :create, :client => {}
      end
  
      it "should create a new client" do
        Client.should_receive(:new).with({}).and_return(@client)
        do_post
      end

      it "should redirect to the new client" do
        do_post
        response.should redirect_to(client_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @client.should_receive(:save).and_return(false)
        post :create, :client => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /clients/1" do

    before(:each) do
      @client = mock_model(Client, :to_param => "1")
      Client.stub!(:find).and_return(@client)
    end
    
    describe "with successful update" do

      def do_put
        @client.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the client requested" do
        Client.should_receive(:find).with("1").and_return(@client)
        do_put
      end

      it "should update the found client" do
        do_put
        assigns(:client).should equal(@client)
      end

      it "should assign the found client for the view" do
        do_put
        assigns(:client).should equal(@client)
      end

      it "should redirect to the client" do
        do_put
        response.should redirect_to(client_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @client.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /clients/1" do

    before(:each) do
      @client = mock_model(Client, :destroy => true)
      Client.stub!(:find).and_return(@client)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the client requested" do
      Client.should_receive(:find).with("1").and_return(@client)
      do_delete
    end
  
    it "should call destroy on the found client" do
      @client.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the clients list" do
      do_delete
      response.should redirect_to(clients_url)
    end
  end
end
