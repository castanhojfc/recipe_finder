class Recipe < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search,
                against: { title: "A", category: "B", ingredients: "C" },
                using: {
                  tsearch: {
                    dictionary: "english", tsvector_column: "searchable_lexemes"
                    }
                  }

  def self.search_and_sort(query, sort_column, sort_direction)
    allowed_columns = %w[title category number_of_ingredients cook_time prep_time ratings author]
    allowed_directions = %w[asc desc]

    sort_column = allowed_columns.include?(sort_column) ? sort_column : "ratings"
    sort_direction = allowed_directions.include?(sort_direction.downcase) ? sort_direction : "desc"

    search(query).reorder("#{sort_column} #{sort_direction}")
  end
end
