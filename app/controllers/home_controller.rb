require_relative "../repositories/recipe_repository.rb"

class HomeController < ApplicationController
  include Repositories

  def index
    @pagy, @recipes = pagy(RecipeRepository.search(params[:query]))
    @pagy.series
  end
end
