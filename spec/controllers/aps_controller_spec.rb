require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ApsController do     
  
    fixtures :users

    u = User.first                  

    before(:each) do
      controller.stub!(:current_user).and_return(u)  
  #    controller.stub!(:admin).and_return(:true)       
    end
  
  describe "handling GET /aps" do

    before(:each) do
      @ap = mock_model(Ap)
      Ap.stub!(:find).and_return([@ap])
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
  
    # it "should find all aps" do
    #     Ap.should_receive(:find).and_return([@aps])
    #     do_get
    #   end             
  
    # it "should assign the found aps for the view" do
    #   do_get
    #   assigns[:aps].should == [@ap]
    # end   
  end

  describe "handling GET /aps.xml" do

    before(:each) do
      @aps = mock("Array of Aps", :to_xml => "XML")
      Ap.stub!(:find).and_return(@aps)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    # it "should find all aps" do
    #   Ap.should_receive(:find).with(:all).and_return(@aps)
    #   do_get
    # end    
  
    # it "should render the found aps as xml" do
    #   @aps.should_receive(:to_xml).and_return("XML")
    #   do_get
    #   response.body.should == "XML"
    # end   
  end

  describe "handling GET /aps/1" do

    before(:each) do
      @ap = mock_model(Ap)
      Ap.stub!(:find).and_return(@ap)
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
  
    it "should find the ap requested" do
      Ap.should_receive(:find).with("1").and_return(@ap)
      do_get
    end
  
    it "should assign the found ap for the view" do
      do_get
      assigns[:ap].should equal(@ap)
    end
  end

  describe "handling GET /aps/1.xml" do

    before(:each) do
      @ap = mock_model(Ap, :to_xml => "XML")
      Ap.stub!(:find).and_return(@ap)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the ap requested" do
      Ap.should_receive(:find).with("1").and_return(@ap)
      do_get
    end
  
    it "should render the found ap as xml" do
      @ap.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /aps/new" do

    before(:each) do
      @ap = mock_model(Ap)
      Ap.stub!(:new).and_return(@ap)
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
  
    it "should create an new ap" do
      Ap.should_receive(:new).and_return(@ap)
      do_get
    end
  
    it "should not save the new ap" do
      @ap.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new ap for the view" do
      do_get
      assigns[:ap].should equal(@ap)
    end
  end

  describe "handling GET /aps/1/edit" do

    before(:each) do
      @ap = mock_model(Ap)
      Ap.stub!(:find).and_return(@ap)
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
  
    it "should find the ap requested" do
      Ap.should_receive(:find).and_return(@ap)
      do_get
    end
  
    it "should assign the found Ap for the view" do
      do_get
      assigns[:ap].should equal(@ap)
    end
  end

  describe "handling POST /aps" do

    before(:each) do
      @ap = mock_model(Ap, :to_param => "1")
      Ap.stub!(:new).and_return(@ap)
    end
    
    describe "with successful save" do
  
      def do_post
        @ap.should_receive(:save).and_return(true)
        post :create, :ap => {}
      end
  
      it "should create a new ap" do
        Ap.should_receive(:new).with({}).and_return(@ap)
        do_post
      end

      it "should redirect to the new ap" do
        do_post
        response.should redirect_to(ap_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @ap.should_receive(:save).and_return(false)
        post :create, :ap => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /aps/1" do

    before(:each) do
      @ap = mock_model(Ap, :to_param => "1")
      Ap.stub!(:find).and_return(@ap)
    end
    
    describe "with successful update" do

      def do_put
        @ap.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the ap requested" do
        Ap.should_receive(:find).with("1").and_return(@ap)
        do_put
      end

      it "should update the found ap" do
        do_put
        assigns(:ap).should equal(@ap)
      end

      it "should assign the found ap for the view" do
        do_put
        assigns(:ap).should equal(@ap)
      end

      it "should redirect to the ap" do
        do_put
        response.should redirect_to(ap_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @ap.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /aps/1" do

    before(:each) do
      @ap = mock_model(Ap, :destroy => true)
      Ap.stub!(:find).and_return(@ap)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the ap requested" do
      Ap.should_receive(:find).with("1").and_return(@ap)
      do_delete
    end
  
    it "should call destroy on the found ap" do
      @ap.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the aps list" do
      do_delete
      response.should redirect_to(aps_url)
    end
  end
end
