class ApplicationController < ActionController::Base
  include AuthenticatedSystem

  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  before_filter :init

  protected
  def init
    @setting = Setting.first
    @head_title = @setting.title
    @meta_description = @setting.description
    @meta_keywords = '鬱,Ruby,PHP,Rails'
    @title = @setting.title
    @description = @setting.description
    @flavor = @setting.flavor
    @author = User.first.login
    @flavor_dir = "public/flavor/#{@flavor}"
    @view_dir = "#{@flavor_dir}/app/views"

    prepend_view_path @view_dir
    logger.debug "view_paths: #{view_paths}"

    @flavor_path = "/flavor/#{@flavor}"
    @images_path = "#{@flavor_path}/public/images"
    @stylesheets_path = "#{@flavor_path}/public/stylesheets"
    @javascripts_path = "#{@flavor_path}/public/javascripts"
  end
end
