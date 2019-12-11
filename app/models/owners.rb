class Owner < ActiveRecord::Base
    validates :email, presence: true, uniqueness: true

    has_secure_password
    has_many :owner_plants
    has_many :plants, through: :owner_plants
    has_many :comments 
end