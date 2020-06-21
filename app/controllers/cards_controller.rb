class CardsController < ApplicationController

    def show 
        @card = current_user.cards.find(params[:id])
    end 

    def new 
        binding.pry 
        @card = current_user.cards
    end 
end
