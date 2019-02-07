class CategoriesController < ApplicationController
    def index
      @categories = Category.all
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        if @category.save
          flash[:success] = "Category successfully created"
          redirect_to @category
        else
          flash[:alert] = "Category has not been created"
          render 'new'
        end
    end

    def show
        @category = Category.find(params[:id])
    end
    

private

def category_params
    params.require(:category).permit(:name)
end
    
    
end
