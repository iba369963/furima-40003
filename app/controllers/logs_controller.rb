class LogsController < ApplicationController
  before_action :authenticate_user!, except: :index


  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order = Order.new
    @furima = Furima.find(params[:furima_id])
  end

  def create
    @furima = Furima.find(params[:furima_id])
    @order = Order.new(log_params)
  
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      # エラー処理を行う
      render :index, status: :unprocessable_entity
    end
  end

  private

  def log_params

    params.require(:order).permit(
      :postal_code,
      :prefecture_id,
      :city,
      :addresses,
      :home_name,
      :phone_number
    ).merge(user_id: current_user.id, furima_id: @furima.id, token: params[:token])
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @furima.price,  # 商品の値段
    card: log_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
  end
end
