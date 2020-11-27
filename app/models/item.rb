class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :postage_payer
  belongs_to :prefecture_code
  belongs_to :preparation_day

  with_option presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :introduction, length: { maximum: 1000 }
    validates :price, format: { with: /\A[0-9]+\z/, message: "Half-width number" }, numericality: { only_integer: true, greater_than: 300, less_than: 9999999 }

    with_option numericality: { other_than: 1, message: "Select" } do
      validates :category_id
      validates :item_condition_id
      validates :postage_payer_id
      validates :prefecture_code_id
      validates :preparation_day_id
    end
  end
end
