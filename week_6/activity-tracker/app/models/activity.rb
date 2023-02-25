class Activity < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    validates :image, presence: true
    validates :calories, numericality: { 
        only_integer: true, 
        message: "only integer value"
    }
    validates :duration, numericality: { 
        only_integer: true, 
        message: "only integer value"
    }
end
