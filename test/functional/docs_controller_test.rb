require 'test_helper'

class DocsControllerTest < ActionController::TestCase
  fixtures :docs

  context "on GET to :show" do
    setup {
      get :show, :id => 1
    }

    should_respond_with :success
  end
end
