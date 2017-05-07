require 'rails_helper'

RSpec.describe "admin_writer/articles/index", type: :view do
  before(:each) do
    assign(:articles, [
      Article.create!(),
      Article.create!()
    ])
  end

  it "renders a list of admin_writer/articles" do
    render
  end
end
