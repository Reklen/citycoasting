class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :evaluations, class_name: "RSEvaluation", as: :source
  has_reputation :votes, source: {reputation: :votes, of: :stamps}, aggregated_by: :sum
  

  def voted_for?(stamp)
    evaluations.where(target_type: stamp.class, target_id: stamp.id).present?
  end

  def role?
    role
	end
  has_many :stamps

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true

end
