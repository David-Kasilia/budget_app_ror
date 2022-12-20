class GroupEntity < ApplicationRecord
    belongs_to :entities 
    belongs_to :groups
end
