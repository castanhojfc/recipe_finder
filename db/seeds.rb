# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require 'json'

RECIPES_SEED_PATH = "./db/recipes-en.json"
logger = Rails.logger

logger.info "Seeding recipes starting..."

# WARNING: Loading an entire file in memory.
begin
  recipe_file_content = File.read(RECIPES_SEED_PATH)
rescue StandardError => e
  puts "Error while opening recipe JSON file. Details: #{e.message}"
end

begin
  recipes = JSON.parse(recipe_file_content)
rescue JSON::NestingError, JSON::ParserError, TypeError => e
  logger.error "Error while parsing recipe JSON file. Details: #{e.message}"
end

if recipes.present?
  begin
    recipes.each do | recipe |
      Recipe.new(
        title: recipe['title'],
        cook_time: recipe['cook_time'],
        prep_time: recipe['prep_time'],
        ingredients: recipe['ingredients'],
        ratings: recipe['ratings'],
        cuisine: recipe['cuisine'],
        category: recipe['category'],
        author: recipe['author'],
        image: URI.decode_www_form_component(recipe['image']).split('=')[1],
      ).save!
    end
  rescue StandardError => e
    logger.error "Error while seeding a recipe. Details: #{e.message}"
  end

  logger.info "Seeding recipes finished successfully!"
end
