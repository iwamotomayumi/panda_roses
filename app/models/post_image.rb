class PostImage < ApplicationRecord

  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_one_attached :image

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
   image.variant(resize_to_limit: [width, height]).processed
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
