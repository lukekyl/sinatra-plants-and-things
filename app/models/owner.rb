class Owner < ActiveRecord::Base
    validates :email, presence: true, uniqueness: true

    has_secure_password
    has_many :plants
    has_many :comments
end