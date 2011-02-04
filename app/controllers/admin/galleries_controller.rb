class Admin::GalleriesController < ApplicationController
  layout "admin"
  before_filter :require_admin
  
  # GET /galleries/1
  # GET /galleries/1.xml
  def show
    @gallery = Gallery.find(params[:id])
    @category = Category.find(@gallery.category_id)
    @illustrations = @gallery.illustrations.find(:all, :order => "sorted_order")
    @illustration = @gallery.illustrations.build

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /galleries/new
  # GET /galleries/new.xml
  def new
    @category = Category.find(params[:category_id])
    @gallery = @category.galleries.build
    @licenses = License.all

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /galleries/1/edit
  def edit
    @gallery = Gallery.find(params[:id])
    @category = Category.find(@gallery.category_id)
    @licenses = License.all
  end

  # POST /galleries
  # POST /galleries.xml
  def create
    @category = Category.find(params[:category_id])
    @gallery = @category.galleries.build(params[:gallery])
    @licenses = License.all

    respond_to do |format|
      if @gallery.save
        flash[:notice] = 'Gallery was successfully created.'
        format.html { redirect_to [:admin, @gallery] }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /galleries/1
  # PUT /galleries/1.xml
  def update
    @gallery = Gallery.find(params[:id])
    @category = Category.find(@gallery.category_id)
    @licenses = License.all

    respond_to do |format|
      if @gallery.update_attributes(params[:gallery])
        flash[:notice] = 'Gallery was successfully updated.'
        format.html { redirect_to [:admin, @gallery] }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /galleries/1
  # DELETE /galleries/1.xml
  def destroy
    @gallery = Gallery.find(params[:id])
    @category = Category.find(@gallery.category_id)
    @gallery.destroy

    respond_to do |format|
      format.html { redirect_to [:admin, @category] }
    end
  end
end
