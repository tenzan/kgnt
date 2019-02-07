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

    def edit
        @category = Category.find(params[:id])
    end

    def update
        @category = Category.find(params[:id])
        if @category.update(category_params)
          flash[:notice] = "Category was successfully updated"
          redirect_to @category
        else
          flash[:error] = "Category has not been updated"
          render 'edit'
        end
    end
    
    

private

def category_params
    params.require(:category).permit(:name)
end
    
    
end
