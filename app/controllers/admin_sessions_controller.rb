class AdminSessionsController < ApplicationController
  def create
    @admin_session = AdminSession.new(params[:admin_session])
    if @admin_session.save
      flash[:notice] = "Login successful!"
      redirect_to :controller => "admin/home"
    else
      flash[:notice] = "Login failed."
      redirect_to :controller => "home"
    end
  end
  
  def destroy
    current_admin_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_to :controller => "/home"
  end
end
