class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :init

  protected
  def init
    @title = "p0t"
    @description = "ガチ鬱プログラマー日記"
    @keywords = '鬱,Ruby,PHP,Rails'
  end

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      user = YAML.load_file File.join(RAILS_ROOT, "config", "user.yml")
      username == user["username"] && password == user["password"]
    end
  end
end
