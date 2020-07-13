class List < ApplicationRecord
    belongs_to :user 
    has_many :cards 
    has_many :cards_lists
end
