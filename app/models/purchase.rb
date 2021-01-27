class Purchase < ApplicationRecord
  attr_accessor :token
  validates :token, presence: true
  
  with_options presence: {message: "を入力してください"} do
    validates :pos_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "は半角数字で-(ハイフン)を含めて入力してください" }
    validates :region_id
    validates :city
    validates :numbering
    validates :tel_number, format: { with: /\A[a-zA-Z0-9]+\z/, message: "は半角数字で入力してください"}
  end
end