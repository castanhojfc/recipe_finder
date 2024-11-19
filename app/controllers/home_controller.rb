require_relative "../repositories/recipe_repository.rb"

class HomeController < ApplicationController
  include Repositories

  def index
    @pagy, @recipes = pagy(RecipeRepository.search(params[:query], params[:column], params[:direction]))
    @pagy.series
  end
end
