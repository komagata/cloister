class Doc < ActiveRecord::Base
  acts_as_ferret :fields => [:title, :body]

  def author
    User.first.name
  end
end
