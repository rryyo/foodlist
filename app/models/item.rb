class Item < ApplicationRecord
  belongs_to :user

  validates :menu, presence: true, length: { maximum: 255 }
  validates :category, presence: true, length: { maximum: 255 }
  validates :comment, presence: true, length: { maximum: 255 }
  validates :image, presence: true, length: { maximum: 255 }
end
