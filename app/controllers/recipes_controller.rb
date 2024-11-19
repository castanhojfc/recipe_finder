require_relative "../repositories/recipe_repository.rb"

class RecipesController < ApplicationController
  include Repositories

  # GET /recipes
  def index
    @pagy, @recipes = pagy(RecipeRepository.search(params[:query], params[:column], params[:direction]))
  end
end
