require "application_system_test_case"

class HomeTest < ApplicationSystemTestCase
  setup do
    @golden_sweet_cornbread = recipes(:golden_sweet_cornbread)
    @monkey_bread_i = recipes(:monkey_bread_i)
    @whole_wheat_beer_bread = recipes(:whole_wheat_beer_bread)
    @winter_squash_rolls = recipes(:winter_squash_rolls)
    @homemade_flour_tortillas = recipes(:homemade_flour_tortillas)
    @brooklyn_style_pizza_dough = recipes(:brooklyn_style_pizza_dough)
    @dianas_hawaiian_bread_rolls = recipes(:dianas_hawaiian_bread_rolls)
    @banana_banana_bread = recipes(:banana_banana_bread)
    @to_die_for_blueberry_muffins = recipes(:to_die_for_blueberry_muffins)
    @breakfast_pull_apart_bacon_and_egg_bread = recipes(:breakfast_pull_apart_bacon_and_egg_bread)
    @quick_and_easy_pizza_crust = recipes(:quick_and_easy_pizza_crust)
    @banana_muffins_ii = recipes(:banana_muffins_ii)
  end

  test "shows the search form" do
    visit root_path
    assert_selector "input[placeholder='What do you have available at home? (ex: banana coffee bread...)']"
    assert_button "Submit"
    assert_button "Clear"
  end

  test "finds recipe with several ingredients in the query" do
    visit root_path

    fill_in "query", with: "flour sugar"
    click_on "Submit"

    assert_selector "img[src='#{@golden_sweet_cornbread.image}']"
    assert_text "Golden Sweet Cornbread"
    assert_text "25"
    assert_text "10"
    @golden_sweet_cornbread.ingredients.each do |ingredient|
      assert_text ingredient
    end
    assert_text "4.74"
    assert_text "Cornbread"
    assert_text "bluegirl"
  end

  test "shows no recipes found message when non-existent ingredients are used" do
    visit root_path

    fill_in "query", with: "nonexistent ingredient"
    click_on "Submit"

    assert_text "Hoah! No recipes found. Try adjusting your search! Watchout for typos. Ingredients should be separated with white spaces."
  end

  test "clears the search form" do
    visit root_path

    fill_in "query", with: "pasta tomato"
    click_on "Clear"

    assert_field "query", with: ""
    assert_no_text "Pasta with Tomato Sauce"
  end

  test "pagination works correctly, if applicable" do
    visit root_path

    assert_text "Golden Sweet Cornbread" # Recipe 1
    assert_text "Breakfast Pull-Apart Bacon and Egg Bread" # Recipe 10

    click_on ">"
    assert_no_text "Golden Sweet Cornbread"
    assert_text "Quick and Easy Pizza Crust" # Recipe 11
  end
end
