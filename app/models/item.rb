class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, presence :true, length: { maximum: 40 }
  validates :introduction, presence :true, length: { maximum: 1000 }
  validates :category_id, presence :true
  validates :item_condition_id, presence :true
  validates :postage_payer_id, presence :true
  validates :prefecture_code_id, presence :true
  validates :preparation_day_id, presence :true
  validates :price, presence :true
  
end
