class HomeController < ApplicationController
  include Repositories

  def index
    @pagy, @recipes = pagy(RecipeRepository.search(params[:query]))
  end
end
