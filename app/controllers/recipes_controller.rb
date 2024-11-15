class RecipesController < ApplicationController
  # GET /recipes
  def index
    query = params[:query]

    if query.present?
      @pagy, @recipes = pagy(Recipe.search(query))
    else
      # Gets recipes stored sequencially from a random offset location
      random_offset = rand(Recipe.count)

      @pagy, @recipes = pagy(Recipe.offset(random_offset))
    end
  end
end
