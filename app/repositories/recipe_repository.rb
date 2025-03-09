module Repositories
  class RecipeRepository
    def self.search(query, column, direction)
      if query.present?
        scope = Recipe.search(query)

        if sorting_params_present?(column, direction)
          scope = scope.reorder("#{column} #{direction}")
        end
      else
        scope = Recipe.all

        if sorting_params_present?(column, direction)
          scope = scope.order("#{column} #{direction}")
        end
      end

      scope.limit(Pagy::DEFAULT[:items])
    end

    private

    def self.sorting_params_present?(column, direction)
      column.present? and direction.present?
    end
  end
end
