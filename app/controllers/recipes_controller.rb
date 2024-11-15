class RecipesController < ApplicationController
  # GET /recipes
  def index
    @recipes = Recipe.all.first(10)

    render json: { recipes: @recipes }
  end
end
