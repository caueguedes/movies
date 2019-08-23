class LikeController < ApplicationController
    before_action :authenticate_user!

    def create
        if current_user.likes.count < 2
            @like = current_user.likes.new(like_params)
            @like.save
        

        # format.json { render :show, status: :created, location: @post }
            respond_to do |format|
                format.js 
            end
        else
            respond_to do |format|
                format.json { render json: @like.errors, status: 400 }
                # format.js            
            end
        end
    end

    def destroy
        @like = current_user.likes.where("api_key": like_destroy_params).first
        puts @like.inspect
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
