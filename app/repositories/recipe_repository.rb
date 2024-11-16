module Repositories
  class RecipeRepository
    def self.search(query)
      if query.present?
        Recipe.search(query)
      else
        # Gets recipes stored sequencially from a random offset location
        random_offset = rand(Recipe.count)

        Recipe.offset(random_offset)
      end
    end
  end
end
