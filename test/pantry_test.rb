require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require './lib/pantry'

class PantryTest < Minitest::Test

  def setup
    @pantry = Pantry.new
  end

  def test_it_exists
    assert_instance_of Pantry, @pantry
  end

  def test_it_starts_with_empty_hash_for_stock
    expected = {}
    assert_equal expected, @pantry.stock
  end

  def test_it_returns_zero_for_stock_check_if_ingredient_not_stocked
    cheese = Ingredient.new("Cheese", "C", 50)

    assert_equal 0, @pantry.stock_check(cheese)
  end

  def test_it_can_restock_ingredient_with_amount
    cheese = Ingredient.new("Cheese", "C", 50)
    mac = Ingredient.new("Macaroni", "oz", 200)
    @pantry.restock(cheese, 5)
    @pantry.restock(cheese, 10)
    @pantry.restock(mac, 10)
    expected = {
                cheese => 15,
                mac => 10
                }

  assert_equal expected, @pantry.stock
  assert_equal 15, @pantry.stock_check(cheese)
  assert_equal 10, @pantry.stock_check(mac)
  end

  def test_it_can_check_if_enough_ingredients_to_make_recipe
    cheese = Ingredient.new("Cheese", "C", 50)
    mac = Ingredient.new("Macaroni", "oz", 200)
    mac_and_cheese = Recipe.new("Mac and Cheese")
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)
    @pantry.restock(cheese, 5)

    assert_equal false, @pantry.enough_ingredients_for?(mac_and_cheese)

    @pantry.restock(mac, 7)

    assert_equal false, @pantry.enough_ingredients_for?(mac_and_cheese)

    @pantry.restock(mac, 1)

    assert_equal true, @pantry.enough_ingredients_for?(mac_and_cheese)
  end
end
