class Card < ApplicationRecord
    belongs_to :list

    def self.delete_list_cards(cards)
        binding.pry
        cards.destroy
    end 
end
