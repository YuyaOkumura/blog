class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      result = @contact
    else
      result = false
    end
    render json: result
  end

  private
    def contact_params
      params.require(:contact).permit(:user_name, :title, :content)
    end
end
