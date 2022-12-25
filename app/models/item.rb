class Item < ApplicationRecord

  has_one_attached :image

   ## 消費税を求めるメソッド
  def add_tax_price
      (self.price * 1.10).round
  end

  validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true

end
