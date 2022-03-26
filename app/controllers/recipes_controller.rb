class RecipesController < ApplicationController

    def index
        @recipes = Recipe.all
        res = {recipes: @recipes.as_json}
        render json: res
    end

    def show
        @recipe = Recipe.find_by(id: params[:id])
        render json: {}, status: 404 and return if @recipe.nil?

        res = {
            message: "Recipe details by id",
            recipe: [@recipe.as_json]
        }
        render json: res
    end

    def create
        params.permit(:title, :making_time, :serves, :ingredients, :cost)

        # if all contains
        required_fields = [:title, :making_time, :serves, :ingredients, :cost]

        error = {
            message: "Recipe creation failed!",
            required: "title, making_time, serves, ingredients, cost"
        }
        render json: error, status: 200 and return unless required_fields.all? { |f| params.has_key?(f) }

        # create model
        recipe = Recipe.new(
            title: params[:title],
            making_time: params[:making_time],
            serves: params[:serves],
            ingredients: params[:ingredients],
            cost: params[:cost]
        )
        recipe.save
        recipe = Recipe.find_by(id: recipe.id)
        recipe.update!(
            title: params[:title],
            making_time: params[:making_time],
            serves: params[:serves],
            ingredients: params[:ingredients],
            cost: params[:cost]
        )
        message = {
            message: "Recipe successfully created!",
            recipe: [recipe.json_all]
        }
        render json: message
    end

    def update
        @recipe = Recipe.find_by(id: params[:id])
        render json: {}, status: 404 and return if @recipe.nil?

        params.permit(:title, :making_time, :serves, :ingredients, :cost)

        fields = [:title, :making_time, :serves, :ingredients, :cost]
        hash = fields.map { |k| [k, params[k]] unless params[k].nil?}.compact.to_h
        @recipe.update(
            hash
        )
        message = {
            message: "Recipe successfully updated!",
            recipe: [@recipe.as_json]
        }
        render json: message
    end

    def destroy
        @recipe = Recipe.find_by(id: params[:id])
        render json: {message: "No recipe found"}, status: 404 and return if @recipe.nil?

        @recipe.destroy
        render json: { message: "Recipe successfully removed!" }
    end
end
