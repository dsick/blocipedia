class User < ActiveRecord::Base
  enum role: [:standard, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :standard
  end
  has_many :wikis, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable


  validates :username, presence: true
  validates :username, uniqueness: true, if: -> { self.username.present? }


  

end
