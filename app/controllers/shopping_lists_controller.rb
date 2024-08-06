class ShoppingListsController < ApplicationController
  before_action :set_shopping_list, only: [:index, :create]

  def new
    @recipe_ingredient = RecipeIngredient.new
  end

  def create
    @recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params)
    @recipe_ingredient.shopping_list = @shopping_list
    if @recipe_ingredient.save
      redirect_to shopping_lists_path, notice: "Item added successfully"
    else
      puts @recipe_ingredient.errors.full_messages
      render :new
    end
  end

  private

  def set_shopping_list
    @shopping_list = current_user.shopping_list
  end

  def recipe_ingredient_params
    params.require(:recipe_ingredient).permit(:name, :amount, :unit, :expiration_date, :category_id, :in_pantry, :pantry_id)
  end
end
