require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ClientesController do
  describe "route generation" do

    it "should map { :controller => 'clientes', :action => 'index' } to /clientes" do
      route_for(:controller => "clientes", :action => "index").should == "/clientes"
    end
  
    it "should map { :controller => 'clientes', :action => 'new' } to /clientes/new" do
      route_for(:controller => "clientes", :action => "new").should == "/clientes/new"
    end
  
    it "should map { :controller => 'clientes', :action => 'show', :id => 1 } to /clientes/1" do
      route_for(:controller => "clientes", :action => "show", :id => 1).should == "/clientes/1"
    end
  
    it "should map { :controller => 'clientes', :action => 'edit', :id => 1 } to /clientes/1/edit" do
      route_for(:controller => "clientes", :action => "edit", :id => 1).should == "/clientes/1/edit"
    end
  
    it "should map { :controller => 'clientes', :action => 'update', :id => 1} to /clientes/1" do
      route_for(:controller => "clientes", :action => "update", :id => 1).should == "/clientes/1"
    end
  
    it "should map { :controller => 'clientes', :action => 'destroy', :id => 1} to /clientes/1" do
      route_for(:controller => "clientes", :action => "destroy", :id => 1).should == "/clientes/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'clientes', action => 'index' } from GET /clientes" do
      params_from(:get, "/clientes").should == {:controller => "clientes", :action => "index"}
    end
  
    it "should generate params { :controller => 'clientes', action => 'new' } from GET /clientes/new" do
      params_from(:get, "/clientes/new").should == {:controller => "clientes", :action => "new"}
    end
  
    it "should generate params { :controller => 'clientes', action => 'create' } from POST /clientes" do
      params_from(:post, "/clientes").should == {:controller => "clientes", :action => "create"}
    end
  
    it "should generate params { :controller => 'clientes', action => 'show', id => '1' } from GET /clientes/1" do
      params_from(:get, "/clientes/1").should == {:controller => "clientes", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'clientes', action => 'edit', id => '1' } from GET /clientes/1;edit" do
      params_from(:get, "/clientes/1/edit").should == {:controller => "clientes", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'clientes', action => 'update', id => '1' } from PUT /clientes/1" do
      params_from(:put, "/clientes/1").should == {:controller => "clientes", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'clientes', action => 'destroy', id => '1' } from DELETE /clientes/1" do
      params_from(:delete, "/clientes/1").should == {:controller => "clientes", :action => "destroy", :id => "1"}
    end
  end
end
