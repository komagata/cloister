class Doc < ActiveRecord::Base
  acts_as_ferret :fields => [:title, :body]

  @@record_timestamps = false
end
