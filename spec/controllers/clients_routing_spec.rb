require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ClientsController do
  describe "route generation" do

    it "should map { :controller => 'clients', :action => 'index' } to /clients" do
      route_for(:controller => "clients", :action => "index").should == "/clients"
    end
  
    it "should map { :controller => 'clients', :action => 'new' } to /clients/new" do
      route_for(:controller => "clients", :action => "new").should == "/clients/new"
    end
  
    it "should map { :controller => 'clients', :action => 'show', :id => 1 } to /clients/1" do
      route_for(:controller => "clients", :action => "show", :id => 1).should == "/clients/1"
    end
  
    it "should map { :controller => 'clients', :action => 'edit', :id => 1 } to /clients/1/edit" do
      route_for(:controller => "clients", :action => "edit", :id => 1).should == "/clients/1/edit"
    end
  
    it "should map { :controller => 'clients', :action => 'update', :id => 1} to /clients/1" do
      route_for(:controller => "clients", :action => "update", :id => 1).should == "/clients/1"
    end
  
    it "should map { :controller => 'clients', :action => 'destroy', :id => 1} to /clients/1" do
      route_for(:controller => "clients", :action => "destroy", :id => 1).should == "/clients/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'clients', action => 'index' } from GET /clients" do
      params_from(:get, "/clients").should == {:controller => "clients", :action => "index"}
    end
  
    it "should generate params { :controller => 'clients', action => 'new' } from GET /clients/new" do
      params_from(:get, "/clients/new").should == {:controller => "clients", :action => "new"}
    end
  
    it "should generate params { :controller => 'clients', action => 'create' } from POST /clients" do
      params_from(:post, "/clients").should == {:controller => "clients", :action => "create"}
    end
  
    it "should generate params { :controller => 'clients', action => 'show', id => '1' } from GET /clients/1" do
      params_from(:get, "/clients/1").should == {:controller => "clients", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'clients', action => 'edit', id => '1' } from GET /clients/1;edit" do
      params_from(:get, "/clients/1/edit").should == {:controller => "clients", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'clients', action => 'update', id => '1' } from PUT /clients/1" do
      params_from(:put, "/clients/1").should == {:controller => "clients", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'clients', action => 'destroy', id => '1' } from DELETE /clients/1" do
      params_from(:delete, "/clients/1").should == {:controller => "clients", :action => "destroy", :id => "1"}
    end
  end
end
