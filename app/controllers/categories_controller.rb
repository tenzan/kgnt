class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :destroy]
    
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
    end

    def edit
    end

    def update
        if @category.update(category_params)
          flash[:notice] = "Category was successfully updated"
          redirect_to @category
        else
          flash[:error] = "Category has not been updated"
          render 'edit'
        end
    end

    def destroy
        @category = Category.find(params[:id])
        @category.destroy
      
        flash[:notice] = "Category has been deleted."
        redirect_to categories_path
    end    

private

    def category_params
        params.require(:category).permit(:name)
    end

    def set_category
        @category = Category.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        flash[:alert] = "The category you were looking for could not be found."
        redirect_to categories_path
    end
    
end
