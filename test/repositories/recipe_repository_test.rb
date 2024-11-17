require "test_helper"
require_relative "../../app/repositories/recipe_repository.rb"

class RecipeRepositoryTest < ActiveSupport::TestCase
  include Repositories

  test "search returns recipes matching the query" do
    query = "Bread"

    result = RecipeRepository.search(query)

    assert_includes result.map(&:title), "Diana's Hawaiian Bread Rolls"
    assert_includes result.map(&:title), "Whole Wheat Beer Bread"
    assert_includes result.map(&:title), "Monkey Bread I"
    assert_includes result.map(&:title), "Banana Banana Bread"
    assert_includes result.map(&:title), "Brooklyn Style Pizza Dough"
  end

  test "search returns first found recipes when no query is present limited by the page size" do
    Pagy::DEFAULT[:items] = 10

    result = RecipeRepository.search(nil)

    assert_includes result.map(&:title), "Golden Sweet Cornbread"
    assert_includes result.map(&:title), "Monkey Bread I"
    assert_includes result.map(&:title), "Whole Wheat Beer Bread"
    assert_includes result.map(&:title), "Winter Squash Rolls"
    assert_includes result.map(&:title), "Homemade Flour Tortillas"
    assert_includes result.map(&:title), "Brooklyn Style Pizza Dough"
    assert_includes result.map(&:title), "Diana's Hawaiian Bread Rolls"
    assert_includes result.map(&:title), "Banana Banana Bread"
    assert_includes result.map(&:title), "To Die For Blueberry Muffins"
    assert_includes result.map(&:title), "Breakfast Pull-Apart Bacon and Egg Bread"
    assert_not_includes result.map(&:title), "Quick and Easy Pizza Crust"
    assert_not_includes result.map(&:title), "Banana Muffins II"
  end
end
