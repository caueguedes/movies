class CoreController < ApplicationController
    before_action :authenticate_user!

    def home
      begin
        @movies = Swapi.fetchAll                
      end
      @likes = {} 
      current_user.likes.as_json.map { |x| @likes[x["api_key"]] = x }
    end
    
    def ranking
      begin
        @movies = {}
        Swapi.fetchAll["results"].as_json.map { |x| @movies[x["episode_id"]] = x }
        @votes = Like.select("likes.api_key, max(created_at) as data, count(*) as votos"
                        ).group("likes.api_key").order("votos desc"
                        ).order("data desc").as_json.map{ |x| x }
      end       
    end
    
    def detail
      begin
        @details = Swapi.fetchDetail(det_params)
      end
    end

    private
    def det_params
      params.require(:id)
    end
end
