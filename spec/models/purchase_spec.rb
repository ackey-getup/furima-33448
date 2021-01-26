require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase)
  end

  it "十分な値が入力された場合購入できる" do
    expect(@purchase).to be_valid
  end

  it "クレジットカード情報が空では登録できないこと" do
    @purchase.token = nil
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("クレジットカード情報を入力してください")
  end

  it "郵便番号が空では登録できない" do
    @purchase.pos_code = nil
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("郵便番号を入力してください")
  end

  it "郵便番号にハイフンがなければ登録できない" do
    @purchase.pos_code = 12345567
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("郵便番号は半角数字で-(ハイフン)を含めて入力してください")
  end

  it "都道府県が空では登録できない" do
    @purchase.region_id = nil
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("都道府県を入力してください")
  end

  it "市区町村が空では登録できない" do
    @purchase.city = nil
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("市区町村を入力してください")
  end

  it "番地が空では登録できない" do
    @purchase.numbering = nil
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("番地を入力してください")
  end

  it "建物名が空でも登録できる" do
    @purchase.building = nil
    expect(@purchase).to be_valid
  end

  it "電話番号が空では登録できない" do
    @purchase.tel_number = nil
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("電話番号を入力してください")
  end

  it "電話番号が全角数字では登録できない" do
    @purchase.tel_number = "０９０１２３４５６７８"
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("電話番号は半角数字で入力してください")
  end
end
  