class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase = Purchase.create(purchase_params)
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
    params.permit(:pos_code, :region_id, :city, :numbering, :building, :tel_number).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
