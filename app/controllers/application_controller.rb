class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      path = File.join(RAILS_ROOT, 'config', 'user.yml')
      user = YAML.load(ERB.new(File.open(path).read).result)
      username == user['username'] && password == user['password']
    end
  end
end
