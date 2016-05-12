require "rails_helper"


RSpec.describe WikiPolicy, type: :policy do
  subject { WikiPolicy.new(user, wiki) }
  let(:title) {Faker::Lorem.sentence.titleize}
  let(:body) {Faker::Lorem.paragraph}
  let(:private) {false}


  let(:user) { create(:user) }

  let(:wiki) { create(:wiki) }


  context "for a visitor" do
    let(:user) { nil }


    it { should     permit(:show)    }

    it { should_not permit(:create)  }
    it { should_not permit(:new)     }
    it { should_not permit(:update)  }
    it { should_not permit(:edit)    }
    it { should_not permit(:destroy) }
  end

  context "for a user" do
    let(:user) { create(:user) }
    it { should permit(:show)    }
    it { should permit(:create)  }
    it { should permit(:new)     }
    it { should permit(:update)  }
    it { should permit(:edit)    }
    it { should permit(:destroy) }
  end
end
