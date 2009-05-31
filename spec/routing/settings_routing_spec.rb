require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SettingsController do
  describe "route generation" do
    it "maps #new" do
      route_for(:controller => "settings", :action => "new").should == "/setting/new"
    end

    it "maps #show" do
      route_for(:controller => "settings", :action => "show").should == "/setting"
    end

    it "maps #edit" do
      route_for(:controller => "settings", :action => "edit").should == "/setting/edit"
    end

    it "maps #update" do
      route_for(:controller => "settings", :action => "update").should == {:path =>"/setting", :method => :put}
    end
  end

  describe "route recognition" do
    it "generates params for #show" do
      params_from(:get, "/setting").should == {:controller => "settings", :action => "show"}
    end

    it "generates params for #edit" do
      params_from(:get, "/setting/edit").should == {:controller => "settings", :action => "edit"}
    end

    it "generates params for #update" do
      params_from(:put, "/setting").should == {:controller => "settings", :action => "update"}
    end
  end
end
