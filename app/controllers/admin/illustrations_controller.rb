class Admin::IllustrationsController < ApplicationController
  layout "admin"
  before_filter :require_admin
  
  def show
    @illustration = Illustration.find(params[:id])
    @gallery = Gallery.find(@illustration.gallery_id)
    @category = Category.find(@gallery.category_id)
    
    respond_to do |format|
      format.html
    end
  end

  def edit
    @illustration = Illustration.find(params[:id])
    @gallery = Gallery.find(@illustration.gallery_id)
    @category = Category.find(@gallery.category_id)
    @licenses = License.all
    
    respond_to do |format|
      format.html
    end
  end
  
  def create
    @gallery = Gallery.find(params[:gallery_id])
    @category = Category.find(@gallery.category_id)
    @illustration = @gallery.illustrations.build(params[:illustration])
    
    @illustration.license_id = @gallery.license_id
    @illustration.year = @gallery.year
    @illustration.name_en = "[add a name to this illustration]"
    @illustration.name_nl = "[add a name to this illustration]"
    @illustration.sorted_order = @gallery.illustrations.count + 1
    
    respond_to do |format|
      if @illustration.save
        flash[:notice] = 'Illustration was successfully added.'
      else
        flash[:notice] = 'Illustration could not be added.'
      end
      format.html { redirect_to [:admin, @gallery] }
    end    
  end

  def update
    @illustration = Illustration.find(params[:id])
    @gallery = Gallery.find(@illustration.gallery_id)
    @category = Category.find(@gallery.category_id)
    @licenses = License.all

    respond_to do |format|
      if @illustration.update_attributes(params[:illustration])
        flash[:notice] = 'Illustration was successfully updated.'
        format.html { redirect_to [:admin, @illustration] }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def destroy
    @illustration = Illustration.find(params[:id])
    @gallery = Gallery.find(@illustration.gallery_id)
    @illustration.destroy

    respond_to do |format|
      format.html { redirect_to [:admin, @gallery] }
    end
  end
end
