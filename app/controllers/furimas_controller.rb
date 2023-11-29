class FurimasController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :check_owner, only: [:edit, :update]
  before_action :set_furima, only: [:show, :edit, :update, :destroy]

  def index
    @furimas = Furima.includes(:user).order("created_at DESC")
  end

  def new
    @furima = Furima.new
  end

  def show

  end

  def edit

  end

  def update

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

  def destroy
    @furima.destroy
    if current_user == @furima.user
      @furima.destroy
    end
    redirect_to root_path
  end

  private

  def set_furima
    @furima = Furima.find(params[:id])
  end

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

  def check_owner
    furima = Furima.find(params[:id])
    redirect_to root_path unless current_user == furima.user
  end
end
