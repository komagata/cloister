# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
#  protect_from_forgery # :secret => 'f1ab904439e38b3268ac1247a102d41a'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  before_filter :setting

  protected
  def setting
    @setting = Setting.first
    @head_title = @setting.title
    @meta_description = @setting.description
    @meta_keywords = '鬱,Ruby,PHP,Rails'
    @title = @setting.title
    @description = @setting.description
  end

  def install_required
    unless User.count > 0
      flash[:notice] = 'インストールを完了させてください。'
      redirect_to edit_setting_path(1)
    end
  end
end
