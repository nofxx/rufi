require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LogfilesController do
  describe "responding to GET /logfiles" do

    before(:each) do
      @logfile = stub_model(Logfile)
      Logfile.stub!(:find).and_return([@logfile])
    end
  
    def do_get
      get :index
    end
  
    it "should succeed" do
      do_get
      response.should be_success
    end

    it "should render the 'index' template" do
      do_get
      response.should render_template('index')
    end
  
    it "should find all logfiles" do
      Logfile.should_receive(:find).with(:all).and_return([@logfile])
      do_get
    end
  
    it "should assign the found logfiles for the view" do
      do_get
      assigns[:logfiles].should == [@logfile]
    end
  end

  describe "responding to GET /logfiles.xml" do

    before(:each) do
      @logfiles = mock("Array of Logfiles", :to_xml => "XML")
      Logfile.stub!(:find).and_return(@logfiles)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should succeed" do
      do_get
      response.should be_success
    end

    it "should find all logfiles" do
      Logfile.should_receive(:find).with(:all).and_return(@logfiles)
      do_get
    end
  
    it "should render the found logfiles as xml" do
      @logfiles.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "responding to GET /logfiles/1" do

    before(:each) do
      @logfile = stub_model(Logfile)
      Logfile.stub!(:find).and_return(@logfile)
    end
  
    def do_get
      get :show, :id => "1"
    end

    it "should succeed" do
      do_get
      response.should be_success
    end
  
    it "should render the 'show' template" do
      do_get
      response.should render_template('show')
    end
  
    it "should find the logfile requested" do
      Logfile.should_receive(:find).with("1").and_return(@logfile)
      do_get
    end
  
    it "should assign the found logfile for the view" do
      do_get
      assigns[:logfile].should equal(@logfile)
    end
  end

  describe "responding to GET /logfiles/1.xml" do

    before(:each) do
      @logfile = stub_model(Logfile, :to_xml => "XML")
      Logfile.stub!(:find).and_return(@logfile)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should succeed" do
      do_get
      response.should be_success
    end
  
    it "should find the logfile requested" do
      Logfile.should_receive(:find).with("1").and_return(@logfile)
      do_get
    end
  
    it "should render the found logfile as xml" do
      @logfile.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "responding to GET /logfiles/new" do

    before(:each) do
      @logfile = stub_model(Logfile)
      Logfile.stub!(:new).and_return(@logfile)
    end
  
    def do_get
      get :new
    end

    it "should succeed" do
      do_get
      response.should be_success
    end
  
    it "should render the 'new' template" do
      do_get
      response.should render_template('new')
    end
  
    it "should create an new logfile" do
      Logfile.should_receive(:new).and_return(@logfile)
      do_get
    end
  
    it "should not save the new logfile" do
      @logfile.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new logfile for the view" do
      do_get
      assigns[:logfile].should equal(@logfile)
    end
  end

  describe "responding to GET /logfiles/1/edit" do

    before(:each) do
      @logfile = stub_model(Logfile)
      Logfile.stub!(:find).and_return(@logfile)
    end
  
    def do_get
      get :edit, :id => "1"
    end

    it "should succeed" do
      do_get
      response.should be_success
    end
  
    it "should render the 'edit' template" do
      do_get
      response.should render_template('edit')
    end
  
    it "should find the logfile requested" do
      Logfile.should_receive(:find).and_return(@logfile)
      do_get
    end
  
    it "should assign the found Logfile for the view" do
      do_get
      assigns[:logfile].should equal(@logfile)
    end
  end

  describe "responding to POST /logfiles" do

    before(:each) do
      @logfile = stub_model(Logfile, :to_param => "1")
      Logfile.stub!(:new).and_return(@logfile)
    end
    
    describe "with successful save" do
                 
  #TODO: ver pq isso nao funfa
  
      def do_post
   #     @logfile.should_receive(:save).and_return(true)
   #     post :create, :logfile => {}
      end
  
      it "should create a new logfile" do
  #      Logfile.should_receive(:new).with({}).and_return(@logfile)
  #      do_post
      end

      it "should assign the created logfile for the view" do
   #     do_post
   #     assigns(:logfile).should equal(@logfile)
      end

      it "should redirect to the created logfile" do
   ##     do_post
    #    response.should redirect_to(logfile_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @logfile.should_receive(:save).and_return(false)
        post :create, :logfile => {}
      end
  
      it "should assign the invalid logfile for the view" do
        do_post
        assigns(:logfile).should equal(@logfile)
      end

      it "should re-render the 'new' template" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "responding to PUT /logfiles/1" do

    before(:each) do
      @logfile = stub_model(Logfile, :to_param => "1")
      Logfile.stub!(:find).and_return(@logfile)
    end
    
    describe "with successful update" do

      def do_put
        @logfile.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the logfile requested" do
        Logfile.should_receive(:find).with("1").and_return(@logfile)
        do_put
      end

      it "should update the found logfile" do
        do_put
        assigns(:logfile).should equal(@logfile)
      end

      it "should assign the found logfile for the view" do
        do_put
        assigns(:logfile).should equal(@logfile)
      end

      it "should redirect to the logfile" do
        do_put
        response.should redirect_to(logfile_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @logfile.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should assign the found logfile for the view" do
        do_put
        assigns(:logfile).should equal(@logfile)
      end

      it "should re-render the 'edit' template" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "responding to DELETE /logfiles/1" do

    before(:each) do
      @logfile = stub_model(Logfile, :destroy => true)
      Logfile.stub!(:find).and_return(@logfile)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the logfile requested" do
      Logfile.should_receive(:find).with("1").and_return(@logfile)
      do_delete
    end
  
    it "should call destroy on the found logfile" do
      @logfile.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the logfiles list" do
      do_delete
      response.should redirect_to(logfiles_url)
    end
  end
end
