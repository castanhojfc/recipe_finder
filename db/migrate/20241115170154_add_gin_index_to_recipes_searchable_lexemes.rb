class AddGinIndexToRecipesSearchableLexemes < ActiveRecord::Migration[8.0]
  disable_ddl_transaction!

  def change
    add_index :recipes, :searchable_lexemes, using: :gin, algorithm: :concurrently
  end
end
