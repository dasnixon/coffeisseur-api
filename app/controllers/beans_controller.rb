class BeansController < ApplicationController
  before_action :lookup_bean, only: [:show, :update]

  def index
    beans = policy_scope(Bean)
    render json: beans
  end

  def show
    render json: @bean
  end

  def create
    bean = Bean.new(permitted_attributes(Bean))
    if bean.save
      render json: bean
    else
    end
  end

  def update
    @bean.update(permitted_attributes(@bean))
  end

  private

  def lookup_bean
    @bean = policy_scope(Bean).find(params[:id])
  end
end
