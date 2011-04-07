class CategoriesController < ApplicationController
  layout "static"
  
  def show
    @category = Category.find(params[:id])
    @is_contact = @category.name_en == "Contact"
    @contact_form = ContactForm.new if @is_contact

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category }
    end
  end
end
