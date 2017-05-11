class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_tags
  before_action :set_base_breadcrumb

  def set_tags
    @default_tags = Tag.limit(5)
  end

  def set_base_breadcrumb
    add_breadcrumb 'ホーム', root_path
  end
end
