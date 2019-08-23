class LikeController < ApplicationController
    before_action :authenticate_user!

    def create
        puts params.inspect
        # @like = current_user.likes.new(like_params)
        # @like.save

        # respond_to do |format|
        #     format.json { render json: @like }
        # end
    end


    def destroy
        @like = Like.find(like_destroy_params)
        @like.destroy
        puts @like.inspect

        respond_to do |format|
            format.json { render json: @like }
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
