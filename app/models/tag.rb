class Tag < ApplicationRecord
    validates :type, :value, presence: true

    has_many :character_tags
    has_many :characters, through: :character_tags
end