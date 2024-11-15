class AddSearchFieldToRecipes < ActiveRecord::Migration[8.0]
  def up
    add_column :recipes, :searchable_lexemes, :tsvector

    reversible do |dir|
      dir.up do
        execute <<-SQL
          UPDATE recipes
          SET searchable_lexemes = (
            setweight(to_tsvector('english', coalesce(title, '')), 'A') ||
            setweight(to_tsvector('english', coalesce(category, '')), 'B') ||
            setweight(to_tsvector('english', coalesce(array_to_string(ingredients, ' '), '')), 'C')
          );
        SQL
      end
    end
  end

  def down
    remove_column :recipes, :searchable_lexemes
  end
end
