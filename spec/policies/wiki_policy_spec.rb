require "rails_helper"


describe WikiPolicy do
  let(:user) {create(:user, role: 'standard')}
  subject { described_class }

  let(:wiki) { FactoryGirl.create(:wiki, user: user) }

  permissions :update?, :edit? do
    it "denies access if no user" do
      expect(subject).not_to permit(nil, wiki)
    end
    it "allow access if user present" do
      expect(subject).to permit(user, wiki)
    end
  end

  context "context for no user" do
    let(:user) {nil}
    

    it { should     ppermit(:index)   }
    it { should     ppermit(:show)    }
    it { should_not permit(:new)     }
    it { should_not permit(:create)  }
    it { should_not permit(:edit)    }
    it { should_not permit(:update)  }
    it { should_not permit(:destroy) }
  end

  context "context for no user" do
    let(:user) {create (:user)}
    let(:wiki) { Wiki.new }

    it { should     permit(:index)   }
    it { should     permit(:show)    }
    it { should     permit(:new)     }
    it { should     permit(:create)  }
    it { should     permit(:edit)    }
    it { should     permit(:update)  }
    it { should     permit(:destroy) }
  end
end
