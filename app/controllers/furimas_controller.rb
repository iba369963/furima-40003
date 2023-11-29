class FurimasController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @furimas = Furima.includes(:user).order("created_at DESC")
  end

  def new
    @furima = Furima.new
  end

  def show
    @furima = Furima.find(params[:id])
  end

  def edit
    @furima = Furima.find(params[:id])
  end

  def update
    @furima = Furima.find(params[:id])
    if @furima.update(furima_params)
      redirect_to furima_path(@furima.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @furima = Furima.new(furima_params)
    if @furima.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def furima_params
    params.require(:furima).permit(
      :image,
      :name,
      :info,
      :category_id,
      :sales_status_id,
      :shipping_fee_status_id,
      :prefecture_id,
      :scheduled_delivery_id,
      :price
    ).merge(user_id: current_user.id)
  end
end
