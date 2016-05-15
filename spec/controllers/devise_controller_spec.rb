require 'rails_helper'
require 'devise'


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
