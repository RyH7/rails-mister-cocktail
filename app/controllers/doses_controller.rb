class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create

    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(strong_params)
    @dose.cocktail = @cocktail
    # below include if ingredient_id not provided in line 47
    # @ingredient = Ingredient.find(params[:dose][:ingredient_id])
    # @dose.ingredient = @ingredient
    if @dose.save
      redirect_to cocktail_path(@cocktail), notice: 'New dose created:)'
    else
      render :new
    end
  end

  # def create
  #     @cocktail = Cocktail.find(params[:cocktail_id])
  #     @dose = Dose.new(dose_params)
  #     @dose.cocktail = @cocktail
  #     if @dose.save
  #       redirect_to cocktail_path(@cocktail)
  #     else
  #       @review = Review.new
  #       render "cocktails/show"
  #     end
  #   end

  def destroy
    # find review to destroy first
    @dose = Dose.find(params[:id])
    # connect dose to a specific cocktail
    @cocktail = @dose.cocktail
    # delete dose
    @dose.destroy
    # go back to Cocktail#show page
    redirect_to cocktail_path(@cocktail)
  end

  def strong_params
    params[:dose].permit(:description, :ingredient_id)
  end
end
