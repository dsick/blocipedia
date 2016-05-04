require 'rails_helper'
require 'devise'

RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
end

def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      user.confirm
      sign_in user
    end
  end

RSpec.describe DeviseController, type: :controller do

  

  describe DeviseController do
    login_user

    it "should have a current_user" do
      expect(subject.current_user).to_not eq(nil)
    end

    it "should sign out current_user" do
      sign_out subject.current_user
      expect(subject.current_user).to eq(nil)
    end
  end

end
