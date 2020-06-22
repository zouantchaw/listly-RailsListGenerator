class ListsController < ApplicationController

    def index 
        @lists = current_user.lists
    end 

    def show 
        @list = current_user.lists.find(params[:id])
        @cards = @list.cards 
    end 

    def new 
        @list = current_user.lists.build
    end 

    def create 
        @list = current_user.lists.create(list_params)

        if @list.save
            redirect_to @list
        else 
            render :new
        end 
    end 

    def edit 
        @list = current_user.lists.find(params[:id])
    end 

    def update 
        @list = current_user.lists.find(params[:id])
        @list.update(list_params)
        if @list.save 
            redirect_to @list 
        else 
            render :edit 
        end 
    end 

    def destroy 
        @list = current_user.lists.find(params[:id])
        #@list.cards.destroy this doesnt work so im going to create a delete_list_cards method in the Cards controller to handle that job
        Card.delete_list_cards(@list.cards)
        @list.destroy 
        flash[:notice] = "List deleted."
        redirect_to lists_path
    end 

    private 

    def list_params
        params.require(:list).permit(:title)
    end 
end
