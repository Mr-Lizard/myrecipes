class RecipesController < ApplicationController
  
  def new
    @recipe = Recipe.new
  end
  
  
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = Chef.first
    if @recipe.save
      flash[:success] = "Recipe was created successfully"
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end
  
  def edit
    @recipe = Recipe.find(params[:id])
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
       # handle this
       flash[:success] = "Recipe was updated successfully"
       redirect_to recipe_path(@recipe)
    else
        render 'edit'
    end
  end
  
  
private

  def recipe_params
    params.require(:recipe).permit(:name, :description)
  end
  
end
