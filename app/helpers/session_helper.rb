module SessionHelper
  require 'securerandom'

  def create_user_token
    session[:user_token] = get_base64
  end

  def current_user_token
    @current_session = session[:user_token]
  end

  private
    def get_base64
      return SecureRandom.base64(64)
    end
end