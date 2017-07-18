class ContactsController < ApplicationController
  def index
    search = params[:search_terms]
    if search
      @contacts = Contact.where("first_name ILIKE ? OR last_name ILIKE ? OR middle_name ILIKE ? OR email ILIKE ? OR bio ILIKE ? OR phone_number LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      @contacts = Contact.all
    end
    

    render "index.html.erb"   
  end

  def new
    render "new.html.erb"
  end

  def create
    new_contact = Contact.new(
      first_name: params["first_name"],
      middle_name: params["middle_name"],
      last_name: params["last_name"],
      email: params["email"],
      phone_number: params["phone_number"],
      bio: params["bio"]
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
    @contact.middle_name = params[:middle_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.phone_number = params[:phone_number]
    @contact.bio = params[:bio]
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
