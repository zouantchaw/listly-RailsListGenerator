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
        Card.delete_list_cards(@list.cards)
        @list.destroy 
        flash[:notice] = "List deleted."
        redirect_to lists_path
    end 

    def search 
        binding.pry 
        @tag = Tag.find(params[:id])
        @lists = Tag.search_tags(@tag.title).first.lists
    end 

    private 

    def list_params
        params.require(:list).permit(:title)
    end 
end
