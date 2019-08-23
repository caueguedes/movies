class CoreController < ApplicationController
    before_action :authenticate_user!

    def home
        @movies = Swapi.fetchAll
        @likes = {}
        current_user.likes.as_json.map { |x| @likes[x["api_key"]] = x }
        # @likes = @likes.map { |x| x["api_key"]}
       end
    
      def ranking
        @movies = Swapi.fetchAll
      end
    
      def details
      #   @details = Swapi.fetch(params[:id])
      end
end
