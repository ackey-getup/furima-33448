class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new
    if current_user.id == @item.user_id || @item.purchase_history.present?
      redirect_to root_path
    end
  end

  def create
    @purchase = Order.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render :index 
    end
  end

  private

  def purchase_params
    @item = Item.find(params[:item_id])
    params.permit(:pos_code, :region_id, :city, :numbering, :building, :tel_number).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,              # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                   # 通貨の種類（日本円）
    )
  end
end
