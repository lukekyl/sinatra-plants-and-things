class Plant < ActiveRecord::Base
    validates :name, presence: true, uniqueness: true

    belongs_to :owners
    has_many :owners
    has_many :comments
end