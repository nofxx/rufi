require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LogfilesController do
  describe "route generation" do

    it "should map { :controller => 'logfiles', :action => 'index' } to /logfiles" do
      route_for(:controller => "logfiles", :action => "index").should == "/logfiles"
    end
  
    it "should map { :controller => 'logfiles', :action => 'new' } to /logfiles/new" do
      route_for(:controller => "logfiles", :action => "new").should == "/logfiles/new"
    end
  
    it "should map { :controller => 'logfiles', :action => 'show', :id => 1 } to /logfiles/1" do
      route_for(:controller => "logfiles", :action => "show", :id => 1).should == "/logfiles/1"
    end
  
    it "should map { :controller => 'logfiles', :action => 'edit', :id => 1 } to /logfiles/1/edit" do
      route_for(:controller => "logfiles", :action => "edit", :id => 1).should == "/logfiles/1/edit"
    end
  
    it "should map { :controller => 'logfiles', :action => 'update', :id => 1} to /logfiles/1" do
      route_for(:controller => "logfiles", :action => "update", :id => 1).should == "/logfiles/1"
    end
  
    it "should map { :controller => 'logfiles', :action => 'destroy', :id => 1} to /logfiles/1" do
      route_for(:controller => "logfiles", :action => "destroy", :id => 1).should == "/logfiles/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'logfiles', action => 'index' } from GET /logfiles" do
      params_from(:get, "/logfiles").should == {:controller => "logfiles", :action => "index"}
    end
  
    it "should generate params { :controller => 'logfiles', action => 'new' } from GET /logfiles/new" do
      params_from(:get, "/logfiles/new").should == {:controller => "logfiles", :action => "new"}
    end
  
    it "should generate params { :controller => 'logfiles', action => 'create' } from POST /logfiles" do
      params_from(:post, "/logfiles").should == {:controller => "logfiles", :action => "create"}
    end
  
    it "should generate params { :controller => 'logfiles', action => 'show', id => '1' } from GET /logfiles/1" do
      params_from(:get, "/logfiles/1").should == {:controller => "logfiles", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'logfiles', action => 'edit', id => '1' } from GET /logfiles/1;edit" do
      params_from(:get, "/logfiles/1/edit").should == {:controller => "logfiles", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'logfiles', action => 'update', id => '1' } from PUT /logfiles/1" do
      params_from(:put, "/logfiles/1").should == {:controller => "logfiles", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'logfiles', action => 'destroy', id => '1' } from DELETE /logfiles/1" do
      params_from(:delete, "/logfiles/1").should == {:controller => "logfiles", :action => "destroy", :id => "1"}
    end
  end
end
