class DosesController < ApplicationController
  def new
    @dose = Dose.new
  end

  def create
      @dose = Dose.new(strong_params)
      cocktail = Cocktail.find(params[:cocktail_id])
      @dose.cocktail = cocktail
      ingredient = Ingredient.find(params[:dose][:ingredient_id])
      @dose.ingredient = ingredient
    if @dose.save
      redirect_to cocktail_path(cocktail), notice: 'New dose created:)'
    else
      render :new
    end
  end

  def destroy
    # find review to destroy first
    @dose = Dose.find(params[:id])
    # connect review to a specific restaurant
    @restaurant = @dose.restaurant
    # delete review
    @dose.destroy
    # go back to show page
    redirect_to restaurant_path(@restaurant)
  end

   def strong_params
    params[:dose].permit(:description)
  end
end
