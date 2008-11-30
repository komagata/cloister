class SettingsController < ApplicationController
  before_filter :login_required

  # GET /setting
  # GET /setting.xml
  def show
    @setting = Setting.first

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @setting }
    end
  end

  # GET /setting/edit
  def edit
    @setting = Setting.first
  end

  # PUT /setting
  # PUT /setting.xml
  def update
    @setting = Setting.first

    respond_to do |format|
      if @setting.update_attributes(params[:setting])
        flash[:notice] = 'Setting was successfully updated.'
        format.html { redirect_to root_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @setting.errors, :status => :unprocessable_entity }
      end
    end
  end
end
