require 'rails_helper'

RSpec.describe "admin_writer/articles/edit", type: :view do
  before(:each) do
    @admin_writer_article = assign(:admin_writer_article, Article.create!())
  end

  it "renders the edit admin_writer_article form" do
    render

    assert_select "form[action=?][method=?]", admin_writer_article_path(@admin_writer_article), "post" do
    end
  end
end
