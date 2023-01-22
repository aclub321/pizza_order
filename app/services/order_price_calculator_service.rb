class OrderPriceCalculatorService
  def initialize(order)    
    @order = order
    @total_price = 0

    @config ||= YAML.load_file('config/pizza_config.yml')
  end

  def calculate
    @total_price += calculate_all_pizzas_price

    @total_price -= calculate_promotions_price

    @total_price -= calculate_discount_price

    @total_price
  end

  private

  def calculate_all_pizzas_price
    price = 0

    @order.pizzas.each do |pizza|
      price += calculate_pizza_price(pizza.pizza_type, pizza.pizza_size)

      price += extra_ingredients_price(pizza)
    end

    price
  end

  def calculate_pizza_price(pizza_type, pizza_size)
    @config['pizzas'][pizza_type] * @config['size_multipliers'][pizza_size]
  end

  def extra_ingredients_price(pizza)
    price = 0

    pizza.pizza_ingredients.added.each do |pizza_ingredient|
      price += extra_ingredient_price(pizza, pizza_ingredient)
    end

    price
  end

  def extra_ingredient_price(pizza, pizza_ingredient)
    @config['ingredients'][pizza_ingredient.ingredient.name] *
      @config['size_multipliers'][pizza.pizza_size]
  end
  
  def calculate_promotions_price
    price = 0

    @order.promotion_codes.each do |promotion_code|
      price += calculate_promotion_price(promotion_code)
    end

    price
  end

  def calculate_promotion_price(promotion_code)
    promotion_criteria = @config['promotions'][promotion_code.code]

    pizza_type = promotion_criteria['target']
    pizza_size = promotion_criteria['target_size']

    pizza_count = @order.pizzas
                        .filter_by_pizza_type(pizza_type)
                        .filter_by_pizza_size(pizza_size)
                        .count

    promotion_count = pizza_count / promotion_criteria['from']

    return if promotion_count.zero?

    no_of_pizzas_to_deduct = 
      promotion_count * (promotion_criteria['from'] - promotion_criteria['to'])

    price = 0
    
    no_of_pizzas_to_deduct.times do
      price += calculate_pizza_price(pizza_type, pizza_size)    
    end

    price
  end

  def calculate_discount_price
    return 0 if @order.discount_code.nil?

    discount_percentage = 
      @config['discounts'][@order.discount_code]['deduction_in_percent'].to_d / 100

    @total_price * discount_percentage
  end
end
