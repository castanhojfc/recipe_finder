module Repositories
  class RecipeRepository
    def self.search(query, column, direction)
      if query.present?
        column.present? ? Recipe.search_and_sort(query, column, direction) : Recipe.search(query)
      else
        scope = Recipe.all
        scope = scope.order("#{column} #{direction}") if column.present?

        scope.limit(Pagy::DEFAULT[:items])
      end
    end
  end
end
