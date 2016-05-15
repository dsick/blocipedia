require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:title) {Faker::Lorem.words}
  let(:body) {Faker::Lorem.paragraph}
  let(:private) {false}


  let(:user) { create(:user) }
  let(:wiki) { create(:wiki) }
 
  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_presence_of(:private) }
  it { is_expected.to validate_presence_of(:user) }

end
