class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:new, :edit, :update, :index, :create]
  before_action :set_ingredients, only: [:index, :create, :update]
  before_action :set_expiring, only: [:expiring, :index]

  def new
    @ingredient = Ingredient.new
  end

  def create
    @pantry = current_user.pantry
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.pantry = @pantry
    @ingredient.in_pantry = true

    if @ingredient.save
      redirect_to ingredients_path, notice: "Ingredient saved"
    else
      render :index, status: :unprocessable_entity
    end
  end

  def index
    @ingredient = Ingredient.new
    if params[:query].present?
      @ingredients = @ingredients.where("name ILIKE ?", "%#{params[:query]}%")
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('search-results', partial: 'ingredients/category', locals: { ingredients: @ingredients })
        end
        format.html
      end
    end
  end

  # Method to display expiring ingredients
  def expiring
  end

  def show
  end

  def edit
  end

  def update
    if @ingredient.update(ingredient_params)
      redirect_to ingredients_path, notice: "Ingredient updated"
    else
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to ingredients_path, notice: "Ingredient deleted"
  end

  private

  def set_expiring
    filter_expiring = current_user.pantry.ingredients.select do |ingredient|
      ingredient.expiration_date.present? && ingredient.expiration_date <= (Date.today + 7)
    end
    @expiring = filter_expiring.sort_by { |ingredient| ingredient.expiration_date }
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def set_ingredients
    @ingredients = current_user.pantry.ingredients.in_pantry
  end

  def set_categories
    @categories = Category.all
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :amount, :unit, :expiration_date, :category_id, :in_pantry, :pantry_id)
  end
end
