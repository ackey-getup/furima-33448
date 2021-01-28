class Order #FormObject
  include ActiveModel::Model
  attr_accessor :pos_code, :region_id, :city, :numbering, :tel_number, :building, :token, :item_id, :user_id
  
  with_options presence: {message: "を入力してください"} do
    validates :token
    validates :pos_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "は半角数字で-(ハイフン)を含めて入力してください" }
    validates :region_id, numericality: { other_than: 1, message: "を選択してください" }
    validates :city
    validates :numbering
    validates :tel_number, format: { with: /\A[a-zA-Z0-9]+\z/, message: "は半角数字で入力してください"}
  end

  def save
    @purchase = PurchaseHistory.create(user_id: user_id, item_id: item_id)
    Purchase.create(pos_code: pos_code, region_id: region_id, city: city, numbering: numbering, building: building, tel_number: tel_number, purchase_history_id: @purchase.id)
  end
end