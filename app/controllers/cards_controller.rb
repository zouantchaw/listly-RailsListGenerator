class CardsController < ApplicationController

    def show 
        @card = current_user.cards.find(params[:id])
    end 

    def new 
        @card = Card.new(list_id: params[:list_id])
    end 

    def create 
        @card = Card.new(card_params)

        if @card.save
            redirect_to @card.list 
        else
            render :new
        end
    end 

    private 

    def card_params 
        params.require(:card).permit(:body, :list_id)
    end 
end
