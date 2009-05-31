require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SettingsController do
  def mock_setting(stubs={})
    @mock_setting ||= mock_model(Setting, stubs)
  end

  before do
    User.stub!(:first).stub!(:login).and_return(mock_user)
  end

  describe "GET show" do
    it "assigns the requested setting as @setting" do
      setting = mock_setting(
        :title       => 'foo',
        :description => 'bar',
        :flavor      => 'plain')
      Setting.stub!(:first).and_return(setting)
      get :show
      assigns[:setting].should equal(setting)
    end
  end

  describe "GET edit" do
    it "assigns the requested setting as @setting" do
      Setting.stub!(:find).with("37").and_return(mock_setting)
      get :edit, :id => "37"
      assigns[:setting].should equal(mock_setting)
    end
  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested setting" do
        Setting.should_receive(:find).with("37").and_return(mock_setting)
        mock_setting.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :setting => {:these => 'params'}
      end

      it "assigns the requested setting as @setting" do
        Setting.stub!(:find).and_return(mock_setting(:update_attributes => true))
        put :update, :id => "1"
        assigns[:setting].should equal(mock_setting)
      end

      it "redirects to the setting" do
        Setting.stub!(:find).and_return(mock_setting(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(setting_url(mock_setting))
      end
    end

    describe "with invalid params" do
      it "updates the requested setting" do
        Setting.should_receive(:find).with("37").and_return(mock_setting)
        mock_setting.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :setting => {:these => 'params'}
      end

      it "assigns the setting as @setting" do
        Setting.stub!(:find).and_return(mock_setting(:update_attributes => false))
        put :update, :id => "1"
        assigns[:setting].should equal(mock_setting)
      end

      it "re-renders the 'edit' template" do
        Setting.stub!(:find).and_return(mock_setting(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
  end
end
