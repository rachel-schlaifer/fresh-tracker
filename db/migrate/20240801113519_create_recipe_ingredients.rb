class CreateRecipeIngredients < ActiveRecord::Migration[7.1]
  def change
    create_table :recipe_ingredients do |t|
      t.references :ingredient, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true
      t.references :shopping_list, null: false, foreign_key: true
      t.float :amount
      t.string :unit

      t.timestamps
    end
  end
end
