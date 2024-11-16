module Repositories
  class RecipeRepository
    def self.search(query)
      if query.present?
        Recipe.search(query)
      else
        Recipe.all.limit(Pagy::DEFAULT[:items])
      end
    end
  end
end
