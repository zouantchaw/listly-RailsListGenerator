class List < ApplicationRecord
    belongs_to :user 
    has_many :cards 
    has_many :lists_tags
    has_many :tags, through: :lists_tags
end
