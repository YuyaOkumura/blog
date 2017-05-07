require "rails_helper"

RSpec.describe AdminWriter::ArticlesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin_writer/articles").to route_to("admin_writer/articles#index")
    end

    it "routes to #new" do
      expect(:get => "/admin_writer/articles/new").to route_to("admin_writer/articles#new")
    end

    it "routes to #show" do
      expect(:get => "/admin_writer/articles/1").to route_to("admin_writer/articles#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin_writer/articles/1/edit").to route_to("admin_writer/articles#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin_writer/articles").to route_to("admin_writer/articles#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin_writer/articles/1").to route_to("admin_writer/articles#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin_writer/articles/1").to route_to("admin_writer/articles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin_writer/articles/1").to route_to("admin_writer/articles#destroy", :id => "1")
    end

  end
end
