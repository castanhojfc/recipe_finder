require "test_helper"
require_relative "../../app/repositories/recipe_repository.rb"

class RecipeRepositoryTest < ActiveSupport::TestCase
  include Repositories

  test "search returns recipes matching the query" do
    query = "Bread"

    result = RecipeRepository.search(query, nil, nil)

    assert_includes result.map(&:title), "Diana's Hawaiian Bread Rolls"
    assert_includes result.map(&:title), "Whole Wheat Beer Bread"
    assert_includes result.map(&:title), "Monkey Bread I"
    assert_includes result.map(&:title), "Banana Banana Bread"
    assert_includes result.map(&:title), "Brooklyn Style Pizza Dough"
  end

  test "search sorts recipes by the specified column and direction" do
    query = "Bread"
    column = "title"
    direction = "asc"

    result = RecipeRepository.search(query, column, direction)

    assert_includes result[0].title, "Banana Banana Bread"
    assert_includes result[1].title, "Brooklyn Style Pizza Dough"
    assert_includes result[2].title, "Diana's Hawaiian Bread Rolls"
    assert_includes result[3].title, "Monkey Bread I"
    assert_includes result[4].title, "Whole Wheat Beer Bread"
  end

  test "search returns all recipes sorted by column and direction when no query is present" do
    Pagy::DEFAULT[:items] = 5
    column = "title"
    direction = "desc"

    result = RecipeRepository.search(nil, column, direction)

    assert_includes result[0].title, "Winter Squash Rolls"
    assert_includes result[1].title, "Whole Wheat Beer Bread"
    assert_includes result[2].title, "To Die For Blueberry Muffins"
    assert_includes result[3].title, "Quick and Easy Pizza Crust"
    assert_includes result[4].title, "Monkey Bread I"
  end

  test "search returns first found recipes when no query and no sorting is present limited by the page size" do
    Pagy::DEFAULT[:items] = 5

    result = RecipeRepository.search(nil, nil, nil)

    assert_includes result[0].title, "Golden Sweet Cornbread"
    assert_includes result[1].title, "Monkey Bread I"
    assert_includes result[2].title, "Whole Wheat Beer Bread"
    assert_includes result[3].title, "Winter Squash Rolls"
    assert_includes result[4].title, "Homemade Flour Tortillas"
  end
end
