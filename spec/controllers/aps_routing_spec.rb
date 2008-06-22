require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ApsController do
  describe "route generation" do

    it "should map { :controller => 'aps', :action => 'index' } to /aps" do
      route_for(:controller => "aps", :action => "index").should == "/aps"
    end
  
    it "should map { :controller => 'aps', :action => 'new' } to /aps/new" do
      route_for(:controller => "aps", :action => "new").should == "/aps/new"
    end
  
    it "should map { :controller => 'aps', :action => 'show', :id => 1 } to /aps/1" do
      route_for(:controller => "aps", :action => "show", :id => 1).should == "/aps/1"
    end
  
    it "should map { :controller => 'aps', :action => 'edit', :id => 1 } to /aps/1/edit" do
      route_for(:controller => "aps", :action => "edit", :id => 1).should == "/aps/1/edit"
    end
  
    it "should map { :controller => 'aps', :action => 'update', :id => 1} to /aps/1" do
      route_for(:controller => "aps", :action => "update", :id => 1).should == "/aps/1"
    end
  
    it "should map { :controller => 'aps', :action => 'destroy', :id => 1} to /aps/1" do
      route_for(:controller => "aps", :action => "destroy", :id => 1).should == "/aps/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'aps', action => 'index' } from GET /aps" do
      params_from(:get, "/aps").should == {:controller => "aps", :action => "index"}
    end
  
    it "should generate params { :controller => 'aps', action => 'new' } from GET /aps/new" do
      params_from(:get, "/aps/new").should == {:controller => "aps", :action => "new"}
    end
  
    it "should generate params { :controller => 'aps', action => 'create' } from POST /aps" do
      params_from(:post, "/aps").should == {:controller => "aps", :action => "create"}
    end
  
    it "should generate params { :controller => 'aps', action => 'show', id => '1' } from GET /aps/1" do
      params_from(:get, "/aps/1").should == {:controller => "aps", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'aps', action => 'edit', id => '1' } from GET /aps/1;edit" do
      params_from(:get, "/aps/1/edit").should == {:controller => "aps", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'aps', action => 'update', id => '1' } from PUT /aps/1" do
      params_from(:put, "/aps/1").should == {:controller => "aps", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'aps', action => 'destroy', id => '1' } from DELETE /aps/1" do
      params_from(:delete, "/aps/1").should == {:controller => "aps", :action => "destroy", :id => "1"}
    end
  end
end
