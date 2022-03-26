# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
recipes = Recipe.create!(
    [
        {
            id: 1,
            title: 'Chicken Curry',
            making_time: '45 min',
            serves: '4 people',
            ingredients: 'onion, chicken, seasoning',
            cost: 1000,
            created_at: '2016-01-10 12:10:12',
            updated_at: '2016-01-10 12:10:12'
        },
        {
            id: 2,
            title: 'Rice Omelette',
            making_time: '30 min',
            serves: '2 people',
            ingredients: 'onion, egg, seasoning, soy sauce',
            cost: 700,
            created_at: '2016-01-11 13:10:12',
            updated_at: '2016-01-11 13:10:12'
        }
    ]
)
