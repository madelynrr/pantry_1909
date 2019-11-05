class CookBook

  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def summary
  end
end


# have array of recipes
# for each recipe, return hash of information
  # :name = "name"
  # :details another hash
    # :ingredients = array of ingredients
      #each ingredient as hash, :ingredient = "name", :amount = needed for recipe
