class PostsController < ApplicationController
    before_action :set_category
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    def new
        @post = @category.posts.build
    end

    def create
        @post = @category.posts.build(post_params)
      
        if @post.save
          flash[:notice] = "Post has been created."
          redirect_to [@category, @post]
        else
          flash.now[:alert] = "Post has not been created."
          render "new"
        end
    end

    def show
    end

    def edit
    end

    def update
      if @post.update(post_params)
        flash[:notice] = "Post has been updated."
        redirect_to [@category, @post]
      else
        flash.now[:alert] = "Post has not been updated."
        render "edit"
      end
    end

    def destroy
      @post.destroy
      flash[:notice] = "Post has been deleted."
    
      redirect_to @category
    end
    
    private

    def post_params
        params.require(:post).permit(:title, :description, :location, :price, :currency, :phone, :purpose)
    end

    def set_category
      @category = Category.find(params[:category_id])
    end

    def set_post
        @post = @category.posts.find(params[:id])
    end
end
