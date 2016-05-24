require "rails_helper"


describe WikiPolicy do
  let(:user) {create (:user)}
  subject { WikiPolicy.new(user, wiki) }
  let(:title) {Faker::Lorem.sentence.titleize}
  let(:body) {Faker::Lorem.paragraph}
  let(:private) {false}


  context "context for no user" do
    let(:user) {nil}
    let(:wiki) { FactoryGirl.create(:wiki) }

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
