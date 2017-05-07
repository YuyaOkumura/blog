class AdminWriter::ApplicationController < ApplicationController
  before_action :authenticate_user!
  layout 'admin_writer_application'
end
