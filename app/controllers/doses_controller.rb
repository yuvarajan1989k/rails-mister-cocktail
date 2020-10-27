class DosesController < ApplicationController
  
  before_action :find_cocktail 

  def new
    @dose = Dose.new 
  end

  def create
    @dose = Dose.new(dose_param)
    @dose.cocktail = @cocktail
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  def show 
    @doses = Dose.find(params[:id])
  end
  
  def edit 
    @doses = Dose.find(params[:id])
  end
  private
  def dose_param
    params.require(:dose).permit(:name, :ingredient_id)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
