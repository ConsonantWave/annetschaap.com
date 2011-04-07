class ContactFormsController < ApplicationController
  def create
    @contact_form = ContactForm.new(params[:contact_form])
    if @contact_form.save
      flash[:notice] = "Thanks for contacting us!"
    else
      flash[:notice] = "Unfortunately your comments weren't sent. Try again later!"
    end
    redirect_to root_path
  end
end
