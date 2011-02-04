class Admin::LicensesController < ApplicationController
  layout "admin"
  before_filter :require_admin
  
  # GET /licenses
  # GET /licenses.xml
  def index
    @licenses = License.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /licenses/new
  # GET /licenses/new.xml
  def new
    @license = License.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /licenses/1/edit
  def edit
    @license = License.find(params[:id])
  end

  # POST /licenses
  # POST /licenses.xml
  def create
    @license = License.new(params[:license])

    respond_to do |format|
      if @license.save
        flash[:notice] = 'License was successfully created.'
        format.html { redirect_to admin_licenses_url }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /licenses/1
  # PUT /licenses/1.xml
  def update
    @license = License.find(params[:id])

    respond_to do |format|
      if @license.update_attributes(params[:license])
        flash[:notice] = 'License was successfully updated.'
        format.html { redirect_to admin_licenses_url }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /licenses/1
  # DELETE /licenses/1.xml
  def destroy
    @license = License.find(params[:id])
    @license.destroy

    respond_to do |format|
      format.html { redirect_to admin_licenses_url }
    end
  end
end
