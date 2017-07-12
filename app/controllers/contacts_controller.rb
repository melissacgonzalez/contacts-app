class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    render "index.html.erb"   
  end

  def new
    render "new.html.erb"
  end

  def create
    @first_name = params["first_name"]
    @last_name = params["last_name"]
    @email = params["email"]
    @phone_number = params["phone_number"]
    new_contact = Contact.new(
      first_name: @first_name,
      last_name: @last_name,
      email: @email,
      phone_number: @phone_number
      )
    new_contact.save
    flash[:success] = "Contact successfully created!"
    redirect_to "/contacts/#{new_contact.id}"
  end

  def show
    @contact = Contact.find_by(id: params[:id])
    render "show.html.erb"
  end

  def edit
    @contact = Contact.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    @contact = Contact.find_by(id: params[:id])   
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.phone_number = params[:phone_number]
    @contact.save 
    flash[:success] = "Contact successfully updated!"
    redirect_to "/contacts/#{@contact.id}"
  end

  def destroy
    contact = Contact.find_by(id: params[:id])
    contact.destroy
    flash[:warning] = "Contact successfully destroyed!"
    redirect_to "/contacts"
  end
end
