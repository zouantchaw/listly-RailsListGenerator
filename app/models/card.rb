class Card < ApplicationRecord
    belongs_to :list

    def self.delete_list_cards(cards)
        cards.each {|card| card.destroy}
    end 
end
