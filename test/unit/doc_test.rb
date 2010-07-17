require 'test_helper'

class DocTest < ActiveSupport::TestCase
  fixtures :docs

  should_validate_presence_of :body, :created_at, :updated_at
end
