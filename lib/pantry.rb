class Pantry

  attr_reader :stock

  def initialize
    @stock = Hash.new{0}
  end

  def stock_check(ingredient)
    if @stock.key?(ingredient) == true
      @stock[ingredient]
    elsif @stock.key?(ingredient) == false
      0
    end
  end

  def restock(ingredient, amount)
    @stock[ingredient] += amount
  end

  def check_for_ingredients(recipe)
    recipe.ingredients.map do |ingredient|
      if stock_check(ingredient) >= recipe.amount_required(ingredient)
        true
      else
        false
      end
    end
  end

  def enough_ingredients_for?(recipe)
    checked_ingredients = check_for_ingredients(recipe)
    if checked_ingredients.include?(false)
      false
    else
      true
    end
  end

end
