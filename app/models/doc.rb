class Doc < ActiveRecord::Base
  include PaginationScope
  @@record_timestamps = false

  default_scope :order => "updated_at DESC"

  named_scope :title_like, lambda {|s|
    {:conditions => ["title LIKE ?", "%#{s}%"]}}

  named_scope :body_like, lambda {|s|
    {:conditions => ["body LIKE ?", "%#{s}%"]}}

  named_scope :search, lambda {|s|
    {:conditions => ["title LIKE ? OR body LIKE ?", "%#{s}%", "%#{s}%"]}}
end
