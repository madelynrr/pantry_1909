require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'

class RecipeTest < Minitest::Test

  def setup
    @recipe = Recipe.new("Mac and Cheese")
  end

  def test_it_exists
    assert_instance_of Recipe, @recipe
  end

  def test_it_has_attributes
    assert_equal "Mac and Cheese", @recipe.name
  end

  def test_it_starts_with_empty_hash_for_required_ingredients
    expected = {}
    assert_equal expected, @recipe.ingredients_required
  end

  def test_it_can_add_ingredients
    cheese = Ingredient.new("Cheese", "C", 100)
    mac = Ingredient.new("Macaroni", "oz", 30)
    @recipe.add_ingredient(cheese, 2)
    @recipe.add_ingredient(mac, 8)

    expected = {
                cheese => 2,
                mac => 8
                }

    assert_equal expected, @recipe.ingredients_required
  end

  def test_it_gives_amount_required_for_each_ingredient
    cheese = Ingredient.new("Cheese", "C", 100)
    mac = Ingredient.new("Macaroni", "oz", 30)
    @recipe.add_ingredient(cheese, 2)
    @recipe.add_ingredient(mac, 8)

    assert_equal 2, @recipe.amount_required(cheese)
    assert_equal 8, @recipe.amount_required(mac)
  end

  def test_it_lists_ingredients
    assert_equal [], @recipe.ingredients

    cheese = Ingredient.new("Cheese", "C", 100)
    mac = Ingredient.new("Macaroni", "oz", 30)
    @recipe.add_ingredient(cheese, 2)
    @recipe.add_ingredient(mac, 8)

    assert_equal [cheese, mac], @recipe.ingredients
  end

  def test_it_calculates_total_calories
    cheese = Ingredient.new("Cheese", "C", 100)
    mac = Ingredient.new("Macaroni", "oz", 30)
    @recipe.add_ingredient(cheese, 2)
    @recipe.add_ingredient(mac, 8)

    assert_equal 440, @recipe.total_calories
  end
end
