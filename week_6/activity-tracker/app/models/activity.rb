class Activity < ApplicationRecord
    belongs_to :user
    validates :calories, numericality: { 
        only_integer: true, 
        message: "only integer value"
    }
    validates :duration, numericality: { 
        only_integer: true, 
        message: "only integer value"
    }
end
