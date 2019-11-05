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
end
