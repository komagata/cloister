class SessionsController < ApplicationController
  before_filter :login_required, :only => :new

  def new
    redirect_to root_path
  end

  def destroy
    logout_killing_session!
    flash[:notice] = 'You have been logged out.'
    redirect_back_or_default root_path
  end
end
