class LikeController < ApplicationController
    before_action :authenticate_user!

    def create
        if current_user.likes.count < 2
            @like = current_user.likes.new(like_params)
            @like.save
        end
        respond_to do |format|
            format.js            
    end

    def destroy
        @like = current_user.likes.where("api_key": like_destroy_params).first
        @like.destroy
        respond_to do |format| 
            format.js 
        end
    end

    private
        def like_params
            params.require(:like).permit(:api_key)
        end

        def like_destroy_params
            params.require(:id)
        end
end
