class BicyclesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  def index
    @bicycles = Bicycle.all
    if params[:model] || params[:style] || params[:price_min_bound] || params[:price_max_bound]
      @bicycles = Bicycle.filter(params[:model], params[:style], params[:price_min_bound], params[:price_max_bound])
    else
      @bicycles = Bicycle.all
    end
  end

  def show
    @bicycle = Bicycle.find(params[:id])
  end

  # private

  # def filter_params
  #   params.permit(:model, :style, :price)
  # end
end
