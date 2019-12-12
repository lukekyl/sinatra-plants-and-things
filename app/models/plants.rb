class Plant < ActiveRecord::Base
    validates :name, presence: true, uniqueness: true

    has_many :owner_plants
    has_many :owners, through: :owner_plants
    has_many :comments
end