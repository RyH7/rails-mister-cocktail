class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
    @ingredients = Ingredient.all

  end

  def create
    @cocktail = Cocktail.new(strong_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail), notice: 'New cocktail created:)'
    else
      render :new
    end
  end

  def strong_params
    params.require(:cocktail).permit(:name)
  end
end
