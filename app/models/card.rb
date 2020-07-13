class Card < ApplicationRecord
    belongs_to :list
    has_many :cards_lists

    def self.delete_list_cards(cards)
        cards.each {|card| card.destroy}
    end 
end
