require 'swapi'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def home
    @movies = Swapi.fetchAll
  end

  def ranking
  end


  # def details
  #   @details = Swapi.fetch(params[:id])
  # end
end
