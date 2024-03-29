class PostImage < ApplicationRecord

  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :view_counts, dependent: :destroy

   # 非公開
  scope :unpublished, -> {where(is_published_flag: true)}
  # 公開
  scope :published, -> {where(is_published_flag: false)}

  has_one_attached :image

  validates :title, presence: true, length: { maximum: 20 }
  validates :caption, presence: true, length: { maximum: 120 }
  validates :image, presence: true


  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
   image
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.looks(searches, words)
    if searches == "perfect_match"
      @post_image = PostImage.where(['title LIKE(?) OR caption LIKE(?)',"%#{words}%","%#{words}%"])
    else
      @post_image = PostImage.where(['title LIKE(?) OR caption LIKE(?)',"%#{words}%","%#{words}%"])
    end
  end

end
