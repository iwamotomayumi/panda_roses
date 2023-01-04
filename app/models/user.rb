class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

 # 自分がフォローされる（被フォロー）側の関係性
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 被フォロー関係を通じて参照→自分をフォローしている人
  has_many :followers, through: :reverse_of_relationships, source: :follower

  # 自分がフォローする（与フォロー）側の関係性
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # 与フォロー関係を通じて参照→自分がフォローしている人
  has_many :followings, through: :relationships, source: :followed

  has_one_attached :profile_image

  def get_profile_image(width, height)
   unless profile_image.attached?
     file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      profile_image.attach(io: File.open(file_path), filename: 'no_image.jpeg', content_type: 'image/jpeg')
   end
   profile_image.variant(resize_to_limit: [width, height]).processed
  end

  #フォローした時の処理
  def follow(user_id)
   relationships.create(followed_id: user_id)
  end
  #フォローを外す時の処理
  def unfollow(user_id)
   relationships.find_by(followed_id: user_id).destroy
  end
  #フォローしているか判定
  def following?(user)
   followings.include?(user)
  end

end
