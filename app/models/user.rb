class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def role?
    role
	end
  has_many :stamps

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true

end
