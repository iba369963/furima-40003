class LogsController < ApplicationController
  before_action :authenticate_user!, except: :index


  def index
    @order = Order.new
    @furima = Furima.find(params[:furima_id])
  end

  def create
    @furima = Furima.find(params[:furima_id])
    @order = Order.new(log_params)
  
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      # エラー処理を行う
      render :index, status: :unprocessable_entity
    end
  end

  private

  def log_params

    params.permit(
      :postal_code,
      :prefecture_id,
      :city,
      :addresses,
      :home_name,
      :phone_number
    ).merge(user_id: current_user.id, furima_id: @furima.id)  end
end
