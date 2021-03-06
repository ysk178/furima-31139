require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end
    
    it 'postal_codeが空だと保存できないこと' do
      @order_address.postal_code = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
    end

    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_address.postal_code = 1234567
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid")
    end
    
    it 'prefectureが空だと保存できないこと' do 
      @order_address.prefecture_id=""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
    end

    it 'prefectureが１だと保存できないこと' do
      @order_address.prefecture_id=1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
    end
    
    it 'municipalityが空だと保存できないこと' do
      @order_address.municipality = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
    end
    
    it 'addressが空だと保存できないこと' do
      @order_address.address = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address can't be blank")
    end
    
    it 'buildingは空でも保存できること' do
      @order_address.building = ""
      expect(@order_address).to be_valid
    end
    
    it 'phone_numberが空だと保存できないこと' do
      @order_address.phone_number = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
    end

    it 'phone_numberが12桁だと保存できないこと' do
      @order_address.phone_number = "090123456789"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end

    it "tokenが空では登録できないこと" do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end