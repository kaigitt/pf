class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:twitter, :google_oauth2]

  attachment :profile_image

  has_many :play_lists, dependent: :destroy
  has_many :play_list_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_play_lists, through: :favorites, source: :play_list
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォロー取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォロワー取得
  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人
  has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy
  has_many :sns
  has_many :messages

  def create_notification_follow!(current_user)
    temp = Notification.where(["visiter_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end

  # ゲストログイン
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'ゲスト'
    end
  end

# 　SNS認証
  def self.from_omniauth(auth)
    sns = Sns.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
       name: auth.info.name,
       email: auth.info.email
   )
  end

  def self.search_user_lists(search)
    return User.all unless search
    User.where(['name LIKE ?',"%#{search}%"])
  end

  def active_for_authentication?
    super && (self.is_deleted == false)
  end

# ユーザーをフォローする
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

# ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

# フォローしていればtrueを返す
  def following?(user)
    following_user.include?(user)
  end
end
