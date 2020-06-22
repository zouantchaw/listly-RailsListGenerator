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

    def edit 
        binding.pry
        if params[:list_id]
            list = current_user.lists.find_by(id: params[:list_id])
            if list.nil?
                redirect_to lists_path, alert: "List not Found."
            else
                @card = list.cards.find_by(id: params[:id])
                redirect_to list_cards_path(list), alert: "Post not found." if @card.nil?
            end
        else 
            @card = Card.find(params[:id]) #I dont need this. I should def take it out.
        end 
        @card = list.cards.find_by(id: params[:id])
    end 

    def update
        @card = Card.find(params[:id])

        @card.update(card_params)

        if @card.save
            redirect_to @card 
        else
            render :edit 
        end
    end 


    private 

    def card_params 
        params.require(:card).permit(:body, :list_id)
    end 
end
