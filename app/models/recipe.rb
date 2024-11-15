class Recipe < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_recipe, against: { title: "A", category: "B", ingredients: "C" },
                  using: {
                    tsearch: {
                      dictionary: "english", tsvector_column: "searchable_lexemes"
                    }
                  }
end
