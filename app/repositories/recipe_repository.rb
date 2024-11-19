module Repositories
  class RecipeRepository
    def self.search(query, column, direction)
      if query.present?
        if column.present?
          Recipe.search_and_sort(query, column, direction)
        else
          Recipe.search(query)
        end
      else
        if column.present?
          Recipe.all.limit(Pagy::DEFAULT[:items]).order("#{column} #{direction}")
        else
          Recipe.all.limit(Pagy::DEFAULT[:items])
        end
      end
    end
  end
end
