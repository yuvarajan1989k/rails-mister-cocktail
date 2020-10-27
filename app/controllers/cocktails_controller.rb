class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktails = Cocktail.new
  end

  def create 
    @cocktails = Cocktail.new(cocktail_param)
    @cocktails.save
    redirect_to cocktail_path(@cocktails)
  end

  def show 
    @cocktails = Cocktail.find(params[:id])
    @doses = @cocktails.doses
    @ingredients = @cocktails.ingredients
  end

  def edit 
   @cocktails = Cocktail.find(params[:id]) 
  end
  
  def update
    @cocktails = Cocktail.find(params[:id])
    @cocktails.update(cocktail_param)
    redirect_to cocktail_path(@cocktails)
  end
  private

  def cocktail_param
    params.require(:cocktail).permit(:name)
  end
end
