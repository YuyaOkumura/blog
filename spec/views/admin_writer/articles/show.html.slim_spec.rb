require 'rails_helper'

RSpec.describe "admin_writer/articles/show", type: :view do
  before(:each) do
    @admin_writer_article = assign(:admin_writer_article, Article.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
