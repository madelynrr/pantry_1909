class Recipe

  attr_reader :name, :ingredients_required, :ingredients

  def initialize(name)
    @name = name
    @ingredients_required = {}
    @ingredients = []
  end

  def add_ingredient(ingredient, amount)
    @ingredients_required[ingredient] = amount
    @ingredients << ingredient
  end

  def amount_required(ingredient)
    @ingredients_required[ingredient]
  end

  def total_calories
    @ingredients.sum do |ingredient|
      ingredient.calories * amount_required(ingredient)
    end
  end

  # def ingredients_by_caloric_addition
  #   ingredients_max_by_calories = @ingredients.sort_by do |ingredient|
  #     ingredient.calories * amount_required(ingredient)
  #   end
  #   ingredients_max_by_calories.reverse
  # end
  #
  # def amount_by_unit(ingredient)
  #   amount_required(ingredient).to_s + " " + ingredient.unit
  # end
  #
  # def ingredients_with_unit_hash
  #   @ingredients.reduce({}) do |ingredients_hash, ingredient|
  # end

end
