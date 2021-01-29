class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item, dependent: :destroy

  validates :text, presence: true
end
