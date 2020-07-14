class TagsController < ApplicationController

    def new 
        if params[:list_id] && !List.exists?(params[:list_id])
            redirect_to lists_path, alert: "List not found."
        else 
            @list = current_user.lists.find_by(id: params[:list_id])
            @tag = @list.tags.build
        end    
    end  

    def create
        @list = current_user.lists.find_by(id: params["list_id"].to_i)
        @tag = @list.tags.create(tag_params)
        if @tag.save
            redirect_to @list
        else 
            render :new 
        end
    end 

    def edit 
        @tag = Tag.find(params[:id])
    end 

    def update 
        @tag = Tag.find(params[:id])

        @tag.update(tag_params)

        if @tag.save
            redirect_to list_path
        else 
            render :edit
        end 
    end 

    def destroy 
        @tag = Tag.find(params[:id])
        @tag.destroy
        flash[:notice] = "Tag Deleted"
        redirect_to list_path

    end 

    private 

    def tag_params 
        params.require(:tag).permit(:title)
    end 
end
