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
    if params[:latest]
      @wines = Wine.latest
    elsif params[:old]
      @wines = Wine.old
    elsif params[:rate_count]
      @wines = Wine.rate_count
    else
      @wines = Wine.all
    end
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
