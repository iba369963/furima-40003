class LogsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_furima_owner, only: [:index, :edit]

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
  
  def check_furima_owner
    @furima = Furima.find(params[:furima_id])

    if user_signed_in?
      # ログイン状態の場合
      case action_name
      when "index"
        # 商品購入ページにアクセスしようとした場合
        redirect_to root_path unless current_user != @furima.user && !@furima.sold_out?
      # when "edit"
      #   # 商品情報編集ページにアクセスしようとした場合
      #   redirect_to root_path unless current_user != @furima.user || @furima.sold_out?
      end
    else
      # ログアウト状態の場合
      redirect_to new_user_session_path
    end
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
