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
    @wine = Wine.find(params[:id])
  end

  def edit
    @wine = Wine.find(params[:id])
  end

  def update
    @wine = Wine.find(params[:id])
    @wine.update(wine_params)
    redirect_to wine_path(@wine)
  end

  def destroy
    @wine = Wine.find(params[:id])
    @wine.destroy
    redirect_to wines_path
  end

  def search
    @wines = Wine.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end
  private

  def wine_params
    params.require(:wine).permit(:winename,:image,:colour,:comment,:age,:origin,:scent,:taste,:kinds,:rate)
  end
end
