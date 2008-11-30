class UsersController < ApplicationController
  before_filter :login_required

  # GET /user
  # GET /user.xml
  def show
    @user = User.first

    respond_to do |format|
      format.html # user.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /user/edit
  def edit
    @user = User.first
  end

  # PUT /user
  # PUT /user.xml
  def update
    @user = User.first

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to root_path }
        format.xml  { head :ok }
      else
        format.html { render :action => 'edit' }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
end
