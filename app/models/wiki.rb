class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators 

  has_many :collaborating_users, through: :collaborators, source: :user
  validates :title, presence: true
  validates :body,  presence: true
  #validates :private, presence: true
  validates :user, presence: true

  def collaborator_for(user_id)
    collaborators.find_by(user_id: user_id)
  end

end

