class IllustrationsController < ApplicationController
  layout "static"
  
  def show
    @illustration = Illustration.find(params[:id])
    @previous = @illustration.previous
    @next = @illustration.next
    @license = License.find(@illustration.license_id)
    @gallery = Gallery.find(@illustration.gallery_id)
    @category = Category.find(@gallery.category_id)
    
    respond_to do |format|
      format.html
    end
  end
end
