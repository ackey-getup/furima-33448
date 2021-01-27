class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase_histories

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery
  belongs_to :region
  belongs_to :mean

  with_options presence: true do
    validates :image 
    validates :title 
    validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "価格は半角数字で¥300~¥9,999,999の間で入力してください", with: /\A[0-9]+\z/ }
    validates :explanation
  end

  with_options numericality: { other_than: 1, message: 'を選択してください' } do 
    validates :category_id
    validates :status_id
    validates :delivery_id
    validates :region_id
    validates :mean_id
  end

end