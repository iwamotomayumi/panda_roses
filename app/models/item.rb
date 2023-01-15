class Item < ApplicationRecord

  has_one_attached :image

   ## 消費税を求めるメソッド
  def add_tax_price
      (self.price * 1.10).round
  end

  validates :image, presence: true
  validates :name, presence: true, length: { maximum: 20 }
  validates :introduction, presence: true, length: { maximum: 120 }
  validates :price, numericality: {
      greater_than_or_equal_to: 100,
      less_than: 100000
    }

end
