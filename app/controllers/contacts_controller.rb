class ContactsController < ApplicationController
  before_action :authenticate_user!

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      redirect_to new_contact_path
    else
      redirect_to new_contact_path
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :message)
  end
end
