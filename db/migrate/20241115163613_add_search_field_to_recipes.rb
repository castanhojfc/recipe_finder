class AddSearchFieldToRecipes < ActiveRecord::Migration[8.0]
  def up
    add_column :recipes, :searchable_lexemes, :tsvector

    execute <<-SQL
      CREATE FUNCTION update_searchable_lexemes()
        RETURNS trigger AS $$
        BEGIN
          NEW.searchable_lexemes := setweight(to_tsvector('english', coalesce(NEW.title, '')), 'A') ||
                                  setweight(to_tsvector('english', coalesce(NEW.category, '')), 'B') ||
                                  setweight(to_tsvector('english', coalesce(array_to_string(NEW.ingredients, ' '), '')), 'C');
          RETURN NEW;
        END;
      $$ LANGUAGE plpgsql;

      CREATE TRIGGER update_searchable_lexemes_trigger
      BEFORE INSERT OR UPDATE ON recipes
      FOR EACH ROW
      EXECUTE FUNCTION update_searchable_lexemes();
    SQL
  end

  def down
    remove_column :recipes, :searchable_lexemes

    execute <<-SQL
      DROP TRIGGER IF EXISTS update_searchable_lexemes_trigger ON recipes;
      DROP FUNCTION IF EXISTS update_searchable_lexemes;
    SQL
  end
end
