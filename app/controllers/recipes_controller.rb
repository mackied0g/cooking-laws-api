class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show]

  # GET /recipes
  def index
   @recipes = Recipe.all
   render(json: @recipes)
  end

  # GET /recipes/1
  def show
   render(json: @recipe)
  end
  
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
   @recipe = Recipe.find(params[:id])
  end
  # Only allow a trusted parameter “white list” through.
  def recipe_params
  params.require(:recipe).permit(:name, :description, :yield, :ingredients, :instructions, :law_id)
  end
  
end
