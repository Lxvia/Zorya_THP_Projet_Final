class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver_now
      flash[:success] = "Votre demande à bien été enregistrée."
      redirect_to contact_thanks_path(@contact.id)
    else
      flash[:danger] = "Votre demande n'a pas pu être enregistrée, veuillez réessayer."
      render :new
    end
  end

  def thanks; end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :content)
  end
end
