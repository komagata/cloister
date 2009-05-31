require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Setting do
  before(:each) do
    @valid_attributes = {
      :title => 'Cloister',
      :description => 'Simple apps for text writing',
      :flavor => 'plain',
      :updated_at => '2008-12-03 01:59:08',
      :created_at => '2008-12-03 01:59:08'
    }
  end

  it "should create a new instance given valid attributes" do
    Setting.create!(@valid_attributes)
  end
end
