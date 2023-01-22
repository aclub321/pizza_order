# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

order1 = Order.create
Pizza.create(pizza_type: :Tonno, pizza_size: :Large, order: order1)

order2 = Order.create
order2_pizza1 = Pizza.create(pizza_type: :Margherita, pizza_size: :Large, order: order2)
order2_pizza2 = Pizza.create(pizza_type: :Tonno, pizza_size: :Medium, order: order2)
_order2_pizza3 = Pizza.create(pizza_type: :Margherita, pizza_size: :Small, order: order2)

onion = Ingredient.create(name: :Onions)
cheese = Ingredient.create(name: :Cheese)
olive = Ingredient.create(name: :Olives)

PizzaIngredient.create(state: :add, ingredient: onion, pizza: order2_pizza1)
PizzaIngredient.create(state: :add, ingredient: cheese, pizza: order2_pizza1)
PizzaIngredient.create(state: :add, ingredient: olive, pizza: order2_pizza1)

PizzaIngredient.create(state: :remove, ingredient: onion, pizza: order2_pizza2)
PizzaIngredient.create(state: :remove, ingredient: olive, pizza: order2_pizza2)

order3 = Order.create(discount_code: :SAVE5)
PromotionCode.create(code: '2FOR1', order: order3)
order3_pizza1 = Pizza.create(pizza_type: :Salami, pizza_size: :Medium, order: order3)
_order3_pizza2 = Pizza.create(pizza_type: :Salami, pizza_size: :Small, order: order3)
_order3_pizza3 = Pizza.create(pizza_type: :Salami, pizza_size: :Small, order: order3)
_order3_pizza4 = Pizza.create(pizza_type: :Salami, pizza_size: :Small, order: order3)
order3_pizza5 = Pizza.create(pizza_type: :Salami, pizza_size: :Small, order: order3)

PizzaIngredient.create(state: :add, ingredient: onion, pizza: order3_pizza1)
PizzaIngredient.create(state: :remove, ingredient: cheese, pizza: order3_pizza1)
PizzaIngredient.create(state: :add, ingredient: olive, pizza: order3_pizza5)
