class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionHelper

  before_action :set_tags
  before_action :set_base_breadcrumb
  before_action :set_user_token



  def set_tags
    @default_tags = Tag.limit(5)
  end

  def set_base_breadcrumb
    add_breadcrumb 'ホーム', root_path
  end

  def set_user_token
    return if session[:user_token].present?
    create_user_token
  end
end
