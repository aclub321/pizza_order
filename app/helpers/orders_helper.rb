module OrdersHelper
  def format_date(date_obj)
    date_obj.strftime('%B %d, %Y %H:%M')
  end

  def display_added_ingredients(added_ingredients)    
    "Add: #{construct_ingredients_string(added_ingredients)}"
  end

  def display_removed_ingredients(removed_ingredients)    
    "Remove: #{construct_ingredients_string(removed_ingredients)}"
  end

  def construct_ingredients_string(pizza_ingredients)
    result = ""

    pizza_ingredients.each do |pizza_ingredient|
      result += "#{pizza_ingredient.ingredient.name}, "
    end

    result.chomp!(', ') if result.present?

    result
  end
end
