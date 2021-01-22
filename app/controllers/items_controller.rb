class ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

#  def destroy
#    @item.destroy
#    redirect_to root_path
#  end

  private
  def item_params
    params.require(:item).permit(:image, :title, :price, :explanation, :category_id, :status_id, :delivery_id, :region_id, :mean_id).merge(user_id: current_user.id)
  end

end