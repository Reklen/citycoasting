class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :evaluations, class_name: "RSEvaluation", as: :source
  has_reputation :votes, source: {reputation: :votes, of: :stamps}, aggregated_by: :sum

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => ActionController::Base.helpers.asset_path('default_profile.svg')
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  
  acts_as_followable
  acts_as_follower

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(name:auth.extra.raw_info.name,
                            provider:auth.provider,
                            uid:auth.uid,
                            email:auth.info.email,
                            password:Devise.friendly_token[0,20],
                            username:auth.info.name,
                            image: ("https://graph.facebook.com/#{auth.uid}/picture?height=300&width=300" if auth.info.image?)
                          )
      end    
    end
  end
  
  def voted_for?(stamp)
    evaluations.where(target_type: stamp.class, target_id: stamp.id).present?
  end

  def role?
    role
	end

  def up_voted_for?(stamp)
    eval = evaluations.where(target_type: stamp.class, target_id: stamp.id).first
    eval.present? && eval.value > 0 ? true : false
  end

  def down_voted_for?(stamp)
    eval = evaluations.where(target_type: stamp.class, target_id: stamp.id).first
    eval.present? && eval.value <= 0 ? true: false
  end


  has_many :stamps
  validates :name, presence: true
  validates :username, presence: true, uniqueness: true

end
