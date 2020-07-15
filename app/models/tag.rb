class Tag < ApplicationRecord
    has_many :lists_tags 
    has_many :lists, through: :lists_tags

    scope :search_tags, ->(tag) { where("title == ?", tag)}
end
