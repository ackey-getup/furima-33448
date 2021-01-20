class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery
  belongs_to :region
  belongs_to :mean

  validates :image,       presence: { message: "画像を選択してください"}
  validates :title,       presence: { message: "商品名を入力してください"}
  validates :price,       presence: { message: "価格を設定してください"}, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "価格は半角数字で¥300~¥9,999,999の間で入力してください" }
  validates :explanation, presence: { message: "商品の説明文を記載してください"}
  validates :category_id, numericality: { other_than: 1 , message: "カテゴリーを選択してください" }
  validates :status_id,   numericality: { other_than: 1 , message: "商品の状態を選択してください" }
  validates :delivery_id, numericality: { other_than: 1 , message: "配送料の負担を選択してください" }
  validates :region_id,   numericality: { other_than: 1 , message: "発送元の地域を選択してください" }
  validates :mean_id,     numericality: { other_than: 1 , message: "発送までの日数を選択してください" }

end