# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def installed?
    User.count >= 0 ? true : false
  end
end
