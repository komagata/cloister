class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      user = YAML.load_file File.join(RAILS_ROOT, "config", "user.yml")
      username == user["username"] && password == user["password"]
    end
  end
end
