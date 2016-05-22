require "rails_helper"


describe WikiPolicy do
  let(:user) {create (:user)}
  subject { WikiPolicy.new(:user, wiki) }

  context "for a user" do

    context "creating a new wiki" do
      let(:wiki) { Wiki.new }

      it { should     permit(:new)    }
      it { should     permit(:create) }
    end
  end
end
