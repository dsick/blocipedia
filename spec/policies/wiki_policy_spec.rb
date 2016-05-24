require "rails_helper"


describe WikiPolicy do
  let(:user) {create(:user, role: 'standard')}
  subject { described_class }

  let(:wiki) { FactoryGirl.create(:wiki, user: user) }

  permissions :show? do
    it "allow access if no user" do
      expect(subject).to permit(nil, wiki)
    end
    it "allow access if user present" do
      expect(subject).to permit(user, wiki)
    end
  end


  permissions :update?, :edit?, :create?, :destroy? do
    it "denies access if no user" do
      expect(subject).not_to permit(nil, wiki)
    end
    it "allow access if user present" do
      expect(subject).to permit(user, wiki)
    end
  end
end

  