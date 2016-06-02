class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators 

  has_many :collaborating_users, through: :collaborators, as: :user
  validates :title, presence: true
  validates :body,  presence: true
  #validates :private, presence: true
  validates :user, presence: true


end



