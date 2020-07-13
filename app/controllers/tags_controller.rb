class TagsController < ApplicationController
    def show 

    end 

    def new 
        binding.pry
    end 

    def create

    end 

    private 

    def tag_params 
        params.require(:tag).permit(:title)
    end 
end
