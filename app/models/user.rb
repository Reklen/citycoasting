class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :evaluations, class_name: "RSEvaluation", as: :source
  has_reputation :votes, source: {reputation: :votes, of: :stamps}, aggregated_by: :sum
  
  #FB LOGIN
  # def self.from_omniauth(auth)
  #   where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
  #     user.provider = auth.provider
  #     user.uid = auth.uid
  #     user.name = auth.info.name
  #     user.oauth_token = auth.credentials.token
  #     user.oauth_expires_at = Time.at(auth.credentials.expires_at)
  #     user.save!
  #   end
  # end
  
  def voted_for?(stamp)
    evaluations.where(target_type: stamp.class, target_id: stamp.id).present?
  end

  def role?
    role
	end

  def up_voted_for?(item)
    eval = evaluations.where(target_type: item.class, target_id: stamp.id).first
    eval.present? && eval.value < 0 ? true : false
  end

  def down_voted_for?(stamp)
    eval = evaluations.where(target_type: stamp.class, target_id: stamp.id).first
    eval.present? && eval.value <= 0 ? true: false
  end
  has_many :stamps

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true

end
