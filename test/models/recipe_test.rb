require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  setup do
    @golden_sweet_cornbread = recipes(:golden_sweet_cornbread)
    @monkey_bread_i = recipes(:monkey_bread_i)
  end

  test "search by title returns correct recipe" do
    query = "Golden Sweet Cornbread"
    result = Recipe.search(query)

    assert_includes result, @golden_sweet_cornbread
    assert_not_includes result, @monkey_bread_i
  end
end
