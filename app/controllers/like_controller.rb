class LikeController < ApplicationController
    # before_action :authenticate_user!

    def create
        if current_user.likes.count < 2
            @like = current_user.likes.new(like_params)
            @like.save
        
            respond_to do |format|
                #JSON StatuS 200
                format.json { render json: @like }
                format.js
            end
        else
            respond_to do |format|
                format.json { render json: @like }
                format.js
                # status ok but nao gravou
            
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

    # respond_to do |format|
    #     format.js { :location => path_to_controller_method_url(argument) }
    # end

    private
        def like_params
            params.require(:like).permit(:api_key)
        end

        def like_destroy_params
            params.require(:id)
        end
end
