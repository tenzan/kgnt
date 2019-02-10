class PostsController < ApplicationController
    before_action :set_category

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
