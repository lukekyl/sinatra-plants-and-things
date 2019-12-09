class Comment < ActiveRecord::Base
    validates :reply, presence: true

    belongs_to :owners
    belongs_to :plants
end