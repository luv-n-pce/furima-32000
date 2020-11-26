class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :postage_payer
  belongs_to :prefecture_code
  belongs_to :preparation_day

  validates :name, presence :true, length: { maximum: 40 }
  validates :introduction, presence :true, length: { maximum: 1000 }
  validates :category_id, presence :true, numericality: { other_than: 1 } 
  validates :item_condition_id, presence :true, numericality: { other_than: 1 } 
  validates :postage_payer_id, presence :true, numericality: { other_than: 1 } 
  validates :prefecture_code_id, presence :true, numericality: { other_than: 1 } 
  validates :preparation_day_id, presence :true, numericality: { other_than: 1 } 
  validates :price, presence :true
  
end
