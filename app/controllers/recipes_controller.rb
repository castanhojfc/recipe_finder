class RecipesController < ApplicationController
  MAX_RECIPES = 10

  # GET /recipes
  def index
    query = params[:query]

    if query.present?
      @recipes = Recipe.search(query).first(MAX_RECIPES)
    else
      # Gets recipes stored sequencially from a random offset location
      random_offset = rand(Recipe.count)

      @recipes = Recipe.offset(random_offset).first(MAX_RECIPES)
    end
  end
end
