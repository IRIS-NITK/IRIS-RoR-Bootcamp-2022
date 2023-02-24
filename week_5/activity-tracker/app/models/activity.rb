class Activity < ApplicationRecord
  belongs_to :user
  validates :calories, numericality: { only_integer: true }
  has_one_attached :image
end
