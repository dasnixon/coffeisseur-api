class RoastsController < ApplicationController
  before_action :lookup_roast, only: [:show, :update]

  def index
    roasts = policy_scope(Roast)
    render json: roasts
  end

  def show
    render json: @roast
  end

  def create
    roast = Roast.new(permitted_attributes(Roast))
    if roast.save
      render json: roast
    else
    end
  end

  def update
    @roast.update(permitted_attributes(@roast))
  end

  private

  def lookup_roast
    @roast = policy_scope(Roast).find(params[:id])
  end
end
