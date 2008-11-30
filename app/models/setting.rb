class Setting < ActiveRecord::Base
  def user
    User.first
  end
end
