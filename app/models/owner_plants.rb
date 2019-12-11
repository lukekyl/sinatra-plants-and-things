class OwnerPlant < ActiveRecord::Base
    belongs_to :owner
    belongs_to :plant
end