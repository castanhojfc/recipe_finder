require "test_helper"
require_relative "../../app/repositories/recipe_repository.rb"

class HomeControllerTest < ActionDispatch::IntegrationTest
  include Repositories

  setup do
    @golden_sweet_cornbread = recipes(:golden_sweet_cornbread)
    @monkey_bread_i = recipes(:monkey_bread_i)
    @valid_query = "Golden Sweet Cornbread"
    @non_existent_query = "nonexistentrecipe"
  end

  test "should get recipes with search query" do
    get root_url, params: { query: @valid_query }

    assert_response :success

    assert_match @golden_sweet_cornbread.title, @response.body
    assert_no_match @monkey_bread_i.title, @response.body
  end

  test "should get recipes with no match for search query" do
    get root_url, params: { query: @non_existent_query }

    assert_response :success

    assert_no_match @golden_sweet_cornbread.title, @response.body
    assert_no_match @monkey_bread_i.title, @response.body
  end
end
