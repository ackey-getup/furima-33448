class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
 
  validates :nickname, presence: true
  validates :birthday, presence: true

  with_options presence: true, format: {with: /\A[ぁ-ん ァ-ヶー-龥々]+\z/, message: '全角文字を使用してください' } do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: {with: /\A[ァ-ヶ]+\z/, message: 'カタカナで入力してください' } do
    validates :last_name_kana,  presence: true
    validates :first_name_kana, presence: true
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて6文字以上で設定してください' 
end
