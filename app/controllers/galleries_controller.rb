class GalleriesController < ApplicationController
  layout "static"
  
  def show
    @gallery = Gallery.find(params[:id])
    @category = Category.find(@gallery.category_id)
    @illustrations = @gallery.illustrations.find(:all, :order => "sorted_order")

    respond_to do |format|
      format.html # show.html.erb
    end
  end
end
