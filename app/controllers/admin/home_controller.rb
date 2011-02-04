class Admin::HomeController < ApplicationController
  layout "admin"
  before_filter :require_admin
  
  def index
    @categories = Category.all
  end
end
