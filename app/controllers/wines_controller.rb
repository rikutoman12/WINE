class WinesController < ApplicationController
   def new
    @wine = Wine.new
  end

  def create
    @wine = Wine.new(wine_params)
    @wine.save
    redirect_to wines_path
  end

  def index
    @wines = Wine.all
  end

  def show
  end

  def destroy
  end

  private

  def wine_params
    params.require(:wine).permit(:image,:colour,:comment,:age,:origin,:scent,:taste,:kinds)
  end
end
